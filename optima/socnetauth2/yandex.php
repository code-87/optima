<?php
require_once('../config.php');

require_once('lib/db.php');
require_once('lib/socnetauth2.php');
session_start();

$SocAuth = new SocAuth(); 
$SocAuth->setGroupName();
$protokol = $SocAuth->getProtokol(); 

/* start r3 */
$IS_DEBUG = $SocAuth->get_config_param('socnetauth2_yandex_debug');

if( !$SocAuth->get_config_param('socnetauth2_yandex_status') )
{
	$url = "Location: ".$_SERVER['HTTP_REFERER'];
	
	if($IS_DEBUG)
	{
		if( strstr($url, "?") )
		{
			$url .= '&error=1';
		}
		else
		{
			$url .= '?error=1';
		}
	}
	
	header($url);
	exit();
}
/* end r3 */

if( !empty($_GET['first']) )
{
	$CLIENT_ID = $SocAuth->get_config_param('socnetauth2_yandex_client_id');
	$rights_email = $SocAuth->get_config_param('socnetauth2_yandex_rights_email');
	$rights_info = $SocAuth->get_config_param('socnetauth2_yandex_rights_info');
	
	$CURRENT_URI = $_SERVER['HTTP_REFERER'];
	
	if( strstr($CURRENT_URI, 'logout') )
	{
		
		$CURRENT_URI = preg_replace("/index\.php\?route\=account\/logout$/", 
									"", $CURRENT_URI);
		
		$CURRENT_URI = str_replace("logout", "", $CURRENT_URI);
		$CURRENT_URI = preg_replace("/\/+$/", "/", $CURRENT_URI);
	}
	
	$CURRENT_URI = str_replace("?socnetauth2close=1", "", $CURRENT_URI);
	$CURRENT_URI = str_replace("&socnetauth2close=1", "", $CURRENT_URI);
	
	
	$socnetauth2_shop_folder = $SocAuth->getShopFolder(); 
	
	$REDIRECT_URI = $protokol.$_SERVER['HTTP_HOST'].$socnetauth2_shop_folder.'/socnetauth2/yandex.php';
		
	$STATE = 'yandex_socnetauth2_'.rand();
	$SocAuth->setRecord($STATE, $CURRENT_URI);

	setcookie("ya_state", $STATE, time()+3600, "/" ); 
	
	$scopes = array();
	if( $rights_email )  $scopes[] = 'login:email';
	if( $rights_info )  $scopes[] = 'login:info';
	
	if(empty($scopes))
		exit('error: no rights selected');
	
	$url = 'https://oauth.yandex.ru/authorize?'.
			'response_type=code'.
			'&client_id='.$CLIENT_ID.
			'&scope='.implode("+", $scopes);
	
	header("Location: ".$url);
	exit();
}

if( !empty($_GET['error']) && !empty( $_COOKIE['ya_state'] ) &&
	$recordData = $SocAuth->getRecord( $_COOKIE['ya_state'] ) )
{
	if($IS_DEBUG)
	{
		if( strstr($recordData['redirect'], "?") )
		{
			$recordData['redirect'] .= '&error=2';
		}
		else
		{
			$recordData['redirect'] .= '?error=2';
		}
	}
	
	header("Location: ".$recordData['redirect']);
}


if( !empty( $_GET['code'] ) && !empty( $_COOKIE['ya_state'] ) &&
	$recordData = $SocAuth->getRecord( $_COOKIE['ya_state'] ) )
{
	if($IS_DEBUG)
	{
		echo "M2<hr>";
	}
	$CODE = $_GET['code'];
	
	$CURRENT_URI = $recordData['redirect'];
	$CURRENT_URI = str_replace("?socnetauth2close=1", "", $CURRENT_URI);
	$CURRENT_URI = str_replace("&socnetauth2close=1", "", $CURRENT_URI);
	
	$socnetauth2_shop_folder = $SocAuth->getShopFolder(); 
	$REDIRECT_URI = $protokol.$_SERVER['HTTP_HOST'].$socnetauth2_shop_folder.'/socnetauth2/yandex.php';
	
	
	$CLIENT_ID = $SocAuth->get_config_param('socnetauth2_yandex_client_id');
	$CLIENT_SECRET = $SocAuth->get_config_param('socnetauth2_yandex_client_secret');
	
	
	$url = "https://oauth.yandex.ru/token";
	$params = "grant_type=authorization_code".
	"&code=".$_GET['code'].
	"&client_id=".$CLIENT_ID.
	"&client_secret=".$CLIENT_SECRET;
	
	 
	if($IS_DEBUG)
	{
		echo "M3: ".$params."<hr>";
	}
	
	$c = curl_init($url);
	curl_setopt($c, CURLOPT_POST      ,1);
	curl_setopt($c, CURLOPT_POSTFIELDS    , $params);
		curl_setopt($c, CURL_VERSION_IPV6, true);
		curl_setopt($c, CURL_VERSION_KERBEROS4, false);
		curl_setopt($c, CURL_VERSION_SSL, true);
		curl_setopt($c, CURL_VERSION_LIBZ, true);
		curl_setopt($c, CURLOPT_VERBOSE, true);
		curl_setopt($c, CURLOPT_SSL_VERIFYPEER, false);
	#curl_setopt($ch, CURLOPT_FOLLOWLOCATION  ,1);
	#curl_setopt($ch, CURLOPT_HEADER      ,0);  // DO NOT RETURN HTTP HEADERS
	curl_setopt($c, CURLOPT_RETURNTRANSFER  ,1);  // RETURN THE CONTENTS OF THE CALL
	#curl_setopt($ch, CURLOPT_USERPWD, $CLIENT_ID.":".$CLIENT_SECRET); //Your credentials goes here

	$response = curl_exec($c);
	curl_close($c);
	
 
	if( $IS_DEBUG ) echo "M4: ".$response."<hr>";
	
	
	$data = json_decode($response, true);
	$email = '';
	
	if( !empty($data['access_token']) )
	{
		$graph_url = "https://login.yandex.ru/info?format=json&with_openid_identity=1";
		
		if( $IS_DEBUG ) echo "M5: ".$graph_url."<hr>";
		
		$c = curl_init($graph_url);
			
		curl_setopt($c, CURLOPT_SSL_VERIFYPEER, FALSE);     
		curl_setopt($c, CURLOPT_SSL_VERIFYHOST, 2); 
		curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($c, CURLOPT_HTTPHEADER, 
			array('Authorization: OAuth '.$data['access_token'])
		);

		$json = curl_exec($c);
		curl_close($c);
		
		
		
		if( $IS_DEBUG ) echo "M7: ".$json."<hr>";
		$response = json_decode($json, TRUE);
		
		$provider = 'yandex';
		
		$arr = array(
			'identity' => $response['id'],
			'firstname' => !empty($response['first_name']) ? $response['first_name'] : '',
			'lastname'  => !empty($response['last_name']) ? $response['last_name'] : '',
			'email'     => !empty($response['emails'][0]) ? $response['emails'][0] : '',
			'telephone'	=> ''
		);
		
		$data = array(
			'identity'  => $arr['identity'],
			'link' 		=> $response['openid_identities'][0],
			'firstname' => '',
			'lastname'  => '',
			'email'     => '',
			'telephone'	=> '',
			'data'		=> serialize($response),
			'provider'  => $provider
		);
		
		if( !empty( $arr['firstname'] ) )
		{
			$data['firstname'] = $arr['firstname'];
		}
		
		if( !empty( $arr['lastname'] ) )
		{
			$data['lastname'] = $arr['lastname'];
		}
		
		if( !empty( $arr['email'] ) )
		{
			$data['email'] = $arr['email'];
		}
		
		if( !empty( $arr['telephone'] ) )
		{
			$data['telephone'] = $ar['telephone'];
		}
		
		$data['company'] = '';
		$data['address_1'] = '';
		$data['postcode'] = '';
		$data['city'] = '';
		$data['zone'] = '';
		$data['country'] = '';
		
		///////////////////////////////////////
		
		$userdata = $response;
		foreach($userdata as $key=>$val)
		{
			if( is_array($val) )
			{
				$userdata[$key] = print_r($val, 1);
			}
		}
		
		if( $SocAuth->get_config_param('socnetauth2_add_param') )
		{
			if( strstr($CURRENT_URI, '?') )
				$CURRENT_URI .= '&sna=1';
			else
				$CURRENT_URI .= '?sna=1';
		}
		
		$SocAuth->checkDB();
		
		if( $customer_id = $SocAuth->checkNew($data) )
		{
			if( $SocAuth->get_config_param('socnetauth2_dobortype') != 'every' )
			{
				$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 
				$SocAuth->setSessionData('socnetauth2_confirmdata_show', 0);
				
				if( $IS_DEBUG ) exit( "END-1 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
				header("Location: ".$CURRENT_URI ); 
			}
			else
			{
				if( $confirm_data = $SocAuth->isNeedConfirm( $data ) )
				{
					$data['customer_id'] = $customer_id;
					$confirm_data['data'] = $data;
					$SocAuth->setSessionData('socnetauth2_confirmdata_rawdata', serialize($userdata)); 
					$SocAuth->setSessionData('socnetauth2_confirmdata', serialize($confirm_data));
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
					
					if( $IS_DEBUG ) exit( "END-2 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
				}
				else
				{
					$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', 0);
					
					if( $IS_DEBUG ) exit( "END-3 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
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
					$SocAuth->setSessionData('socnetauth2_confirmdata', serialize($confirm_data));
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
					$SocAuth->setSessionData('socnetauth2_confirmdata_rawdata', serialize($userdata)); 
					
					if( $IS_DEBUG ) exit( "END-4 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
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
				
					
					if( $IS_DEBUG ) exit( "END-5 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
				}
			}
			elseif( $SocAuth->get_config_param('socnetauth2_email_auth') == 'confirm'  )
			{
				// требуется добор данных
				if( $confirm_data )
				{
					$confirm_data['data'] = $data;
					$SocAuth->setSessionData('socnetauth2_confirmdata', serialize($confirm_data));
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
					$SocAuth->setSessionData('socnetauth2_confirmdata_rawdata', serialize($userdata)); 
					
					if( $IS_DEBUG ) exit( "END-6 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
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
		
					
					
					
					if( $IS_DEBUG ) exit( "END-7 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
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
				
					
					if( $IS_DEBUG ) exit( "END-8 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
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
					
					if( $IS_DEBUG ) exit( "END-9 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
				}
				// Получен E-mail 
				elseif( !empty( $data['email'] ) && $customer_id = $SocAuth->checkByEmail($data, 1) )
				{
					$SocAuth->setSessionData('socnetauth2_confirmdata', '');
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', '');
					$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 	
				
					
					if( $IS_DEBUG ) exit( "END-10 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
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
				
					
					if( $IS_DEBUG ) exit( "END-11 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Яндекс в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
				}	
			}
		}
	}
	
}

?>