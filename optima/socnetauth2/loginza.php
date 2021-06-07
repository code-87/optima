<?php
require_once('../config.php');
require_once('lib/db.php');
require_once('lib/socnetauth2.php');
session_start(); 
$SocAuth = new SocAuth();
$SocAuth->setGroupName();
$protokol = $SocAuth->getProtokol(); 

if( empty($_POST['token']) ) 
{
	if( !empty($_SERVER['HTTP_REFERER']) )
		$url = "Location: ".$_SERVER['HTTP_REFERER'];
	else 
		$url = '/';
	
	header($url);
	exit();
}

$TOKEN = $_POST['token'];
$url = "http://loginza.ru/api/authinfo?token=".$TOKEN;
		
if( extension_loaded('curl') )
{
	$c = curl_init($url);
		curl_setopt($c, CURL_VERSION_IPV6, true);
		curl_setopt($c, CURL_VERSION_KERBEROS4, false);
		curl_setopt($c, CURL_VERSION_SSL, true);
		curl_setopt($c, CURL_VERSION_LIBZ, true);
		curl_setopt($c, CURLOPT_VERBOSE, true);
		curl_setopt($c, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
	$page = curl_exec($c);
	curl_close($c);
}
else
{
	$page = file_get_contents($url);
}
		
if( empty($page) )
{
	exit('error connection');
}
		
$arr = json_decode($page, true);
/* start 0306 */
$userdata = $arr;
foreach($userdata as $key=>$val)
{
	if( is_array($val) )
	{
		$userdata[$key] = print_r($val, 1);
	}
}
/* end 0306 */
		
if( empty($arr['provider']) ) 
{
	exit('ERROR DATA: '.$page);
}
		
if( !empty($arr['error_type']) )
{
	exit($arr['error_type']." - ".$arr['error_message']);
}

if( empty($arr['identity']) ) exit('not identity');
		
$provider = '';
		
if( strstr($arr['provider'], "facebook") )
	$provider = "facebook";
elseif( strstr($arr['provider'], "vk.com") )
	$provider = "vkontakte";
elseif( strstr($arr['provider'], "google") )
	$provider = "gmail";
elseif( strstr($arr['provider'], "twitter") )
	$provider = "twitter";
elseif( strstr($arr['provider'], "odnoklassniki") )
	$provider = "odnoklassniki";
elseif( strstr($arr['provider'], "mail.ru") )
	$provider = "mailru";
elseif( strstr($arr['provider'], "yandex") )
	$provider = "yandex";
elseif( strstr($arr['provider'], "steam") )
	$provider = "steam";

$IS_DEBUG = $SocAuth->get_config_param('socnetauth2_'.$provider.'_debug');
	
if( $IS_DEBUG )
{
	foreach($arr as $key=>$val)
	{
		if( is_array($val) )
		{
			echo $key.' - array<br>';
			foreach($val as $k=>$v)
			{
				if(  is_array( $v ) )
				{
					echo $k.' - array<br>';
					foreach($v as $k1=>$v1)
					{
						echo "--- ".$k1." - ".$v1."<br>";
					}
				}
				else
				{
					echo "--- ".$k.' - '.$v.'<br>';
				}
			}
		}
		else
		{
			echo $key." - ".$val."<br>";
		}		
	}
}

//////////////////////////////

$data = array(
	'identity'  => !empty($arr['uid']) ? $arr['uid'] : $arr['identity'],		
	'link' 		=> '',
	'firstname' => '',
	'lastname'  => '',
	'email'     => '',
	'telephone'	=> '',
	'data'		=> serialize($arr),
	'provider'  => $provider
);

if( $provider == 'steam' )
{
	$data['identity'] = str_replace("https://steamcommunity.com/openid/id/", "", $data['identity']);
}


if( !empty( $arr['name']['first_name'] ) || !empty( $arr['name']['last_name'] ) )
{
	if( !empty( $arr['name']['first_name'] ) )
		$data['firstname'] = $arr['name']['first_name'];
	
	if( !empty( $arr['name']['last_name'] ) )
		$data['lastname'] = $arr['name']['last_name'];
}
elseif( !empty( $arr['name']['full_name'] ) )
{
	$ar = explode(' ', $arr['name']['full_name']);
	 
	if( !empty($ar[0]) )
		$data['firstname'] = $ar[0];

	if( !empty($ar[1]) )
		$data['lastname'] = $ar[1];
}

if( !empty($arr['email']) )
	$data['email'] = $arr['email'];

$data['link'] = $SocAuth->getLink($data, $arr);
		
$data['company'] = '';
$data['address_1'] = '';
$data['postcode'] = '';
$data['city'] = '';
$data['zone'] = '';
$data['country'] = '';

$CURRENT_URI = $SocAuth->getSessionData('socnetauth2_lastlink');

		if( $SocAuth->get_config_param('socnetauth2_add_param') )
		{
			if( strstr($CURRENT_URI, '?') )
				$CURRENT_URI .= '&sna=1';
			else
				$CURRENT_URI .= '?sna=1';
		}
		
if( $customer_id = $SocAuth->checkNew($data) )
{
	if( $SocAuth->get_config_param('socnetauth2_dobortype') != 'every' )
	{
		$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 
		$SocAuth->setSessionData('socnetauth2_confirmdata_show', 0);
		
		if( $IS_DEBUG ) exit( "END-1 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
		
		header("Location: ".$CURRENT_URI ); 
	}
	else
	{
		if( $confirm_data = $SocAuth->isNeedConfirm( $data ) )
		{
			$data['customer_id'] = $customer_id;
			$confirm_data['data'] = $data;
			$SocAuth->setSessionData('socnetauth2_confirmdata', serialize($confirm_data));
			$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
			$SocAuth->setSessionData('socnetauth2_confirmdata_rawdata', serialize($userdata)); 

			if( $IS_DEBUG ) exit( "END-2 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
		
			header("Location: ".$CURRENT_URI ); 
		}
		else
		{
			$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 
			$SocAuth->setSessionData('socnetauth2_confirmdata_show', 0);
			
			if( $IS_DEBUG ) exit( "END-3 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
		
			header("Location: ".$CURRENT_URI ); 
		}
	}
}
else
{
	$confirm_data = $SocAuth->isNeedConfirm( $data );

	if( !$SocAuth->get_config_param('socnetauth2_email_auth') || $SocAuth->get_config_param('socnetauth2_email_auth') == 'none' )
	{
		if( $confirm_data )
		{
			$confirm_data['data'] = $data;
			$SocAuth->setSessionData('socnetauth2_confirmdata_rawdata', serialize($userdata)); 
			
			$SocAuth->setSessionData('socnetauth2_confirmdata', serialize($confirm_data));
			$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
				
			if( $IS_DEBUG ) exit( "END-4 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
			
			header("Location: ".$CURRENT_URI ); 
		}
		else
		{
			$SocAuth->setSessionData('socnetauth2_confirmdata', '');
			$SocAuth->setSessionData('socnetauth2_confirmdata_show', '');
			
			$customer_id = $SocAuth->addCustomer( $data );
			$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 	
			$SocAuth->addCustomerComment( $customer_id, $provider, $userdata );
			
			
			if( $IS_DEBUG ) exit( "END-5 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
			
			header("Location: ".$CURRENT_URI ); 
		}
	}
	elseif( $SocAuth->get_config_param('socnetauth2_email_auth') == 'confirm'  )
	{
		// требуется добор данных
		if( $confirm_data )
		{
			$confirm_data['data'] = $data;
			$SocAuth->setSessionData('socnetauth2_confirmdata_rawdata', serialize($userdata)); 
			$SocAuth->setSessionData('socnetauth2_confirmdata', serialize($confirm_data));
			$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
				
			if( $IS_DEBUG ) exit( "END-6 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
			
			header("Location: ".$CURRENT_URI ); 
		}
		// Получен E-mail и включено проверка email письмом
		elseif( !empty( $data['email'] ) && $SocAuth->checkByEmail($data, 0) )
		{
			include(DIR_SYSTEM.'library/mail.php');
				
			$SocAuth->sendConfirmEmail($data);
			$SocAuth->setSessionData('socnetauth2_confirmdata', serialize(array(1, 2, 3, 4, $data['email'], $data['identity'], $data['link'], $data['provider'], $data)));
			$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
					$SocAuth->setSessionData('controlled_email', $data['email']);
		
					
				
			if( $IS_DEBUG ) exit( "END-7 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
			
			header("Location: ".$CURRENT_URI );
		}
		elseif( empty( $data['email'] ) ||
			 ( !empty( $data['email'] ) && !$SocAuth->checkByEmail($data, 0) ) )
		{
			$SocAuth->setSessionData('socnetauth2_confirmdata', '');
			$SocAuth->setSessionData('socnetauth2_confirmdata_show', '');
			
			$customer_id = $SocAuth->addCustomer( $data );
			$SocAuth->addCustomerComment( $customer_id, $provider, $userdata );
			$SocAuth->setSessionData('customer_id', $customer_id, 1);	
					$SocAuth->setSessionCode( $customer_id ); 
			
			if( $IS_DEBUG ) exit( "END-8 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
			
			header("Location: ".$CURRENT_URI ); 
		}
	}
	elseif( $SocAuth->get_config_param('socnetauth2_email_auth') == 'noconfirm'  )
	{
		// требуется добор данных
		if( $confirm_data )
		{
				$confirm_data['data'] = $data;
				$SocAuth->setSessionData('socnetauth2_confirmdata', serialize($confirm_data));
				$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
				$SocAuth->setSessionData('socnetauth2_confirmdata_rawdata', serialize($userdata)); 
				
				if( $IS_DEBUG ) exit( "END-9 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
			
			header("Location: ".$CURRENT_URI ); 
		}
		// Получен E-mail 
		elseif( !empty( $data['email'] ) && $customer_id = $SocAuth->checkByEmail($data, 1) )
		{
				$SocAuth->setSessionData('socnetauth2_confirmdata', '');
				$SocAuth->setSessionData('socnetauth2_confirmdata_show', '');
				$SocAuth->setSessionData('customer_id', $customer_id, 1);	
					$SocAuth->setSessionCode( $customer_id ); 
			
				if( $IS_DEBUG ) exit( "END-10 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля" );
			
				header("Location: ".$CURRENT_URI );
		}
		//Получен e-mail и он уникальный 
		elseif( empty( $data['email'] ) ||
				 ( !empty( $data['email'] ) && !$SocAuth->checkByEmail($data, 0) ) )
		{
				$SocAuth->setSessionData('socnetauth2_confirmdata', '');
				$SocAuth->setSessionData('socnetauth2_confirmdata_show', '');
			
				$customer_id = $SocAuth->addCustomer( $data );
				$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 	
				$SocAuth->addCustomerComment( $customer_id, $provider, $userdata );
					
				if( $IS_DEBUG ) exit( "END-11 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке соц.сети в настройках модуля");
			
				header("Location: ".$CURRENT_URI ); 
		}	
	}
}

	