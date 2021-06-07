<?php
class ModelAccountSocnetauth2 extends Model 
{
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
		/* end 0207 */
	);
	
	
	private function checkColumn($table, $column, $type)
	{
		$query = $this->db->query("SHOW COLUMNS FROM `".DB_PREFIX . $table."`");
		
		$hash = array();
		
		foreach($query->rows as $row)
		{
			$hash[ $row['Field'] ] = $row['Type'];
		}
		
		if( !isset($hash[ $column ]) )
		{
			$sql = "ALTER TABLE `" . DB_PREFIX . $table . "` 
			ADD `".$column."` ". $type ." NOT NULL";
			$this->db->query($sql);
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
				$this->db->query("ALTER TABLE  `" . DB_PREFIX . $table  . "` 
				CHANGE  `".$column."`  `".$column."` ".$type." NOT NULL");
			}
		}
	}
	
	
	
	public function clearAuthCode()
	{
		$this->checkColumn("socnetauth2_customer2account", "mdate", "DATETIME");
		$this->checkColumn("socnetauth2_customer2account", "code", "VARCHAR(300)");
		
		
		$this->db->query("UPDATE `" . DB_PREFIX . "socnetauth2_customer2account` 
			SET 
				code = ''
			WHERE 
				DATE_ADD(mdate, INTERVAL 15 MINUTE)<NOW()");
	}
	
	public function getCustomerIdByAuthCode($code)
	{
		$this->clearAuthCode();
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "socnetauth2_customer2account`
						  WHERE 
							`code` = '".$this->db->escape($code)."'");
		
		
		return isset( $query->row['customer_id'] ) ? $query->row['customer_id'] : '';
	}
	public function checkNew($data)
	{
		if( empty($data['identity']) ) exit("EMPTY ID");
	
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
			$identitis[$i] = " identity='".$this->db->escape($identitis[$i])."' ";
		}
		
		$wh = implode(" OR ", $identitis);
		
		$check = $this->db->query("SELECT * FROM `" . DB_PREFIX . "socnetauth2_customer2account` sc
								   JOIN `" . DB_PREFIX . "customer` c
								   ON c.customer_id=sc.customer_id
								   WHERE ".$wh);
								   
		if( empty($check->rows) && $this->config->get('socnetauth2_dobortype') == 'one' )
		{
			return false;
		}
		elseif( !empty( $check->row ) )
		{
			$upd = '';
			
			if( !empty($data['firstname']) )
			{
				$upd .= " firstname = '".$this->db->escape($data['firstname'])."', ";
			}
			
			if( !empty($data['lastname']) )
			{
				$upd .= " lastname = '".$this->db->escape($data['lastname'])."', ";
			}
			
			if( !empty($data['telephone']) )
			{
				$upd .= " telephone = '".$this->db->escape($data['telephone'])."', ";
			}
			
			if( !empty($data['email']) )
			{
				$upd .= " email = '".$this->db->escape($data['email'])."', ";
			}
			
			/* start 2507 */
			if( isset($data['newsletter']) )
			{
				$upd .= " newsletter = '".(int)$data['newsletter']."', ";
			}
			/* end 2507 */
			
			$this->db->query("UPDATE " . DB_PREFIX . "customer 
							  SET
							  ". $upd ."
							  
								ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'
							  WHERE
							    socnetauth2_identity = '" .$this->db->escape($data['identity']) . "'");
			
			$this->db->query("UPDATE " . DB_PREFIX . "socnetauth2_customer2account 
							  SET
								data = '".$this->db->escape($data['data'])."'
							  WHERE
							    identity = '" .$this->db->escape($data['identity']) . "'");
			
			
			$customer_data = $this->query_row("SELECT * FROM `" . DB_PREFIX . "customer`
								   WHERE customer_id = '" .$this->db->escape($check['customer_id']) . "'");	

			/* start specific block: system/library/customer.php */
			if( !empty($customer_data->row['cart']) && is_string($customer_data->row['cart']) ) {
				$cart = unserialize($customer_data->row['cart']);
				
				foreach ($cart as $key => $value) {
					if (!array_key_exists($key, $this->session->data['cart'])) {
						$this->session->data['cart'][$key] = $value;
					} else {
						$this->session->data['cart'][$key] += $value;
					}
				}			
			}

			if ( !empty($customer_data->row['wishlist']) && is_string($customer_data->row['wishlist'])) {
				if (!isset($this->session->data['wishlist'])) {
					$this->session->data['wishlist'] = array();
				}
								
				$wishlist = unserialize($customer_data->row['wishlist']);
			
				foreach ($wishlist as $product_id) {
					if (!in_array($product_id, $this->session->data['wishlist'])) {
						$this->session->data['wishlist'][] = $product_id;
					}
				}			
			}
			/* end specific block */

			
			return $customer_data->row['customer_id'];
		}
		else
		{
			return false;
		}
	}

	public function addCustomerComment($customer_id, $provider, $data)
	{
		$comment_ar = array();
		foreach($data as $key=>$val)
		{
			if( !is_array($val) && strlen($val) > 150 )
				$val = substr($val, 0, 150).'...';
			elseif( is_array($val) )
				$val = substr(json_encode($val), 0, 150).'...';
			
			$comment_ar[] = $key.': '.$val;
		}
		$comment = strtoupper($provider).":<br>";
		$comment .= implode("<br>", $comment_ar); 
		$this->db->query("INSERT INTO `" . DB_PREFIX . "customer_history` 
								SET
								 date_added = NOW(),
								 comment = '".$this->db->escape($comment )."',
								 customer_id = '".(int)$customer_id."'"); 
	}
	
	public function addCustomerAfterConfirm($data)
	{
		$query = $this->db->query("SELECT * 
									   FROM `" . DB_PREFIX . "customer`
									   WHERE `email`='".$this->db->escape($data['email'])."'");
			
		if( !empty($query->row) )
		{
			$query_account = $this->db->query("SELECT * FROM
					`" . DB_PREFIX . "socnetauth2_customer2account` 
					WHERE 
						identity = '" .$this->db->escape($data['identity']) . "' AND
						provider = '".$this->db->escape($data['provider']) ."' AND 
						`customer_id`='".(int)$query->row['customer_id']."'
					")->row;
					
			if( !$query_account )	
			{
				$this->db->query("INSERT INTO `" . DB_PREFIX . "socnetauth2_customer2account` 
								SET
								 identity = '" .$this->db->escape($data['identity']) . "',
								 provider = '".$this->db->escape($data['provider']) ."',
								 data = '".$this->db->escape($data['data'])."',
								 link = '".$this->db->escape($data['link'])."',
								 email = '".$this->db->escape($data['email'])."',
								 customer_id = '".(int)$query->row['customer_id']."'");
			}
			else
			{
				$this->db->query("UPDATE `" . DB_PREFIX . "socnetauth2_customer2account` 
								SET
									`data` = '".$this->db->escape($data['data'])."',
									`link` = '".$this->db->escape($data['link'])."'
								WHERE 
									identity = '" .$this->db->escape($data['identity']) . "' AND
									provider = '".$this->db->escape($data['provider']) ."' AND 
									`customer_id`='".(int)$query->row['customer_id']."'");
			}
			/* start 0702 */
			$fields = array("firstname", "lastname", "email", "telephone", "company", "postcode",
			"country", "zone", "city", "address_1", "link", "group" );
			
			foreach($fields as $field)
			{
				if( !isset($data[$field]) )
				{
					$data[$field] = '';
				}
			}
			
			/* start 2507 */
			if( empty($data['country']) && $this->config->get('socnetauth2_default_country') )
			{
				$data['country'] = $this->config->get('socnetauth2_default_country');
			}
			
			if( !isset($data['newsletter']) )
			{
				$data['newsletter'] = 0;
			}
			/* end 2507 */
			
			$data['customer_id'] = $query->row['customer_id'];
			
			$upd_ar_customer = array();
			$upd_ar_address = array();
			
			if( !empty($data['firstname']) || !empty($data['lastname']) )
			{
				$upd_ar_customer[] = "firstname = '".$this->db->escape($data['firstname'])."',";
				$upd_ar_address[]  = "firstname = '".$this->db->escape($data['firstname'])."',";
				
				$upd_ar_customer[] = "lastname = '".$this->db->escape($data['lastname'])."',";
				$upd_ar_address[]  = "lastname = '".$this->db->escape($data['lastname'])."',";
			}
			
			if( !empty($data['email']) )
				$upd_ar_customer[] = "email = '".$this->db->escape($data['email'])."',";
			
			if( !empty($data['newsletter']) )
				$upd_ar_customer[] = "newsletter = '".$this->db->escape($data['newsletter'])."',";
			
			if( !empty($data['telephone']) )
				$upd_ar_customer[] = "telephone = '".$this->db->escape($data['telephone'])."',";
			
			$this->db->query("UPDATE " . DB_PREFIX . "customer 
							  SET
								".implode(" ", $upd_ar_customer)."
							    ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'
							  WHERE 
								customer_id='".(int)$data['customer_id']."'");					 
				
			if( $this->config->get('socnetauth2_save_to_addr')!='customer_only' )
			{
				$query2 = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer 
											   WHERE customer_id='".(int)$data['customer_id']."'");
				
				if( !empty( $query2->row['address_id'] ) )
				{
					$this->db->query("UPDATE " . DB_PREFIX . "address 
							SET  
								".implode(" ", $upd_ar_address)."
								company = '" . $this->db->escape($data['company']) . "', 
								address_1 = '" . $this->db->escape($data['address_1']) . "', 
								postcode = '" . $this->db->escape($data['postcode']) . "', 
								city = '" . $this->db->escape($data['city']) . "', 
								zone_id = '" . (int)$data['zone'] . "', 
								country_id = '" . (int)$data['country'] . "'
							WHERE
								address_id = '" . (int)$query2->row['address_id'] . "'");
				}
				else
				{
					$this->db->query("INSERT INTO " . DB_PREFIX . "address 
					SET 
					customer_id = '" . (int)$data['customer_id'] . "', 
					firstname = '" . $this->db->escape($data['firstname']) . "', 
					lastname = '" . $this->db->escape($data['lastname']) . "', 
					company = '" . $this->db->escape($data['company']) . "', 
					address_1 = '" . $this->db->escape($data['address_1']) . "', 
					postcode = '" . $this->db->escape($data['postcode']) . "', 
					city = '" . $this->db->escape($data['city']) . "', 
					zone_id = '" . (int)$data['zone'] . "', 
					country_id = '" . (int)$data['country'] . "'");
			
					$address_id = $this->db->getLastId();
			
					$this->db->query("UPDATE " . DB_PREFIX . "customer 
							  SET address_id = '" . (int)$address_id . "' 
							  WHERE customer_id = '" . (int)$data['customer_id'] . "'");
					
				}
			}
			
			/* start 2803 */
			if($this->config->get('config_customer_activity') && !empty($query->row['customer_id']) )
			{
				$query_customer = $this->db->query("SELECT * 
									   FROM `" . DB_PREFIX . "customer`
									   WHERE `customer_id`='".(int)$query->row['customer_id']."'")->row;
				
				$query_account = $this->db->query("SELECT * FROM
					`" . DB_PREFIX . "socnetauth2_customer2account` 
					WHERE 
						identity = '" .$this->db->escape($data['identity']) . "' AND
						`customer_id`='".(int)$query->row['customer_id']."'
					")->row;
				
				$this->load->model('account/activity');

				$name = '';
				if( !empty($query_customer['firstname']) )
					$name .= $query_customer['firstname'];
				if( !empty($query_customer['lastname']) )
					$name .= ' '.$query_customer['lastname'];
				if( !empty( $query_account['provider'] ) )
					$name .= ' ('.strtoupper($this->socnets[ $query_account['provider'] ]['short']).')';
				 
			
				$name = trim($name);
					
				$activity_data = array(
					'customer_id' => $query->row['customer_id'],
					'name'        => $name
				);

				$this->model_account_activity->addActivity('login', $activity_data);
			}
			/* end 2803 */
		}
		
		return $query->row['customer_id'];
	}
	
	public function addCustomer($data)
	{
		$fields = array("firstname", "lastname", "email", "telephone", "company", "postcode",
		"country", "zone", "city", "address_1", "link", "group" );
		
		/* start 1007 */
		foreach($fields as $field)
		{
			if( !isset($data[$field]) )
			{
				$data[$field] = '';
			}
			$data[$field] = trim($data[$field]);
		}
		
		
		/* start 0203 */
		if (isset($_SESSION['default']['prmn.city_manager'])) 
		{
			if( empty($data['country']) && !empty($_SESSION['default']['prmn.city_manager']['country_id']) )
				$data['country'] = $_SESSION['default']['prmn.city_manager']['country_id'];
			if( empty($data['zone']) && !empty($_SESSION['default']['prmn.city_manager']['zone_id']) )
				$data['zone'] = $_SESSION['default']['prmn.city_manager']['zone_id'];
			if( empty($data['city']) && !empty($_SESSION['default']['prmn.city_manager']['city']) )
				$data['city'] = $_SESSION['default']['prmn.city_manager']['city'];
			if( empty($data['postcode']) && !empty($_SESSION['default']['prmn.city_manager']['postcode']) )
				$data['postcode'] = $_SESSION['default']['prmn.city_manager']['postcode'];
		}
		/* end 0203 */
		
		$update_customer = '';
		
		if( !empty($data['firstname']) )
			$update_customer .= " firstname = '".$this->db->escape($data['firstname'])."', ";
		
		if( !empty($data['lastname']) )
			$update_customer .= " lastname = '".$this->db->escape($data['lastname'])."', ";
		
		if( !empty($data['email']) )
			$update_customer .= " email = '".$this->db->escape($data['email'])."', ";
		
		if( !empty($data['telephone']) )
			$update_customer .= " telephone = '".$this->db->escape($data['telephone'])."', ";
		
		/* start 2507 */
		if( isset($data['newsletter']) )
			$update_customer .= " newsletter = '".(int)$data['newsletter']."', ";
		/* end 2507 */
		
		$update_address = '';
		
		if( !empty($data['firstname']) )
			$update_address .= " firstname = '".$this->db->escape($data['firstname'])."', ";
		
		if( !empty($data['lastname']) )
			$update_address .= " lastname = '".$this->db->escape($data['lastname'])."', ";
		
		if( !empty($data['company']) )
			$update_address .= " company = '".$this->db->escape($data['company'])."', ";
		
		if( !empty($data['address_1']) )
			$update_address .= " address_1 = '".$this->db->escape($data['address_1'])."', ";
		
		if( !empty($data['postcode']) )
			$update_address .= " postcode = '".$this->db->escape($data['postcode'])."', ";
		
		if( !empty($data['city']) )
			$update_address .= " city = '".$this->db->escape($data['city'])."', ";
		
		if( !empty($data['zone']) )
			$update_address .= " zone_id = '".$this->db->escape($data['zone'])."', ";
		
		if( !empty($data['country']) )
			$update_address .= " country_id = '".$this->db->escape($data['country'])."', ";
		/* start 2507 */
		elseif( $this->config->get('socnetauth2_default_country') )
			$update_address .= " country_id = '".(int)$this->config->get('socnetauth2_default_country')."', ";
		/* end 2507 */
		
		$update_address = preg_replace("/\, $/", "", $update_address);
		
		$activity_key = '';
		/* start 0102 */
		$updates = '';
		if( $data['group'] )
		{
			$customer_group_id = $data['group'];
			$updates = ", customer_group_id='".(int)$customer_group_id."' ";
		}
		else
			$customer_group_id = $this->config->get('socnetauth2_'.$data['provider'].'_customer_group_id');
		/* end 0102 */
		
		if( !$customer_group_id )
		$customer_group_id = $this->config->get('config_customer_group_id');
		
		$customer_id = '';
		
		if( !empty($data['data']) ) 
		{
			$data['data'] = preg_replace("/[\\\]+\'/", "'", $data['data']);			
		}
		
		if( $this->config->get('socnetauth2_email_auth') == 'noconfirm' && 
			!empty( $data['email'] ) )
		{
			$query = $this->db->query("SELECT * 
									   FROM `" . DB_PREFIX . "customer`
									   WHERE `email`='".$this->db->escape($data['email'])."'");
			
			if( !empty($query->row) )
			{
				$this->db->query("INSERT INTO `" . DB_PREFIX . "socnetauth2_customer2account` 
								SET
								 identity = '" .$this->db->escape($data['identity']) . "',
								 provider = '".$this->db->escape($data['provider']) ."',
								 data = '".$this->db->escape($data['data'])."',
								 link = '".$this->db->escape($data['link'])."',
								 email = '".$this->db->escape($data['email'])."',
								 customer_id = '".(int)$query->row['customer_id']."'");
								 
				$customer_id = $query->row['customer_id'];
				$activity_key = 'login';
			}
			/* start 2512 */
			else
			{
				/* start 1007 */
				$this->db->query("INSERT INTO " . DB_PREFIX . "customer 
							  SET
								".$update_customer."
								ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "',
								approved = 1,
								customer_group_id = '" . (int)$customer_group_id . "', 
								status = '1', 
								date_added = NOW()");
				
				$activity_key = 'register';
				
				
				$customer_id = $this->db->getLastId();
				
				if( $this->config->has('reward_customer_sv') )
				{
					$this->rwcsv->addPointsRegister($customer_id);
				}
				$data['customer_id'] = $customer_id;
				
				$this->db->query("INSERT INTO `" . DB_PREFIX . "socnetauth2_customer2account` 
							  SET
								 identity = '" .$this->db->escape($data['identity']) . "',
								 provider = '".$this->db->escape($data['provider']) ."',
								 data = '".$this->db->escape($data['data'])."',
								 link = '".$this->db->escape($data['link'])."',
								 email = '".$this->db->escape($data['email'])."',
								 customer_id = '".(int)$customer_id."'"); 
				
				/* start 0902 */
				$password = '';
				if( $this->config->get('socnetauth2_addpass') )
				{
					$password = substr( md5(  rand() ), 0, 6 );
					
					$this->db->query("UPDATE " . DB_PREFIX . "customer 
								  SET
									password = MD5( '".$this->db->escape($password)."' )
								WHERE customer_id = '".(int)$customer_id."'");
				}
				
				$this->sendNewCustomerMail($customer_id, $data['email'], $customer_group_id, $password);
				/* end 0902 */
			}
			/* end 2512 */ 
		}
		else
		{
			if( empty($data['customer_id']) )
			{
				/* start 1007 */
				$this->db->query("INSERT INTO " . DB_PREFIX . "customer 
							  SET
								".$update_customer."
								ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "',
								approved = 1,
								customer_group_id = '" . (int)$customer_group_id . "', 
								status = '1', 
								date_added = NOW()");
				
				$activity_key = 'register';
				
				
				$customer_id = $this->db->getLastId();
				
				if( $this->config->has('reward_customer_sv') )
				{
					$this->rwcsv->addPointsRegister($customer_id);
				}
								
				$this->db->query("INSERT INTO `" . DB_PREFIX . "socnetauth2_customer2account` 
							  SET
								 identity = '" .$this->db->escape($data['identity']) . "',
								 provider = '".$this->db->escape($data['provider']) ."',
								 data = '".$this->db->escape($data['data'])."',
								 link = '".$this->db->escape($data['link'])."',
								 email = '".$this->db->escape($data['email'])."',
								 customer_id = '".(int)$customer_id."'");
				
				/* start 0902 */
				$password = '';
				if( $this->config->get('socnetauth2_addpass') )
				{
					$password = substr( md5(  rand() ), 0, 6 );
					
					$this->db->query("UPDATE " . DB_PREFIX . "customer 
								  SET
									password = MD5( '".$this->db->escape($password)."' )
								WHERE customer_id = '".(int)$customer_id."'");
				}
				
				$this->sendNewCustomerMail($customer_id, $data['email'], $customer_group_id, $password);
				/* end 0902 */
			}
			else
			{
				
				$activity_key = 'login';
				$this->db->query("UPDATE " . DB_PREFIX . "customer 
							  SET
								".$update_customer."
								ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'
								".$updates."
							  WHERE 
								customer_id='".(int)$data['customer_id']."'");
				/* end 1007 */
				$customer_id = $data['customer_id'];
			}
		}
		/* end specific block */
		
		
		if( $this->config->get('socnetauth2_save_to_addr')!='customer_only' )
		{
			if( empty($data['customer_id']) )
			{
				/* start 1007 */
				$this->db->query("INSERT INTO " . DB_PREFIX . "address 
				SET 
				".$update_address.",
				customer_id = '" . (int)$customer_id . "'");
				/* end 1007 */
		
				$address_id = $this->db->getLastId();
		
				$this->db->query("UPDATE " . DB_PREFIX . "customer 
						  SET address_id = '" . (int)$address_id . "' 
						  WHERE customer_id = '" . (int)$customer_id . "'");
			}
			else
			{
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer 
										   WHERE customer_id='".(int)$data['customer_id']."'");
				
				if( !empty( $query->row['address_id'] ) )
				{
					/* start 1007 */
					$this->db->query("UPDATE " . DB_PREFIX . "address 
						SET  
							".$update_address."
						WHERE
							address_id = '" . (int)$query->row['address_id'] . "'");
					/* end 1007 */
				}
				
				/* start 0702 */
				else
				{
					/* start 1007 */
					$this->db->query("INSERT INTO " . DB_PREFIX . "address 
					SET 
					customer_id = '" . (int)$data['customer_id'] . "', 
					".$update_address."");
					/* end 1007 */
							
							
					$address_id = $this->db->getLastId();
			
					$this->db->query("UPDATE " . DB_PREFIX . "customer 
							  SET address_id = '" . (int)$address_id . "' 
							  WHERE customer_id = '" . (int)$data['customer_id'] . "'");
				}
				/* end 0702 */
			}
			
			
			
		}
		
		
		if ($this->config->get('config_customer_activity') && $activity_key ) 
		{
			$query_account = $this->db->query("SELECT * FROM
					`" . DB_PREFIX . "socnetauth2_customer2account` 
					WHERE 
						identity = '" .$this->db->escape($data['identity']) . "' AND
						`customer_id`='".(int)$customer_id."'
					")->row;
				
			$this->load->model('account/activity');

			$name = '';
			if( !empty($data['firstname']) )
				$name .= $data['firstname'];
			
			if( !empty($data['lastname']) )
				$name .= ' '.$data['lastname'];
					
			if( !empty( $query_account['provider'] ) )
				$name .= ' ('.strtoupper($this->socnets[ $query_account['provider'] ]['short']).')';
				 
			
			$name = trim($name);
					
			$activity_data = array(
				'customer_id' => $customer_id,
				'name'        => $name
			);
 
			$this->model_account_activity->addActivity($activity_key, $activity_data);
		}
		/* end 2803 */
		
		
		return $customer_id;
	}
	
	
	/* start 0502 */
	public function sendNewCustomerMail($customer_id, $email, $customer_group_id, $password)
	{
		/* start 2105 */
		if( !$email ) return;
		/* end 2105 */
		$this->load->model('account/customer_group');
		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);
		
		$customer_info = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer 
		WHERE customer_id = ".(int)$customer_id)->row;
		
		$data = array();
		$data['email'] = $email;
		$data['firstname'] = $customer_info['firstname'];
		$data['lastname'] = $customer_info['lastname'];
		$data['telephone'] = $customer_info['telephone'];

		// ----------------
		
		$this->load->language('mail/customer');

		$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

		$message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

		if (!$customer_group_info['approval']) {
			$message .= $this->language->get('text_login') . "\n";
			/* start 0902 */
			if($password)
			{
				$this->load->language('mail/socnetauth2');
				
				$entry_login_pass = $this->language->get('entry_login_pass');
				$entry_login_pass = str_replace("%1", $email, $entry_login_pass);
				$entry_login_pass = str_replace("%2", $password, $entry_login_pass);
				
				$message .= $entry_login_pass;
			}
			/* end 0902 */
		} else {
			$message .= $this->language->get('text_approval') . "\n";
		}

		$message .= $this->url->link('account/login', '', true) . "\n\n";
		$message .= $this->language->get('text_services') . "\n\n";
		$message .= $this->language->get('text_thanks') . "\n";
		$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($data['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject($subject);
		$mail->setText($message);
		$mail->send();

		// Send to main admin email if new account email is enabled
		if (in_array('account', (array)$this->config->get('config_mail_alert'))) {
			$message  = $this->language->get('text_signup') . "\n\n";
			$message .= $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n";
			$message .= $this->language->get('text_firstname') . ' ' . $data['firstname'] . "\n";
			$message .= $this->language->get('text_lastname') . ' ' . $data['lastname'] . "\n";
			$message .= $this->language->get('text_customer_group') . ' ' . $customer_group_info['name'] . "\n";
			$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
			$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($this->language->get('text_new_customer'), ENT_QUOTES, 'UTF-8'));
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_alert_email'));

			foreach ($emails as $email) {
				if (utf8_strlen($email) > 0 && filter_var($email, FILTER_VALIDATE_EMAIL)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}

	}
	/* end 0502 */
	
	
	public function checkUniqEmail($email)
	{
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer` WHERE email='".$this->db->escape($email)."'");
		
		if( $query->row ) 
			return false;
		else 
			return true;
	}
	
	public function getOldDoborData($loginza_data)
	{
		$RES = array(
			"firstname" => "", 
			"lastname" => "", 
			"email" => "", 
			"telephone" => "",
		
			/* start 2505 */
			"newsletter" => "",
			/* end 2505 */
			
			/* start 0102 */
			"group" => "",
			/* end 0102 */
			"company" => "", 
			"address_1" => "", 
			"postcode" => "", 
			"city" => "", 
			"zone" => "", 
			"country" => ""
		);
		
		
		/* start 1007 */ 
		
		$dobor_customer_id = 0;
		
		if( !empty( $loginza_data['data']['customer_id'] ) )
		{
			$dobor_customer_id = $loginza_data['data']['customer_id'];
		}
		else 
		{
			$query = $this->db->query("SELECT * 
								   FROM `" . DB_PREFIX . "customer` c 
								   JOIN `" . DB_PREFIX . "socnetauth2_customer2account` sc
								   ON c.customer_id=sc.customer_id
								   WHERE 
									sc.identity='".$this->db->escape($loginza_data['data']['identity'])."'
								");
			if( !empty( $query->row['customer_id'] ) )
				$dobor_customer_id = $query->row['customer_id'];
			elseif( $this->config->get('socnetauth2_email_auth') == 'noconfirm' 
					&& !empty($loginza_data['data']['email'])
			)
			{
				$query = $this->db->query("SELECT * 
								   FROM `" . DB_PREFIX . "customer` c  
								   WHERE 
									c.email ='".$this->db->escape($loginza_data['data']['email'])."'
								");
				if( !empty( $query->row['customer_id'] ) )
					$dobor_customer_id = $query->row['customer_id'];
			}
		}
		 
		if( empty($dobor_customer_id) ) return;
		 
		$query = $this->db->query("SELECT * 
								   FROM `" . DB_PREFIX . "customer` c  
								   WHERE 
									c.customer_id = '".(int)$dobor_customer_id."'");
		
		if( empty($query->row) ) return;
		$RES['dobor_customer_id'] = $dobor_customer_id;
		/* end 1007 */ 
		$RES['telephone'] = $query->row['telephone'];
		$RES['email'] = $query->row['email'];
		$RES['firstname'] = $query->row['firstname'];
		$RES['lastname'] = $query->row['lastname'];
		/* start 0102 */
		$RES['group'] = $query->row['customer_group_id'];
		/* end 0102 */
		
		if( !empty($query->row['address_id']) )
		{
			$query_address = $this->db->query("SELECT * 
								   FROM `" . DB_PREFIX . "address` 
								   WHERE 
									address_id='".(int)$query->row['address_id']."'
								");
			
			if( !empty($query_address->row) )
			{
				
				$RES['company'] = $query_address->row['company'];
				$RES['address_1'] = $query_address->row['address_1'];
				$RES['postcode'] = $query_address->row['postcode'];
				
				$RES['city'] = $query_address->row['city'];
				$RES['zone'] = $query_address->row['zone_id'];
				$RES['country'] = $query_address->row['country_id'];
			}
		}
		
		return $RES;
	}
	
	
	public function sendConfirmEmail($data)
	{
		$res = $this->db->query("SHOW TABLES");
		$installed = 0;
		foreach($res->rows as $key=>$val)
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
			$this->db->query($sql);
			
		}
				
		$code = substr(rand(0, 1000000000), 0, 7);
		$this->db->query("INSERT INTO `" . DB_PREFIX . "socnetauth2_precode`
						  SET 
							`identity` = '".$this->db->escape($data['identity'])."',
							`code` = '".$this->db->escape($code)."',
							`cdate`=NOW()");
		
		
		$subject = $this->language->get('text_mail_subject');
		$message = $this->language->get('text_mail_body');
		$message = str_replace("%", $code, $message);
		
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = $this->config->get('config_mail_smtp_password');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');			

		
		$mail->setTo($data['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml($message);
		$mail->send();
		
		return $code;
	}
	
	public function checkConfirmCode($identity, $code)
	{
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "socnetauth2_precode` 
								   WHERE identity='".$this->db->escape($identity)."' 
								   AND code='".$this->db->escape($code)."'");
		
		
		$this->db->query("DELETE FROM `" . DB_PREFIX . "socnetauth2_precode` 
						  WHERE DATE_ADD(cdate, INTERVAL 1 DAY) < NOW() ");
		
		if( $query->row ) 
			return true;
		else 
			return false;
	}
	
	/* start 1505 */
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
	
	public function getConfigPostValue($key)
	{
		return $this->config->get($key);
	}
	
	public function checkIsSocnetAvailable($key)
	{
		if( !$this->getConfigPostValue('socnetauth2_'.$key.'_status') )
			return false;
		
		if( $this->getConfigPostValue('socnetauth2_'.$key.'_agent') == 'loginza' )
			return true;
		
		if( $key == 'vkontakte' )
		{
			if( $this->getConfigPostValue('socnetauth2_vkontakte_appid') && 
				$this->getConfigPostValue('socnetauth2_vkontakte_appsecret')
			)
			{
				return true;
			}
		}
		elseif( $key == 'facebook' )
		{
			if( $this->getConfigPostValue('socnetauth2_facebook_appid') && 
				$this->getConfigPostValue('socnetauth2_facebook_appsecret')
			)
			{
				return true;
			}
		}
		elseif( $key == 'twitter' )
		{
			if( $this->getConfigPostValue('socnetauth2_twitter_consumer_key') && 
				$this->getConfigPostValue('socnetauth2_twitter_consumer_secret')
			)
			{
				return true;
			}
		}
		elseif( $key == 'odnoklassniki' )
		{
			if( $this->getConfigPostValue('socnetauth2_odnoklassniki_application_id') && 
				$this->getConfigPostValue('socnetauth2_odnoklassniki_public_key') && 
				$this->getConfigPostValue('socnetauth2_odnoklassniki_secret_key')
			)
			{
				return true;
			}
		}
		elseif( $key == 'gmail' )
		{
			if( $this->getConfigPostValue('socnetauth2_gmail_client_id') && 
				$this->getConfigPostValue('socnetauth2_gmail_client_secret')
			)
			{
				return true;
			}
		}
		elseif( $key == 'mailru' )
		{
			if( $this->getConfigPostValue('socnetauth2_mailru_id') && 
				$this->getConfigPostValue('socnetauth2_mailru_private') && 
				$this->getConfigPostValue('socnetauth2_mailru_secret')
			)
			{
				return true;
			}
		}
		elseif( $key == 'yandex' )
		{
			if( $this->getConfigPostValue('socnetauth2_yandex_client_id') && 
				$this->getConfigPostValue('socnetauth2_yandex_client_secret') && 
				(
					$this->getConfigPostValue('socnetauth2_yandex_rights_email') ||
					$this->getConfigPostValue('socnetauth2_yandex_rights_info')
				)
			)
			{
				return true;
			}
		}
		elseif( $key == 'steam' )
		{
			if( $this->getConfigPostValue('socnetauth2_steam_api_key') )
			{
				return true;
			}
		}
		/* start 2912 */
		elseif( $key == 'instagram' )
		{
			if( $this->getConfigPostValue('socnetauth2_instagram_client_id') &&
				$this->getConfigPostValue('socnetauth2_instagram_client_secret')  
			)
			{
				return true;
			}
		}
		/* end 2912 */
		
		return false;
	}
	
	public function getLoginzaLangCode($code)
	{
		$lang_hash = array(
				"ru"=>"ru",
				"uk"=>"uk",
				"ua"=>"uk",
				"be"=>"be",
				"fr"=>"fr",
				"en"=>"en"
		);
			
		if( isset($lang_hash[ $code ]) )
		{
			return $lang_hash[ $code ];
		}
		elseif( isset($lang_hash[ $this->config->get('config_language') ]) )
		{
			return $lang_hash[ $this->config->get('config_language') ];
		}
		else
		{
			return 'ru';
		}
	}
	
	public function getSocnets()
	{
		return $this->socnets;
	}
	
	
	public function getEnabledSocnets()
	{
		$socnetauth2_shop_folder = '';
		if( $this->config->get('socnetauth2_shop_folder') ) 
			$socnetauth2_shop_folder = '/'.$this->config->get('socnetauth2_shop_folder');
		
		if( $this->config->get('socnetauth2_shop_folders') && 
			$this->config->get('config_store_id') )
		{
			$socnetauth2_shop_folders = $this->custom_unserialize( $this->config->get('socnetauth2_shop_folders') );
			if( !empty($socnetauth2_shop_folders[$this->config->get('config_store_id')]) )
				$socnetauth2_shop_folder = '/'.$socnetauth2_shop_folders[$this->config->get('config_store_id')];
			else
				$socnetauth2_shop_folder = '';
		}
				
		$socnetauth2_code = str_replace("{shop_folder}", $socnetauth2_shop_folder, $socnetauth2_code);
					
		$http = 'http://';
		if( $this->config->get('socnetauth2_protokol') == 'detect' )
		{
			if( 
				( isset($this->request->server['SERVER_PORT']) && $this->request->server['SERVER_PORT'] == '443' ) || 
				!empty($this->request->server['HTTPS']) 
				|| ( !empty($this->request->server['HTTP_CF_VISITOR']) && strstr($this->request->server['HTTP_CF_VISITOR'], "https") )	
			)
				$http = 'https://';
			else
				$http = 'http://';
		}
		else
			$http = $this->config->get('socnetauth2_protokol'). '://';
		 
		$redirect_url = '';
		
		if( $this->config->get('socnetauth2_shop_folder_in_redirect') )
			$redirect_url = $http.
						$this->request->server['HTTP_HOST'].$socnetauth2_shop_folder.
						'/socnetauth2/loginza.php';
		else
			$redirect_url = $http.
						$this->request->server['HTTP_HOST'].
						'/socnetauth2/loginza.php';
		$redirect_url = urlencode($redirect_url);
		
		$lang = $this->getLoginzaLangCode( $this->config->get('config_language') );
		
		$result = array();
		foreach( $this->socnets as $key=>$socnet )
		{
			if( $this->checkIsSocnetAvailable($key) )
			{
				$link = '';
				if( $this->getConfigPostValue('socnetauth2_'.$key.'_agent') != 'loginza' )
				{
					if( $this->config->get('socnetauth2_shop_folder_in_url') ) 
						$link = $socnetauth2_shop_folder.'/socnetauth2/'.$key.'.php?first=1';
					else
						$link = '/socnetauth2/'.$key.'.php?first=1';
				}
				else
				{
					$link = "https://loginza.ru/api/widget?token_url=".$redirect_url."&provider=".
					$socnet['loginza_key']."&lang=".$lang."&providers_set=vkontakte,facebook,twitter,odnoklassniki,google,mailru,steam,yandex";
				}
				
				$socnet['link'] = $link;
				
				$result[] = $socnet;
			}
		}
		
		return $result;
	}
	
	public function getCountEnabledSocnets()
	{
		$count = 0;
		foreach( $this->socnets as $key=>$socnet )
		{
			if( $this->checkIsSocnetAvailable($key) )
			{
				$count++;
			}
		}
		
		return $count;
	}
	/* end 1505 */
}

?>