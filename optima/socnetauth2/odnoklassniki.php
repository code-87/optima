<?php
require_once('../config.php');
require_once('lib/db.php');
require_once('lib/socnetauth2.php');
session_start();

$SocAuth = new SocAuth();
$protokol = 'https://';
$SocAuth->setGroupName();

/* start r3 */
$IS_DEBUG = $SocAuth->get_config_param('socnetauth2_odnoklassniki_debug');

if( !$SocAuth->get_config_param('socnetauth2_odnoklassniki_status') ) 
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
	$APPLICATION_ID = $SocAuth->get_config_param('socnetauth2_odnoklassniki_application_id');
	$socnetauth2_shop_folder = $SocAuth->getShopFolder(); 
	
	$REDIRECT_URI = $protokol.$_SERVER['HTTP_HOST'].$socnetauth2_shop_folder.'/socnetauth2/odnoklassniki.php';
	
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
	
		
	$STATE = 'odnoklassniki_socnetauth2_'.rand();
	$SocAuth->setRecord($STATE, $CURRENT_URI);
		
	setcookie("od_state", $STATE, time()+3600, "/" );
		
	#$url = 'http://www.odnoklassniki.ru/oauth/authorize?client_id='.
	#$APPLICATION_ID.'&response_type=code&redirect_uri='.urlencode($REDIRECT_URI).'&scope=VALUABLE_ACCESS;LONG_ACCESS_TOKEN';
	
	$url = 'https://connect.ok.ru/oauth/authorize?client_id='.
	$APPLICATION_ID.'&scope=VALUABLE_ACCESS;LONG_ACCESS_TOKEN;GET_EMAIL'.
	'&response_type=code&GET_EMAIL&redirect_uri='.urlencode($REDIRECT_URI);

	header("Location: ".$url);
}

if( !empty($_GET['error']) && !empty( $_COOKIE['od_state'] ) &&
	$recordData = $SocAuth->getRecord( $_COOKIE['od_state'] ) )
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

if( !empty( $_GET['code'] ) && !empty( $_COOKIE['od_state'] ) &&
	$recordData = $SocAuth->getRecord( $_COOKIE['od_state'] ) )
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
	$REDIRECT_URI = $protokol.$_SERVER['HTTP_HOST'].$socnetauth2_shop_folder.'/socnetauth2/odnoklassniki.php';
	
	if($IS_DEBUG)
	{
		echo "M3: ".$REDIRECT_URI."<hr>";
	}
	
	
	$CLIENT_ID = $SocAuth->get_config_param('socnetauth2_odnoklassniki_application_id');
	$CLIENT_SECRET = $SocAuth->get_config_param('socnetauth2_odnoklassniki_secret_key');
	$CLIENT_PUBLIC = $SocAuth->get_config_param('socnetauth2_odnoklassniki_public_key');
	
	//code={code}&redirect_uri=http://mysite.com/oklogin&grant_type=authorization_code&client_id={client_id}&client_secret={secret_key}
	
	$POSTURL  = 'https://api.ok.ru/oauth/token.do';
	$POSTVARS = 'code='.$CODE.'&redirect_uri='.$REDIRECT_URI.'&grant_type=authorization_code'.
	'&client_id='.$CLIENT_ID.'&client_secret='.$CLIENT_SECRET;
	
	
	$c = curl_init($POSTURL);
		curl_setopt($c, CURL_VERSION_IPV6, true);
		curl_setopt($c, CURL_VERSION_KERBEROS4, false);
		curl_setopt($c, CURL_VERSION_SSL, true);
		curl_setopt($c, CURL_VERSION_LIBZ, true);
		curl_setopt($c, CURLOPT_VERBOSE, true);
		curl_setopt($c, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($c, CURLOPT_POST      ,1);
	curl_setopt($c, CURLOPT_POSTFIELDS    , $POSTVARS);
	curl_setopt($c, CURLOPT_FOLLOWLOCATION  ,1);
	curl_setopt($c, CURLOPT_HEADER      ,0);  // DO NOT RETURN HTTP HEADERS
	curl_setopt($c, CURLOPT_RETURNTRANSFER  ,1);  // RETURN THE CONTENTS OF THE CALL
	$response = curl_exec($c);
	curl_close($c);
 
	if( $IS_DEBUG ) echo "M4: ".$response."<hr>";
	
	$data = json_decode($response, true);
	
	
	
	if( !empty($data['access_token']) )
	{
		$SIGN = md5('application_key='.$CLIENT_PUBLIC.'fields=email,first_name,last_name,name,location,localemethod=users.getCurrentUser'.md5($data['access_token'].$CLIENT_SECRET));
		#application_key=CBABMBEMEBABABABAformat=jsonmethod=users.getCurrentUser5d57e71d18282133cffd428f9720e88a
		$graph_url = "http://api.odnoklassniki.ru/fb.do?method=users.getCurrentUser".
		"&access_token=".$data['access_token'].
		"&application_key=".$CLIENT_PUBLIC.
		"&sig=".$SIGN."&fields=email,first_name,last_name,name,location,locale";
		
		
		if( $IS_DEBUG ) echo "M5: ".$graph_url."<hr>";
		
		if( extension_loaded('curl') )
		{
			$c = curl_init($graph_url);
			curl_setopt($c, CURL_VERSION_IPV6, true);
			curl_setopt($c, CURL_VERSION_KERBEROS4, false);
			curl_setopt($c, CURL_VERSION_SSL, true);
			curl_setopt($c, CURL_VERSION_LIBZ, true);
			curl_setopt($c, CURLOPT_VERBOSE, true);
			curl_setopt($c, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
			$json = curl_exec($c);
			curl_close($c);
		}
		else
		{
			$json = file_get_contents($graph_url);
		}
		
		$userdata = json_decode($json, TRUE);
		
		if( $IS_DEBUG )
		{			
			echo "M5: ".$graph_url."<hr>";
			print_r($userdata);
			echo "<hr>";
		}
		
		// ----------
		
		/*
			uid - user ID
			birthday - date of birth
			age - user`s age
			first_name - user`s name
			last_name - user`s last name
			name - composition of first and last name to render
			has_email - true/false has or not e-mail
			gender - gender
			pic_1 - profile small icon (50x50)
			pic_2 - profile small picture (128x128)
		*/
		
		
		$arr = $userdata;
		
		$provider = 'odnoklassniki';
		
		$arr = array(
			'identity' => $arr['uid'],
			'firstname' => $arr['first_name'],
			'lastname'  => $arr['last_name'],
			'email'     => isset($arr['email']) ? $arr['email'] : '',
			'telephone'	=> ''
		);
		
		$data = array(
			'identity'  => $arr['identity'],
			'link' 		=> "http://ok.ru/profile/".$arr['identity'],
			'firstname' => '',
			'lastname'  => '',
			'email'     => '',
			'telephone'	=> '',
			'data'		=> serialize($arr),
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
		$data['iso_code_2'] = '';
		
		/* start 1302 */
		if( !empty( $arr['countryCode'] ) )
		{
			$data['country'] = $SocAuth->getCountryIdByCode($arr['countryCode']);
		}
		
		if( !empty( $arr['city'] ) )
		{
			$data['city'] = $ar['city'];
		}
		/* end 1302 */
		
		
		///////////////////////////////////////
		
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
				
				if( $IS_DEBUG ) exit( "END-1 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
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
					
					if( $IS_DEBUG ) exit( "END-2 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
				}
				else
				{
					$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', 0);
					
					if( $IS_DEBUG ) exit( "END-3 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
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
					
					if( $IS_DEBUG ) exit( "END-4 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
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
					
					if( $IS_DEBUG ) exit( "END-5 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
				
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
					
					if( $IS_DEBUG ) exit( "END-6 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
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
		
					
					
					
					if( $IS_DEBUG ) exit( "END-7 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
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
				
					
					if( $IS_DEBUG ) exit( "END-8 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
				}
			}
			elseif( $SocAuth->get_config_param('socnetauth2_email_auth') == 'noconfirm'  )
			{
				// требуется добор данных
				if( $confirm_data )
				{
					$confirm_data['data'] = $data;
					$SocAuth->setSessionData('socnetauth2_confirmdata_rawdata', serialize($userdata)); 
					
					$SocAuth->setSessionData('socnetauth2_confirmdata', serialize($confirm_data));
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
					
					if( $IS_DEBUG ) exit( "END-9 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
				}
				// Получен E-mail 
				elseif( !empty( $data['email'] ) && $customer_id = $SocAuth->checkByEmail($data, 1) )
				{
					$SocAuth->setSessionData('socnetauth2_confirmdata', '');
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', '');
					$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 	
					
					if( $IS_DEBUG ) exit( "END-10 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
				
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
				
					
					if( $IS_DEBUG ) exit( "END-11 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Одноклассники в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
				}	
			}
		}
	}
	
}

?>