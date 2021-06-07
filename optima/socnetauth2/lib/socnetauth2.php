<?php 
Class SocAuth extends DB
{
	private $STORE_ID = 0;
	public $group_name = 'group';
	public $socnets = array(
		"vkontakte" => array(
			"key" => "vkontakte",
			"short" => "vk",
			"name" => "ВКонтакте",
			"loginza_key" => "vkontakte"
		),
		"odnoklassniki" => array(
			"key" => "odnoklassniki",
			"short" => "od",
			"name" => "Одноклассники",
			"loginza_key" => "odnoklassniki"
		),
		"facebook" => array(
			"key" => "facebook",
			"short" => "fb",
			"name" => "FaceBook",
			"loginza_key" => "facebook"
		),
		"twitter" => array(
			"key" => "twitter",
			"short" => "tw",
			"name" => "Twitter",
			"loginza_key" => "twitter"
		),
		"gmail" => array(
			"key" => "gmail",
			"short" => "gm",
			"name" => "Gmail.com",
			"loginza_key" => "google"
		),
		"mailru" => array(
			"key" => "mailru",
			"short" => "mr",
			"name" => "Mail.ru",
			"loginza_key" => "mailru"
		),
		"steam" => array(
			"key" => "steam",
			"short" => "st",
			"name" => "Steam",
			"loginza_key" => "steam"
		),
		"yandex" => array(
			"key" => "yandex",
			"short" => "ya",
			"name" => "Яндекс",
			"loginza_key" => "yandex"
		),
		/* start 0207 */
		"instagram" => array(
			"key" => "instagram",
			"short" => "in",
			"name" => "Instagram",
			"loginza_key" => "instagram"
		),
	);
	public function setGroupName()
	{	
		$this->group_name = 'code';
		
		$result = $this->query_row("SELECT * 
									FROM `" . DB_PREFIX . "store` 
									WHERE `url` LIKE 'https://".$this->escape($_SERVER['HTTP_HOST'])."%'
									OR `url` LIKE 'http://".$this->escape($_SERVER['HTTP_HOST'])."%'
									");
		
		if( !empty( $result['store_id'] ) )
			$this->STORE_ID = $result['store_id'];
	}
	
	public function getProtokol( )
	{
		if( $this->get_config_param('socnetauth2_protokol') == 'detect' )
		{
			if( 
				( isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ) || 
				!empty($_SERVER['HTTPS']) 
				|| ( !empty($_SERVER['HTTP_CF_VISITOR']) && strstr($_SERVER['HTTP_CF_VISITOR'], "https") )	
			)
				return 'https://';
			else
				return 'http://';
		}
		else
			return $this->get_config_param('socnetauth2_protokol'). '://'; 
	}
	
	
	public function getRecord($state)
	{
		$result = $this->query_row("
			SELECT * FROM `" . DB_PREFIX . "socnetauth2_records` 
			WHERE state='".$this->escape($state)."'");
		
		return $result;
	}
	
	public function setRecord($state, $redirect)
	{
		$this->query_run("DELETE FROM `" . DB_PREFIX . "socnetauth2_records` 
			WHERE DATE_ADD(cdate, INTERVAL 15 MINUTE)<NOW()");
			
		$this->query_run("INSERT INTO `" . DB_PREFIX . "socnetauth2_records` 
			SET 
				`state` = '".$this->escape($state)."',
				`redirect` = '".$this->escape($redirect)."',
				`cdate` = NOW()");
	}
	
	public function checkByEmail($data, $is_add=0)
	{
		$result = $this->query_row("SELECT * 
									FROM `" . DB_PREFIX . "customer` 
									WHERE email='".$this->escape($data['email'])."'");
		
		if( $result )
		{
			if( $is_add )
			{
				$this->query_row("INSERT INTO `" . DB_PREFIX . "socnetauth2_customer2account`
								   SET 
								    `customer_id` = '".(int)$result['customer_id']."',
									`identity` = '".$this->escape($data['identity'])."',
									`link` = '".$this->escape($data['link'])."',
									`provider` = '".$this->escape($data['provider'])."',
									`data` = '".$this->escape($data['data'])."',
									`email` = '".$this->escape($data['email'])."'");
			}
			
			$this->addActivity($result['customer_id'], 'login', $data['identity']);
			
			return $result['customer_id'];
		}
		else
		{
			return false;
		}
	}
	
	
	private function checkColumn($table, $column, $type)
	{
		$query = $this->query_rows("SHOW COLUMNS FROM `".DB_PREFIX . $table."`");
		
		$hash = array();
		
		foreach($query as $row)
		{
			$hash[ $row['Field'] ] = $row['Type'];
		}
		
		if( !isset($hash[ $column ]) )
		{
			$sql = "ALTER TABLE `" . DB_PREFIX . $table . "` 
			ADD `".$column."` ". $type ." NOT NULL";
			$this->query_run($sql);
		}
		elseif( strtoupper( $hash[ $column ] ) != strtoupper($type) )
		{
			if( strtoupper($type) == 'TEXT' &&  
				(
					strtoupper( $hash[ $column ] ) == 'LONGTEXT' ||
					strtoupper( $hash[ $column ] ) == 'MEDIUMTEXT' 
				)
			) 
			{
				// none
			}
			else
			{
				$this->query_run("ALTER TABLE  `" . DB_PREFIX . $table  . "` 
				CHANGE  `".$column."`  `".$column."` ".$type." NOT NULL");
			}
		}
	}
		
	public function checkDB()
	{
		$res = $this->query_rows("SHOW TABLES");
		$installed = 0;
		foreach($res as $key=>$val)
		{
			foreach($val as $k=>$v)
			{
				if( $v == DB_PREFIX . 'socnetauth2_customer2account' )
				{
					$installed = 1;
				}
			}
		}
		
		if( $installed == 0 )
		{
			$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "socnetauth2_customer2account` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`customer_id` varchar(100) NOT NULL,
				`identity` varchar(300) NOT NULL,
				`link` varchar(300) NOT NULL,
				`provider` varchar(300) NOT NULL,
				`email` varchar(300) NOT NULL,
				`data` TEXT NOT NULL,
				PRIMARY KEY (`id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8;";
				
			$this->query_run($sql);
			
			
			$query = $this->query_rows("SELECT * 
							   FROM `" . DB_PREFIX . "customer` 
							   WHERE socnetauth2_identity!=''");
			if( !empty($query) )				   
			{
				foreach($query as $customer)
				{
					$this->query_run("INSERT INTO `" . DB_PREFIX . "socnetauth2_customer2account`
									SET 
									`customer_id` = '".(int)$customer['customer_id']."',
									`identity` = '".$this->escape($customer['socnetauth2_identity'])."',
									`link` = '".$this->escape($customer['socnetauth2_link'])."',
									`provider` = '".$this->escape($customer['socnetauth2_provider'])."',
									`data` = '".$this->escape($customer['socnetauth2_data'])."',
									`email` = '".$this->escape($customer['email'])."'");
				}
			}
		}
		else
		{
			$todel = $this->query_rows("SELECT sc.id, c.customer_id 
								  FROM `" . DB_PREFIX . "socnetauth2_customer2account` sc
								  LEFT JOIN `" . DB_PREFIX . "customer` c
								  ON sc.customer_id=c.customer_id
								  WHERE c.customer_id IS NULL");
			
			if( !empty($todel) )
			{
				foreach($todel as $item)
				{
					$this->query_run("DELETE FROM `" . DB_PREFIX . "socnetauth2_customer2account` 
								  WHERE id=".(int)$item['id'] );
				}
			}
			
		}
		
		$this->checkColumn("socnetauth2_customer2account", "code", "VARCHAR(300)");
		$this->checkColumn("socnetauth2_customer2account", "mdate", "DATETIME");
		
		
		$this->query_run("UPDATE `" . DB_PREFIX . "socnetauth2_customer2account` 
			SET 
				code = ''
			WHERE 
				DATE_ADD(mdate, INTERVAL 15 MINUTE)<NOW()");
		
	}
	
	/* start 0207 */
	public function includeLangFile($path, $_=array() )
	{
		if( isset($_COOKIE['language']) && $_COOKIE['language']=='en' )
		{
			if( file_exists(DIR_LANGUAGE.'en-gb/'.$path.'.php') )
				include_once(DIR_LANGUAGE.'en-gb/'.$path.'.php');
			else
				include_once(DIR_LANGUAGE.'english/'.$path.'.php');
		}
		else
		{
			if( file_exists(DIR_LANGUAGE.'ru-ru/'.$path.'.php') )
				include_once(DIR_LANGUAGE.'ru-ru/'.$path.'.php');
			else
				include_once(DIR_LANGUAGE.'russian/'.$path.'.php');
		}
		
		return $_;
	}
	
	public function sendRegEmail($data)
	{
		$_ = $this->includeLangFile('account/socnetauth2');
		$_ = $this->includeLangFile('mail/customer', $_);
		
		$customer_group_id = $this->get_config_param('socnetauth2_'.$data['provider'].'_customer_group_id', 'socnetauth2');
		
		$customer_group_info = $this->query_row("SELECT * 
		FROM " . DB_PREFIX . "customer_group cg 
		WHERE cg.customer_group_id = '" . (int)$customer_group_id . "'");
		
		$subject = sprintf($_['text_subject'], html_entity_decode($this->get_config_param('config_name', 'config'), ENT_QUOTES, 'UTF-8'));

		$message = sprintf($_['text_welcome'], html_entity_decode($this->get_config_param('config_name', 'config'), ENT_QUOTES, 'UTF-8')) . "\n\n";

		if (!$customer_group_info['approval']) {
			$message .= $_['text_login'] . "\n";
		} else {
			$message .= $_['text_approval'] . "\n";
		}

		$message .= $this->getUrl('account/login') . "\n\n";
		
		if( !empty($data['password']) )
		{
			$message .= $_['entry_addpass_login']." " . $data['email'] . "\n";
			$message .= $_['entry_addpass_password']." " . $data['password'] . "\n\n";
		}
		
		$message .= $_['text_services'] . "\n\n";
		$message .= $_['text_thanks'] . "\n";
		$message .= html_entity_decode($this->get_config_param('config_name', 'config'), ENT_QUOTES, 'UTF-8');

		if( !class_exists('Mail') )
		include_once(DIR_SYSTEM.'library/mail.php');
		
		$mail = new Mail();
		$mail->protocol = $this->get_config_param('config_mail_protocol', 'config');
		$mail->parameter = $this->get_config_param('config_mail_parameter', 'config');
		$mail->smtp_hostname = $this->get_config_param('config_mail_smtp_hostname', 'config');
		$mail->smtp_username = $this->get_config_param('config_mail_smtp_username', 'config');
		$mail->smtp_password = html_entity_decode($this->get_config_param('config_mail_smtp_password', 'config'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->get_config_param('config_mail_smtp_port', 'config');
		$mail->smtp_timeout = $this->get_config_param('config_mail_smtp_timeout', 'config');

		$mail->setTo($data['email']);
		$mail->setFrom($this->get_config_param('config_email', 'config'));
		$mail->setSender(html_entity_decode($this->get_config_param('config_name', 'config'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject($subject);
		$mail->setText($message);
		$mail->send();
	}
	
	public function getUrl($query)
	{
		$query_link = $this->query_row("SELECT * 
							   FROM `" . DB_PREFIX . "url_alias` 
							   WHERE `query` = '".$this->escape($query)."'");
		
		if( !empty( $query_link['keyword'] ) )
		{
			return HTTPS_SERVER.$query_link['keyword'];
		}
		else
		{
			return HTTPS_SERVER.'?route='.$query;
		}
	}
	/* end 0207 */
	
	public function sendConfirmEmail($data)
	{
		$res = $this->query_rows("SHOW TABLES");
		$installed = 0;
		foreach($res as $key=>$val)
		{
			foreach($val as $k=>$v)
			{
				if( $v == DB_PREFIX . 'socnetauth2_precode' )
				{
					$installed = 1;
				}
			}
		}
		
		if( $installed == 0 )
		{
			$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "socnetauth2_precode` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`identity` varchar(300) NOT NULL,
				`code` varchar(300) NOT NULL,
				`cdate` DATETIME NOT NULL,
				PRIMARY KEY (`id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8;";
			$this->query_run($sql);
		}
		
		$code = substr(rand(0, 1000000000), 0, 7);
		$this->query_run("INSERT INTO `" . DB_PREFIX . "socnetauth2_precode`
						  SET 
							`identity` = '".$this->escape($data['identity'])."',
							`code` = '".$this->escape($code)."',
							`cdate`=NOW()");
		
		$this->setSessionData('controlled_email', $data['email']);
		
		
		if( isset($_COOKIE['language']) && $_COOKIE['language']=='en' )
		{
			if( file_exists(DIR_LANGUAGE.'en-gb/account/socnetauth2.php') )
				include_once(DIR_LANGUAGE.'en-gb/account/socnetauth2.php');
			else
				include_once(DIR_LANGUAGE.'english/account/socnetauth2.php');
		}
		else
		{
			if( file_exists(DIR_LANGUAGE.'ru-ru/account/socnetauth2.php') )
				include_once(DIR_LANGUAGE.'ru-ru/account/socnetauth2.php');
			else
				include_once(DIR_LANGUAGE.'russian/account/socnetauth2.php');
		}
					
		
		/* start 0207 */
		if( !class_exists('Mail') )
		include_once(DIR_SYSTEM.'library/mail.php');
	
		$this->includeLangFile('account/socnetauth2');
		/* end 0207 */
		
		$subject = $_['text_mail_subject'];
		$message = $_['text_mail_body'];
		
		$message = str_replace("%", $code, $message);
		
		
				$mail = new Mail();
				$mail->protocol = $this->get_config_param('config_mail_protocol', 'config');
				$mail->parameter = $this->get_config_param('config_mail_parameter', 'config');
				$mail->smtp_hostname = $this->get_config_param('config_mail_smtp_hostname', 'config');
				$mail->smtp_username = $this->get_config_param('config_mail_smtp_username', 'config');
				$mail->smtp_password = html_entity_decode($this->get_config_param('config_mail_smtp_password', 'config'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->get_config_param('config_mail_smtp_port', 'config');
				$mail->smtp_timeout = $this->get_config_param('config_mail_smtp_timeout', 'config');
	
				$mail->setTo($data['email']);
				$mail->setFrom($this->get_config_param('config_email', 'config'));
				$mail->setSender(html_entity_decode($this->get_config_param('config_name', 'config'), ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
				$mail->setHtml(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
				#$mail->setText($text);
				$mail->send();
		
		
	}
	
	public function checkNew($data)
	{
		if( empty($data['identity']) ) exit('EMPTY ID');
		$identitis = array();
		
		$identitis[] = $data['identity'];
		$identitis[] = str_replace("http://", "https://", $data['identity']);
		$identitis[] = str_replace("https://", "http://", $data['identity']);
		$identitis[] = str_replace("https://", "https://www.", $data['identity']);
		$identitis[] = str_replace("http://", "http://www.", $data['identity']);
		$identitis[] = str_replace("http://www.", "http://", $data['identity']);
		$identitis[] = str_replace("https://www.", "https://", $data['identity']);
		$identitis[] = str_replace("https://www.", "", $data['identity']);
		$identitis[] = str_replace("https://", "", $data['identity']);
		$identitis[] = str_replace("http://www.", "", $data['identity']);
		$identitis[] = str_replace("http://", "", $data['identity']);
		$identitis[] = str_replace("https://www.", "http://", $data['identity']);
		
		
		
		for($i=0; $i<count($identitis); $i++)
		{
			$identitis[$i] = " sc.identity='".$this->escape($identitis[$i])."' ";
		}
		
		$wh = implode(" OR ", $identitis);
		
		/*
		`id` int(11) NOT NULL AUTO_INCREMENT,
				`customer_id` varchar(100) NOT NULL,
				`identity` varchar(300) NOT NULL,
				`link` varchar(300) NOT NULL,
				`provider` varchar(300) NOT NULL,
				`data` TEXT NOT NULL,
		*/
		
		
		$check = $this->query_row("SELECT * FROM " . DB_PREFIX . "socnetauth2_customer2account sc
									JOIN " . DB_PREFIX . "customer c ON sc.customer_id=c.customer_id
								   WHERE ".$wh);
				
								   
		if( empty($check) && $this->get_config_param('socnetauth2_dobortype') == 'one' )
		{
			return false;
		}
		elseif( !empty( $check ) )
		{
		/*
			$upd = '';
			
			if( !empty($data['firstname']) )
			{
				$upd .= " firstname = '".$this->escape($data['firstname'])."', ";
			}
			
			if( !empty($data['lastname']) )
			{
				$upd .= " lastname = '".$this->escape($data['lastname'])."', ";
			}
			
			if( !empty($data['telephone']) )
			{
				$upd .= " telephone = '".$this->escape($data['telephone'])."', ";
			}
			
			if( !empty($data['email']) )
			{
				$upd .= " email = '".$this->escape($data['email'])."', ";
			}
		*/	
			$this->query_run("UPDATE `" . DB_PREFIX . "socnetauth2_customer2account` 
							  SET
								data = '".$this->escape($data['data'])."'
							  WHERE
							    identity = '" .$this->escape($data['identity']) . "'");
			
			$this->query_run("UPDATE `" . DB_PREFIX . "customer` 
							  SET
							  		ip = '" . $this->escape($_SERVER['REMOTE_ADDR']) . "'
							  WHERE
							    customer_id = '" .$this->escape($check['customer_id']) . "'");
							
			/* start specific block: system/library/customer.php */
			if( !empty($check['cart']) && is_string($check['cart']) ) {
				$cart = unserialize($check['cart']);
				
				$session_cart = $this->getSessionData('cart');
				if( !$session_cart ) 
					$session_cart = array();
				
				foreach ($cart as $key => $value) {
					if (!array_key_exists($key, $session_cart)) {
						$session_cart[$key] = $value;
					} else {
						$session_cart[$key] += $value;
					}
				}

				$this->setSessionData('cart', $session_cart);			
			}
			
			

			if ( !empty($check['wishlist']) && is_string($check['wishlist'])) {
				
				$session_wishlist = $this->getSessionData('wishlist');
				if( !$session_wishlist ) 
					$session_wishlist = array();
								
				$wishlist = unserialize($check['wishlist']);
			
				foreach ($wishlist as $product_id) {
					if (!in_array($product_id, $session_wishlist)) {
						$session_wishlist[] = $product_id;
					}
				}			

				$this->setSessionData('wishlist', $session_cart);		
			}
			
			$this->addActivity($check['customer_id'], 'login', $data['identity']);

			
			return $check['customer_id'];
		}
		else
		{
			return false;
		}
	}
	
	
	
	public function get_config_param($param_name, $group='socnetauth2', $no_store_id = 1)
	{
		$hash = array(
			"socnetauth2_vkontakte_appid" => 1,
			"socnetauth2_vkontakte_appsecret" => 1,
			"socnetauth2_facebook_appid" => 1,
			"socnetauth2_facebook_appsecret" => 1,
			"socnetauth2_twitter_consumer_key" => 1,
			"socnetauth2_twitter_consumer_secret" => 1,
			"socnetauth2_odnoklassniki_application_id" => 1,
			"socnetauth2_odnoklassniki_public_key" => 1,
			"socnetauth2_odnoklassniki_secret_key" => 1,
			"socnetauth2_gmail_client_id" => 1,
			"socnetauth2_gmail_client_secret" => 1,
			"socnetauth2_mailru_id" => 1,
			"socnetauth2_mailru_private" => 1,
			"socnetauth2_mailru_secret" => 1,
			"socnetauth2_yandex_client_id" => 1,
			"socnetauth2_yandex_client_secret" => 1,
			"socnetauth2_steam_api_key" => 1,
			
			"socnetauth2_instagram_client_id" => 1,
			"socnetauth2_instagram_client_secret" => 1,
		);
		
		if( !empty($hash[ $param_name ] ) )
		{
			$keys = explode("_", $param_name);
			
			$req_key = $keys[0].'_'.$keys[1].'_req';
			
			array_shift($keys);
			if( count($keys) > 2 ) 
			array_shift($keys);
			
			$param_key = implode("_", $keys); 
			
			$row = $this->query_row("SELECT * FROM `" . DB_PREFIX . "setting` 
			WHERE `".$this->group_name."`='".$group."' AND `key`='".$req_key."'
			AND store_id = '".(int)$this->STORE_ID."'");
			
			if( !empty( $row['value'] ) )
			{
				$req_list = unserialize($row['value']);
				$domain = $this->getDomain( $_SERVER['HTTP_HOST'] );
				
				foreach($req_list as $i=>$req)
				{
					$req['domain'] = $this->getDomain( $req['domain'] );
					
					if( $req['domain'] == $domain )
					{
						return $req[ $param_key ];
					}
				}
			}
		}
	/* end 0207 */
		
		$sql = '';
		if( $no_store_id )
			$sql = "SELECT * FROM `" . DB_PREFIX . "setting` 
			WHERE `".$this->group_name."`='".$group."' AND `key`='".$param_name."' ";
		else
			$sql = "SELECT * FROM `" . DB_PREFIX . "setting` 
			WHERE `".$this->group_name."`='".$group."' AND `key`='".$param_name."'
				AND store_id = '".(int)$this->STORE_ID."'";
		
		$row = $this->query_row($sql);
		
		
		/* start 2401 */
		if( !empty($row['serialized']) && !empty($row['value']) )
		{
			return json_decode($row['value'], 1);
		}
		/* end 2401 */
		
		
		return isset($row['value']) ? $row['value'] : '';
	}
	
	public function getDomain($domain)
	{
		$domain = preg_replace("/^http\:\/\//", "", $domain);
		$domain = preg_replace("/^https\:\/\//", "", $domain);
		$domain = preg_replace("/^www\./", "", $domain);
		$domain = preg_replace("/\/$/", "", $domain);
		$domain = strtolower($domain);
		
		return $domain;
	}
	
	
	public function setSessionCode($customer_id)
	{
		$code = md5( rand(1, 100000000000) ); 
		$this->query_run("UPDATE `" . DB_PREFIX . "socnetauth2_customer2account`
						  SET 
							`code` = '".$this->escape($code)."'
						  WHERE
							`customer_id` = '".(int)$customer_id."'");
							
		$this->setSessionData('socnetauth2_authcode', $code);
	}		
	
	function setSessionData($keyword, $value, $is_no_cookie = 0)
	{
		
		if( !$is_no_cookie )
		{
			if( !is_array($value) )
				setcookie($keyword, $value, time()+3600, '/');
			else
				setcookie($keyword, serialize($value), time()+3600, '/');
		}
			
		$session_key = '';
		foreach( $_SESSION as $key=>$val )
		{
			if( is_array($val) ) 
			{
				foreach($val as $k=>$v)
				{
					if( $k == 'socnetauth2_lastlink' || $k == 'socnetauth2_confirmdata' ) 
					{
						$session_key = $key;
					}
				}
				
			}
		}
		
		if( $session_key )
		{
			$_SESSION[$session_key][$keyword] = $value;
		}
		else
		{
			if( !is_array($value) && !$is_no_cookie )
			setcookie($keyword, $value, time()+3600, '/');
			
			$_SESSION[$keyword] = $value;
			#exit("session_error");
		}
	}
	
	/* end 2801 */
	
	public function getVersion()
	{
		$query = $this->query_rows("SELECT * FROM information_schema.COLUMNS
								   WHERE TABLE_NAME = '" . DB_PREFIX . "setting'");
		   
		$column_hash = array();
		
		foreach($query as $row )
		{
			if( $row['TABLE_SCHEMA'] == DB_PREFIX.DB_DATABASE || $row['TABLE_SCHEMA'] == DB_DATABASE )
			{
				$column_hash[ $row['COLUMN_NAME'] ] = 1;
				//echo $row['COLUMN_NAME']."<br>";
			}
		}
		
		
		if( isset($column_hash['group']) ) return 2000;
		elseif( isset($_SESSION['default']['language']) ) return 2100;
		else return 2010;
	}
	
	/* start 1007 */
	public function getOldDoborData($data)
	{
		if( empty($data['identity']) )
			return array();
		
		$dobor_customer_id = 0;
		
		$query = $this->query_row("SELECT * 
								   FROM `" . DB_PREFIX . "customer` c 
								   JOIN `" . DB_PREFIX . "socnetauth2_customer2account` sc
								   ON c.customer_id=sc.customer_id
								   WHERE 
									sc.identity='".$this->escape($data['identity'])."'
								");
		if( !empty($query['customer_id']) )
			$dobor_customer_id = $query['customer_id'];
		else
		{
			 
			if( $this->get_config_param('socnetauth2_email_auth', 'socnetauth2') == 'noconfirm' 
				&& !empty($data['email'])
			)
			{
				$query = $this->query_row("SELECT * 
								   FROM `" . DB_PREFIX . "customer` c  
								   WHERE 
									c.email ='".$this->escape($data['email'])."'
								");
				if( !empty( $query['customer_id'] ) )
					$dobor_customer_id = $query['customer_id'];
			}
		}
		
		$RES = array();
		$RES['telephone'] = isset($query['telephone']) ? $query['telephone'] : '';
		$RES['email'] = isset($query['email']) ? $query['email'] : '';
		$RES['firstname'] = isset($query['firstname']) ? $query['firstname'] : '';
		$RES['lastname'] = isset($query['lastname']) ? $query['lastname'] : '';
		$RES['group'] = isset($query['customer_group_id']) ? $query['customer_group_id'] : '';
		 
		
		if( !empty($query['address_id']) )
		{
			$query_address = $this->query_row("SELECT * 
								   FROM `" . DB_PREFIX . "address` 
								   WHERE 
									address_id='".(int)$query['address_id']."'
								");
			
			if( !empty($query_address) )
			{
				
				$RES['company'] = $query_address['company'];
				$RES['address_1'] = $query_address['address_1'];
				$RES['postcode'] = $query_address['postcode'];
				
				$RES['city'] = $query_address['city'];
				$RES['zone'] = $query_address['zone_id'];
				$RES['country'] = $query_address['country_id'];
			}
		} 
		
		return $RES;
	}
	
	
	public function isNeedConfirm($data)
	{
		
		$confirm_data = array();
		
		if( $this->get_config_param('socnetauth2_confirm_agree_status') )
		{
			$confirm_data['agree'] = 1;
		}  
		
		if( $this->get_config_param('socnetauth2_confirm_agree2_status') )
		{
			$confirm_data['agree2'] = 1;
		}  
		
		if( $this->get_config_param('socnetauth2_confirm_agree3_status') )
		{
			$confirm_data['agree3'] = 1;
		}  
		
		
		if( $this->get_config_param('socnetauth2_confirm_firstname_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_firstname_status') == 1 && empty($data['firstname'])
			) )
		{
			$confirm_data['firstname'] = $data['firstname'];
		}  
		
		if( $this->get_config_param('socnetauth2_confirm_lastname_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_lastname_status') == 1 && empty($data['lastname'])
		) )
		{
			$confirm_data['lastname'] = $data['lastname'];
		}
		
		if( $this->get_config_param('socnetauth2_confirm_email_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_email_status') == 1 && empty($data['email'])
			) )
		{
			$confirm_data['email'] = $data['email'];
		}
		
		if( $this->get_config_param('socnetauth2_confirm_telephone_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_telephone_status') == 1 && empty($data['telephone'])
		) )
		{
			$confirm_data['telephone'] = $data['telephone'];
		}
		
		/* kin insert metka: c1 */
		if( $this->get_config_param('socnetauth2_confirm_company_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_company_status') == 1 && empty($data['company'])
		) )
		{
			$confirm_data['company'] = '';
		}
		
		if( $this->get_config_param('socnetauth2_confirm_address_1_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_address_1_status') == 1 && empty($data['address_1'])
		) )
		{
			$confirm_data['address_1'] = '';
		}
		
		if( $this->get_config_param('socnetauth2_confirm_postcode_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_postcode_status') == 1 && empty($data['postcode'])
		) )
		{
			$confirm_data['postcode'] = '';
		}
		
		if( $this->get_config_param('socnetauth2_confirm_city_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_city_status') == 1 && empty($data['city'])
		) )
		{
			$confirm_data['city'] = '';
		}
		
		if( $this->get_config_param('socnetauth2_confirm_zone_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_zone_status') == 1 && empty($data['zone'])
		) )
		{
			$confirm_data['zone'] = '';
		}
		
		if( $this->get_config_param('socnetauth2_confirm_country_status') == 2 || (
			$this->get_config_param('socnetauth2_confirm_country_status') == 1 && empty($data['country'])
		) )
		{
			$confirm_data['country'] = '';
		}
		/* end kin metka: c1 */
		
		/* start 2507 */
		
		if( $this->get_config_param('socnetauth2_confirm_newsletter') )
		{
			$confirm_data['newsletter'] = '';
		}
		/* end 2507 */
		/* start 1007 */
		$old_dobor = $this->getOldDoborData($data);
		
		
		foreach( $old_dobor as $key=>$val )
		{
			if( $this->get_config_param('socnetauth2_confirm_'.$key.'_hideifhas', 
										'socnetauth2' )
				&&
				!empty( $old_dobor[$key] )
				&& $key!='agree'
			)
			{
				unset( $confirm_data[$key] );
			}
		}
		
		/* end 1007 */
		
		if( !$confirm_data )
		{	
			return false;
		}
		else
		{		
			return $confirm_data;
		}
	}
	
	/* start 0306 */
	public function addCustomerComment($customer_id, $provider, $data)
	{
		
		$comment_ar = array();
		foreach($data as $key=>$val)
		{
			if( is_array($val) )
			{
				$comment_ar[] = $key.': array()';
				
				foreach($val as $k=>$v)
				{
					if( !is_array($v) && strlen($v) > 150 )
						$v = substr($v, 0, 150).'...';
					else
						$v = print_r($v, 1);
					
					$comment_ar[] = '--- '.$k.': '.$v;
				}
			}
			else
			{
				if( !is_array($val) && strlen($val) > 150 )
					$val = substr($val, 0, 150).'...';
				
				
				$comment_ar[] = $key.': '.$val;
			}
			
		}
		$comment = strtoupper($provider).":<br>";
		$comment .= implode("<br>", $comment_ar);
		
		$this->query_run("INSERT INTO `" . DB_PREFIX . "customer_history` 
								SET
								 date_added = NOW(),
								 comment = '".$this->escape($comment )."',
								 customer_id = '".(int)$customer_id."'"); 
	}
	/* end 0306 */
	
	public function addCustomer($data)
	{
		/* start 0207 */
		$is_email = 0;
		/* end 0207 */
		
		$fields = array("firstname", "lastname", "email", "telephone", "company", "postcode",
		"country", "zone", "city", "address_1", "link" );
		
		foreach($fields as $field)
		{
			if( !isset($data[$field]) )
			{
				$data[$field] = '';
			}
		}
		
		/* start 2507 */
		if( empty($data['country']) && $this->get_config_param('socnetauth2_default_country') )
		{
			$data['country'] = $this->get_config_param('socnetauth2_default_country');
		}
		/* end 2507 */
		
		$customer_group_id = $this->get_config_param('socnetauth2_'.$data['provider'].'_customer_group_id', 'socnetauth2');
		
		
		if( !$customer_group_id )
		$customer_group_id = $this->get_config_param('config_customer_group_id', 'config');
		
		$customer_id = '';
		if( empty($data['customer_id']) )
		{
			$this->query_run("INSERT INTO " . DB_PREFIX . "customer 
							  SET
								firstname = '".$this->escape($data['firstname'])."',
								lastname = '".$this->escape($data['lastname'])."',
								email = '".$this->escape($data['email'])."',
								telephone = '".$this->escape($data['telephone'])."',
								ip = '" . $this->escape($_SERVER['REMOTE_ADDR']) . "',
								approved = 1,
								customer_group_id = '" . (int)$customer_group_id . "', 
								status = '1', 
								date_added = NOW()");
								
			$customer_id = $this->get_last_insert_id();
			
			
			$this->query_run("INSERT INTO `" . DB_PREFIX . "socnetauth2_customer2account` 
							  SET
								 identity = '" .$this->escape($data['identity']) . "',
								 provider = '".$this->escape($data['provider']) ."',
								 data = '".$this->escape($data['data'])."',
								 link = '".$this->escape($data['link'])."',
								 email = '".$this->escape($data['email'])."',
								 customer_id = '".(int)$customer_id."'");
			
			
			$this->addActivity($customer_id, 'register', $data['identity']);
			$is_email = 1;
			/* end 0207 */
			
			
			/* start 2401 */
			$reward_customer_sv = $this->get_config_param( 'reward_customer_sv', 'reward_customer_sv' );
			
			if( !empty($reward_customer_sv['points_register']) ) { 

				$sql = "INSERT INTO " . DB_PREFIX . "customer_reward 
					  SET 
						customer_id = '" . (int)$customer_id . "', 
						description = 'Регистрация', 
						points = '" . (int)$reward_customer_sv['points_register'] . "', date_added = NOW()";
				$this->query_run($sql);
			}
			/* end 2401 */
		}
		else
		{
			$this->query_run("UPDATE " . DB_PREFIX . "customer 
							  SET
								firstname = '".$this->escape($data['firstname'])."',
								lastname = '".$this->escape($data['lastname'])."',
								email = '".$this->escape($data['email'])."',
								telephone = '".$this->escape($data['telephone'])."',
							    ip = '" . $this->escape($_SERVER['REMOTE_ADDR']) . "'
							  WHERE 
								customer_id='".(int)$data['customer_id']."'");
			$customer_id = $data['customer_id'];
			$this->addActivity($customer_id, 'login', $data['identity']);
		}
		
		if( $this->get_config_param('socnetauth2_save_to_addr')!='customer_only' )
		{
			if( empty($data['customer_id']) )
			{
			
				$this->query_run("INSERT INTO " . DB_PREFIX . "address 
				SET 
				customer_id = '" . (int)$customer_id . "', 
				firstname = '" . $this->escape($data['firstname']) . "', 
				lastname = '" . $this->escape($data['lastname']) . "', 
				company = '" . $this->escape($data['company']) . "', 
				address_1 = '" . $this->escape($data['address_1']) . "', 
				postcode = '" . $this->escape($data['postcode']) . "', 
				city = '" . $this->escape($data['city']) . "', 
				zone_id = '" . (int)$data['zone'] . "', 
				country_id = '" . (int)$data['country'] . "'");
		
				$address_id = $this->get_last_insert_id();
		
				$this->query_run("UPDATE " . DB_PREFIX . "customer 
						  SET address_id = '" . (int)$address_id . "' 
						  WHERE customer_id = '" . (int)$customer_id . "'");
			}
			else
			{
				$query = $this->query_row("SELECT * FROM " . DB_PREFIX . "customer 
										   WHERE customer_id='".(int)$data['customer_id']."'");
				/* start 1007 */
				if( !empty( $query['address_id'] ) )
				{
					$this->query_run("UPDATE " . DB_PREFIX . "address 
						SET  
							firstname = '" . $this->escape($data['firstname']) . "', 
							lastname = '" . $this->escape($data['lastname']) . "', 
							company = '" . $this->escape($data['company']) . "', 
							address_1 = '" . $this->escape($data['address_1']) . "', 
							postcode = '" . $this->escape($data['postcode']) . "', 
							city = '" . $this->escape($data['city']) . "', 
							zone_id = '" . (int)$data['zone'] . "', 
							country_id = '" . (int)$data['country'] . "'
						WHERE
							address_id = '" . (int)$query['address_id'] . "'");
				}
				/* end 1007 */
			}
		}
		
		/* start 0207 */
		if( $is_email && !empty($data['email']) )
		{
			$password = '';
			if( $this->get_config_param('socnetauth2_addpass') )
			{
				$password = substr( md5(  rand() ), 0, 6 );
				
				/* start 1007 */
				$this->query_run("UPDATE " . DB_PREFIX . "customer 
								  SET
									password = MD5( '".$this->escape($password)."' )
								WHERE customer_id = '".(int)$customer_id."'");
				/* end 1007 */
				
				$data['password'] = $password;
			}
			 
			$this->sendRegEmail($data); 
		}
		
		return $customer_id;
	}
	
	
	/* start 1302 */
	public function getCountryIdByCode($code)
	{	
		$result = $this->query_row("SELECT * FROM `" . DB_PREFIX . "country` 
						WHERE iso_code_2='".$this->escape($code)."'");
		
		if( !empty($result['country_id']) )
			return $result['country_id'];
	}
	/* end 1302 */
	
	/* start 1405 */
	public function getLink($data, $arr)
	{
		$link = '';
		
		$identity_list = array(
			#"mailru"=>1,
			"vkontakte"=>1,
			"facebook"=>1,
			"livejournal"=>1,
			"twitter"=>1,
			"linkedin"=>1,
			"wmkeeper.com"=>1,
			"last.fm"=>1,
			"aol.com"=>1,
			"gmail" => 1
		);
		
		if( !empty($identity_list[ $data['provider'] ]) )
		{
			$link = $data['identity'];
		}
		
		if( $data['provider'] == 'mailru' && !empty($data['identity']) )
		{
			if( strstr($data['identity'], 'http://openid.mail.ru/mail/') )
			{
				$key = str_replace('http://openid.mail.ru/mail/', "", $data['identity']);
				$link = 'https://my.mail.ru/mail/'.$key.'/';
			}
			else
			{
				$link = $data['identity'];
			}
		}
		elseif( $data['provider'] == 'odnoklasssniki' && !empty($data['identity']) )
		{
			$link = "http://ok.ru/profile/".$arr['identity'];
		}
		elseif( $data['provider'] == 'yandex' && !empty($arr['openid_identities'][0]) )
		{
			$link = $arr['openid_identities'][0];
		}
		elseif( $data['provider'] == 'gmail' && !empty($data['identity']) )
		{
			$link = 'https://plus.google.com/'.$data['identity'];
		}
		elseif( $data['provider'] == 'twitter' && !empty($arr['identity']) )
		{
			$link = $arr['identity'];
		}
		elseif( $data['provider'] == 'facebook' && !empty($arr['identity']) )
		{
			$link = $arr['identity'];
		}
		elseif( $data['provider'] == 'vkontakte' && !empty($arr['identity']) )
		{
			$link = $arr['identity'];
		}
		
		
		return $link;
	}
	
	
	function getSessionData($keyword)
	{
		if( !empty($_SESSION[$keyword]) )
			return $_SESSION[$keyword];
		
		if( !empty($_COOKIE[$keyword]) )
			return $_COOKIE[$keyword];
		
		$session_key = '';
		foreach( $_SESSION as $key=>$val )
		{
			if( is_array($val) ) 
			{
				foreach($val as $k=>$v)
				{
					if( $k == 'socnetauth2_lastlink' ) 
					{
						$session_key = $key;
					}
				}
				
			}
		}
		
		if( $session_key && !empty($_SESSION[$session_key][$keyword]) )
		{
			return $_SESSION[$session_key][$keyword];
		}
	}
	
	/* start 2803 */
	public function addActivity($customer_id, $activity_key, $identity)
	{
		if( !$this->get_config_param('config_customer_activity', 'config') )
		{
			return;
		}
		
		$customer_data = $this->query_row("SELECT * 
									FROM `" . DB_PREFIX . "customer` 
									WHERE customer_id='".(int)$customer_id."'");
		
		
		$account_data = $this->query_row("SELECT * 
			FROM `" . DB_PREFIX . "socnetauth2_customer2account` 
			WHERE identity = '" .$this->db->escape($identity) . "' 
			AND `customer_id`='".(int)$customer_id."'");
	
		
		$name = '';
		if( !empty($customer_data['firstname']) )
			$name .= $customer_data['firstname'];
		if( !empty($customer_data['lastname']) )
			$name .= ' '.$customer_data['lastname'];
		if( !empty( $account_data['provider'] ) )
			$name .= ' ('.strtoupper($this->socnets[ $account_data['provider'] ]['short']).')';
				 
		$activity_data = array(
			'customer_id' => $customer_id,
			'name'        => $name
		);
		
		$this->query_run("INSERT INTO `" . DB_PREFIX . "customer_activity` SET 
		`customer_id` = '" . (int)$customer_id . "', 
		`key` = '" . $this->db->escape($activity_key) . "', 
		`data` = '" . $this->db->escape(json_encode($activity_data)) . "', 
		`ip` = '" . $this->db->escape( $_SERVER['REMOTE_ADDR'] ) . "', 
		`date_added` = NOW()");
	 
	}
	/* end 2803 */
	
	
	public function getShopFolder($type = 'url')
	{
		$socnetauth2_shop_folder = $this->get_config_param('socnetauth2_shop_folder');
		if( $socnetauth2_shop_folder ) $socnetauth2_shop_folder = '/'.$socnetauth2_shop_folder;
		
		if( $this->get_config_param('socnetauth2_shop_folders', 'socnetauth2', 1) && 
			$this->STORE_ID )
		{
			$socnetauth2_shop_folders = $this->custom_unserialize( $this->get_config_param('socnetauth2_shop_folders', 'socnetauth2', 1) );
			if( !empty($socnetauth2_shop_folders[$this->STORE_ID]) )
				$socnetauth2_shop_folder = '/'.$socnetauth2_shop_folders[$this->STORE_ID];
			else
				$socnetauth2_shop_folder = '';
		}
		
		if( $this->get_config_param('socnetauth2_shop_folder_in_'.$type, 'socnetauth2', 1) )
			return $socnetauth2_shop_folder;
	}
	
	
	public function custom_unserialize($s)
	{
		if( is_array($s) ) return $s;
	
		if(
			stristr($s, '{' ) != false &&
			stristr($s, '}' ) != false &&
			stristr($s, ';' ) != false &&
			stristr($s, ':' ) != false
		){
			return unserialize($s);
		}else{
			return $s;
		}

	}
}

?>