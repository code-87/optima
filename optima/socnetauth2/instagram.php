<?php
require_once('../config.php');
require_once('lib/db.php');
require_once('lib/socnetauth2.php');
session_start(); 

$SocAuth = new SocAuth();
$SocAuth->setGroupName();
$protokol = $SocAuth->getProtokol(); 

/* start r3 */
$IS_DEBUG = $SocAuth->get_config_param('socnetauth2_instagram_debug');


if( !$SocAuth->get_config_param('socnetauth2_instagram_status') )
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

/* start 1812 */
$AUTHTYPE = $SocAuth->get_config_param('socnetauth2_instagram_authtype');
if( !$AUTHTYPE )
	$AUTHTYPE = 'instagram';
/* end 1812 */

if( !empty($_GET['first']) )
{
	$STATE = 'instagram_socnetauth2_'.rand();
	
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
	
	$REDIRECT_URI = $protokol.$_SERVER['HTTP_HOST'].$socnetauth2_shop_folder.'/socnetauth2/instagram.php';
		
	$CLIENT_ID = $SocAuth->get_config_param('socnetauth2_instagram_client_id');
		
	setcookie("in_state", $STATE, time()+3600, "/" );
	
	
	/* start 1812 */
	$url = '';
	
	if( $AUTHTYPE == 'facebook' )
	{
		$url = 'https://api.instagram.com/oauth/authorize?app_id='.$CLIENT_ID.
			'&scope=user_profile'.
			'&response_type=code'.
			'&state='.$STATE.
			'&redirect_uri='.urlencode($REDIRECT_URI);
		
	}
	else
	{
		$url = 'https://api.instagram.com/oauth/authorize/?client_id='.$CLIENT_ID.
			'&redirect_uri='.urlencode($REDIRECT_URI).
			'&response_type=code'.
			'&scope=basic'.
			'&state='.$STATE.'&hl=en';
	}
	/* end 1812 */
			
	if($IS_DEBUG)
	{
		//echo "M1: ".$url."<hr>";
	}
	
	$SocAuth->setRecord($STATE, $CURRENT_URI);
	header("Location: ".$url);
	exit();
}

if( !empty($_GET['error']) && !empty( $_COOKIE['in_state'] ) &&
	$recordData = $SocAuth->getRecord( $_COOKIE['in_state'] ) )
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


if( !empty( $_GET['state'] ) && !empty( $_GET['code'] ) &&
		$recordData = $SocAuth->getRecord( $_GET['state'] ) )
{
	$CODE = $_GET['code'];
	
	if($IS_DEBUG)
	{
		echo "M2<hr>";
		
		print_r($_SESSION);
	}
	
	
	$CURRENT_URI = $recordData['redirect'];
	$CURRENT_URI = str_replace("?socnetauth2close=1", "", $CURRENT_URI);
	$CURRENT_URI = str_replace("&socnetauth2close=1", "", $CURRENT_URI);
	
	$socnetauth2_shop_folder = $SocAuth->getShopFolder(); 
	
	$REDIRECT_URI = $protokol.$_SERVER['HTTP_HOST'].$socnetauth2_shop_folder.'/socnetauth2/instagram.php';
	
	if($IS_DEBUG)
	{
		echo "M3: ".$REDIRECT_URI."<hr>";
	}
	
	$CLIENT_ID = $SocAuth->get_config_param('socnetauth2_instagram_client_id');
	$CLIENT_SECRET = $SocAuth->get_config_param('socnetauth2_instagram_client_secret');
	
	/* start 1812 */
	$url = '';
	$POSTVARS = "";
	
	if( $AUTHTYPE == 'facebook' )
	{
		$url = "https://api.instagram.com/oauth/access_token";
		$POSTVARS = "app_id=".$CLIENT_ID.
						   "&app_secret=".$CLIENT_SECRET.
						   "&grant_type=authorization_code".
						   "&redirect_uri=".urlencode($REDIRECT_URI).
						   "&code=".$CODE;
						   
	}
	else
	{
		$url = "https://api.instagram.com/oauth/access_token";
		$POSTVARS = "client_id=".$CLIENT_ID.
					   "&client_secret=".$CLIENT_SECRET.
					   "&grant_type=authorization_code".
					   "&redirect_uri=".urlencode($REDIRECT_URI).
					   "&code=".$CODE;
	}
	
	if( $IS_DEBUG ) echo "M4: ".$url."<hr>";
	if( $IS_DEBUG ) echo "M4.1: ".$POSTVARS."<hr>";
			
	$c = curl_init( $url );
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
	/* end 1812 */
		
	
	if( $IS_DEBUG ) echo "M5: ".$response."<hr>";
	$data = json_decode($response, 1);	
	
	if( !empty($data['access_token']) )
	{
		/* start 1812 */
		$arr = array();
		
		if( $AUTHTYPE == 'facebook' )
		{
			$user_id = $data['user_id'];
			$access_token = $data['access_token'];
			
			$graph_url = "https://graph.instagram.com/".$user_id.
				   "?fields=id,username&access_token=".$access_token;
				  
			if( $IS_DEBUG ) echo "M6: ".$graph_url."<hr>";
			
			$c = curl_init($graph_url);
			curl_setopt($c, CURL_VERSION_IPV6, true);
			curl_setopt($c, CURL_VERSION_KERBEROS4, false);
			curl_setopt($c, CURL_VERSION_SSL, true);
			curl_setopt($c, CURL_VERSION_LIBZ, true);
			curl_setopt($c, CURLOPT_VERBOSE, true);
			curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($c, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
			$json = curl_exec($c);
			curl_close($c);
			
			if( $IS_DEBUG ) echo "M7: ".$json."<hr>";
			
			$userdata = json_decode($json, TRUE);
			
			$arr = array(
				'identity'  => $userdata['id'],
				'firstname' => '',
				'lastname'  => '',
				'email'     => '',
				'link'      => 'https://www.instagram.com/'.$userdata['username'].'/',
				'telephone'	=> ''
			);
		}
		else
		{
			$arr = $data['user'];
				
			if( !empty($arr['full_name']) )
			{
				$ar = explode(" ", $arr['full_name']);
				$arr['first_name'] = $ar[0];
				$arr['last_name'] = isset($ar[1]) ? $ar[1] : '';
			}
			
			$arr = array(
				'identity'  => $arr['id'],
				'firstname' => isset($arr['first_name']) ? $arr['first_name'] : '',
				'lastname'  => isset($arr['last_name']) ? $arr['last_name'] : '',
				'email'     => isset( $arr['email'] ) ? $arr['email'] : '',
				'link'      => 'https://www.instagram.com/'.$arr['username'].'/',
				'telephone'	=> ''
			);
		}
		
		
		$userdata = $arr;
		$provider = 'instagram';
		
		/* end 1812 */
		
		
		$data = array(
			'identity'  => $arr['identity'],
			'link' 		=> $arr['link'],
			'firstname' => $arr['firstname'],
			'lastname'  => $arr['lastname'],
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
		
		///////////////////////////////////////
		
		if( $SocAuth->get_config_param('socnetauth2_add_param') )
		{
			if( strstr($CURRENT_URI, '?') )
				$CURRENT_URI .= '&sna=1';
			else
				$CURRENT_URI .= '?sna=1';
		}
		
		$SocAuth->checkDB();
		
		$CURRENT_URI .= '#';
		
		if( $customer_id = $SocAuth->checkNew($data) )
		{
			if( $SocAuth->get_config_param('socnetauth2_dobortype') != 'every' )
			{
				$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 
				$SocAuth->setSessionData('socnetauth2_confirmdata_show', 0);
				
				if( $IS_DEBUG ) exit( "END-1 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
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
			
					if( $IS_DEBUG ) exit( "END-2 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
					header("Location: ".$CURRENT_URI ); 
				}
				else
				{
					$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', 0);
					
					if( $IS_DEBUG ) exit( "END-3 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
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
					
					if( $IS_DEBUG ) exit( "END-4 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
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
					
					if( $IS_DEBUG ) exit( "END-5 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
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
					
					if( $IS_DEBUG ) exit( "END-6 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
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
		
					
					
					if( $IS_DEBUG ) exit( "END-7 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
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
					
					if( $IS_DEBUG ) exit( "END-8 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
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
					
					if( $IS_DEBUG ) exit( "END-9 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
					header("Location: ".$CURRENT_URI ); 
				}
				// Получен E-mail 
				elseif( !empty( $data['email'] ) && $customer_id = $SocAuth->checkByEmail($data, 1) )
				{
					$SocAuth->setSessionData('socnetauth2_confirmdata', '');
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', '');
					$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 	
				
					if( $IS_DEBUG ) exit( "END-10 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля" );
				
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
					
					if( $IS_DEBUG ) exit( "END-11 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Instagram в настройках модуля");
				
					header("Location: ".$CURRENT_URI ); 
				}	
			}
		}
	}
	
}

?>