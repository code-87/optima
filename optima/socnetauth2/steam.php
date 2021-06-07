<?php
require_once('../config.php');

require_once('lib/db.php');
require_once('lib/socnetauth2.php');
require_once('lib/steam/openid.php');
session_start();

$SocAuth = new SocAuth(); 
$SocAuth->setGroupName();
$protokol = $SocAuth->getProtokol(); 

/* start r3 */
$IS_DEBUG =  $SocAuth->get_config_param('socnetauth2_steam_debug');

if( !$SocAuth->get_config_param('socnetauth2_steam_status') )
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

if( empty($_GET['openid.ns']) && empty($_GET['openid_ns']) )
{
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
	
	$REDIRECT_URI = $protokol.$_SERVER['HTTP_HOST'].$socnetauth2_shop_folder.'/socnetauth2/steam.php';
		
	$STATE = 'steam_socnetauth2_'.rand();
	$SocAuth->setRecord($STATE, $CURRENT_URI);

	setcookie("st_state", $STATE, time()+3600, "/" );
	
	$openid = new LightOpenID($_SERVER['SERVER_NAME']);
	
	if(!$openid->mode) 
	{
		$openid->identity = 'http://steamcommunity.com/openid';
		$url = $openid->authUrl();
		header('Location: ' . $url);
		exit();
	} 
	else
	{
		exit("error-2");
	}
}

$openid = new LightOpenID($_SERVER['SERVER_NAME']);

if( !$openid->mode || $openid->mode=='cancel' || !$openid->validate() )
{
	if( !empty( $_COOKIE['st_state'] ) &&
	$recordData = $SocAuth->getRecord( $_COOKIE['st_state'] ) )
	{
		if($IS_DEBUG)
		{
			if( strstr($recordData['redirect'], "?") )
			{
				$recordData['redirect'] .= '&error=3';
			}
			else
			{
				$recordData['redirect'] .= '?error=3';
			}
		}
		
		header("Location: ".$recordData['redirect']);
		exit();
	}
	else	
	{
		$url = "Location: ".$_SERVER['HTTP_REFERER'];
		
		if($IS_DEBUG)
		{
			if( strstr($url, "?") )
			{
				$url .= '&error=4';
			}
			else
			{
				$url .= '?error=4';
			}
		}
		
		header($url);
		exit();
	}
}

if( !empty( $_COOKIE['st_state'] ) &&
	$recordData = $SocAuth->getRecord( $_COOKIE['st_state'] ) 
	&& $openid->identity
)
{
	$recordData = $SocAuth->getRecord( $_COOKIE['st_state'] );
	
	if($IS_DEBUG)
	{
		echo "M2<hr>";
	}
	 
	$CURRENT_URI = $recordData['redirect'];
	$CURRENT_URI = str_replace("?socnetauth2close=1", "", $CURRENT_URI);
	$CURRENT_URI = str_replace("&socnetauth2close=1", "", $CURRENT_URI);
	
	$socnetauth2_shop_folder = $SocAuth->getShopFolder(); 
	$REDIRECT_URI = $protokol.$_SERVER['HTTP_HOST'].$socnetauth2_shop_folder.'/socnetauth2/steam.php';
	
	$API_KEY = $SocAuth->get_config_param('socnetauth2_steam_api_key');
	
	$ptn = "/^https:\/\/steamcommunity\.com\/openid\/id\/(7[0-9]{15,25}+)$/";
	preg_match($ptn, $openid->data['openid_identity'], $matches);
	$STEAM_ID = $matches[1];
	
	$response = file_get_contents("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=".
	$API_KEY."&steamids=".$STEAM_ID); 
	if( $IS_DEBUG ) echo "M4: ".$response."<hr>";
	
	$content = json_decode($response, true);
	
/* start 0306 */
$userdata = $content;
foreach($userdata as $key=>$val)
{
	if( is_array($val) )
	{
		$userdata[$key] = print_r($val, 1);
	}
}
/* end 0306 */
		
	$provider = 'steam';
		
	$arr = array(
		'identity' => $content['response']['players'][0]['steamid'],
		'firstname' => !empty( $content['response']['players'][0]['realname'] ) ? $content['response']['players'][0]['realname'] : '',
		'lastname'  => '',
		'email'     => '',
		'telephone'	=> ''
	);
		
	$data = array(
		'identity'  => $arr['identity'],
		'link' 		=> $openid->identity,
		'firstname' => $arr['firstname'],
		'lastname'  => '',
		'email'     => '',
		'telephone'	=> '',
		'data'		=> serialize($arr),
		'provider'  => $provider
	); 
	
	
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
	#if()	
		if( $customer_id = $SocAuth->checkNew($data) )
		{
			if( $SocAuth->get_config_param('socnetauth2_dobortype') != 'every' )
			{
				$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 
				$SocAuth->setSessionData('socnetauth2_confirmdata_show', 0);
				
				if( $IS_DEBUG ) exit( "END-1 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
				header("Location: ".$CURRENT_URI ); 
					exit();
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
					
					if( $IS_DEBUG ) exit( "END-2 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
					exit();
				}
				else
				{
					$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', 0);
					
					if( $IS_DEBUG ) exit( "END-3 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
					exit();
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
					
					if( $IS_DEBUG ) exit( "END-4 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
					exit();
				}
				else
				{
					$SocAuth->setSessionData('socnetauth2_confirmdata', '');
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', '');
				
					$customer_id = $SocAuth->addCustomer( $data );
					$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 	
					$SocAuth->addCustomerComment( $customer_id, $provider, $userdata );
				
					
					if( $IS_DEBUG ) exit( "END-5 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
					exit();
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
					
					if( $IS_DEBUG ) exit( "END-6 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
					exit();
				}
				// Получен E-mail и включено проверка email письмом
				elseif( !empty( $data['email'] ) && $SocAuth->checkByEmail($data, 0) )
				{
					include(DIR_SYSTEM.'library/mail.php');
					
					$SocAuth->sendConfirmEmail($data);
					$SocAuth->setSessionData('socnetauth2_confirmdata', serialize(array(1, 2, 3, 4, $data['email'], $data['identity'], $data['link'], $data['provider'], $data)));
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', 1);
					$SocAuth->setSessionData('controlled_email', $data['email']);
		
					
					
					
					if( $IS_DEBUG ) exit( "END-7 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI );
					exit();
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
					
					
					if( $IS_DEBUG ) exit( "END-8 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
					exit();
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
					
					if( $IS_DEBUG ) exit( "END-9 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
					exit();
				}
				// Получен E-mail 
				elseif( !empty( $data['email'] ) && $customer_id = $SocAuth->checkByEmail($data, 1) )
				{
					$SocAuth->setSessionData('socnetauth2_confirmdata', '');
					$SocAuth->setSessionData('socnetauth2_confirmdata_show', '');
					$SocAuth->setSessionData('customer_id', $customer_id, 1);
					$SocAuth->setSessionCode( $customer_id ); 	
				
					
					if( $IS_DEBUG ) exit( "END-10 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI );
					exit();
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
				
					
					if( $IS_DEBUG ) exit( "END-11 ".$CURRENT_URI."<hr>Отладочные сообщения можно отключить во вкладке Steam в настройках модуля");
					header("Location: ".$CURRENT_URI ); 
					exit();
				}	
			}
		}
	#}
}

?>