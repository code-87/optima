<?php
class ControllerAccountsocnetauth2 extends Controller {
	private $error = array();
	private $data = array();

	/* start 1601 */
	public function frame()
	{
		$this->response->setOutput( $this->getFrame() );
	}
	
	private function getFrame()
	{
		$this->data['is_noiframe'] = $this->config->get('socnetauth2_is_noiframe');
		
	/* end 1601 */
		$this->language->load('account/socnetauth2');
		$this->load->model('account/socnetauth2');
		
		$socnetauth_data = $this->getParam('socnetauth2_confirmdata');
		$socnetauth_data2 = $socnetauth_data;
		
		foreach($socnetauth_data2 as $key=>$val)
		{
			if( is_array( $val ) ) unset($socnetauth_data2[$key]);
		}
		
		
		if( strstr( implode(',', $socnetauth_data2), '1,2,3,4') )
		{
			return $this->getConfirmform(array("email" => $socnetauth_data[4],
									 "identity" => $socnetauth_data[5],
									 "link" => $socnetauth_data[6],
									 "provider" => $socnetauth_data[7],
									 "data" => serialize($socnetauth_data[8]) ) );
			
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && 
			$data = $this->validate($socnetauth_data['data'])) 
		{
			if( !empty($data['email']) 
				&& $this->config->get('socnetauth2_email_auth') == 'confirm' 
				&& !$this->model_account_socnetauth2->checkUniqEmail( $data['email'] ) 
			)
			{				
				$this->setParam('controlled_email', $data['email']);
				$this->model_account_socnetauth2->sendConfirmEmail( $data );
				
				return $this->getConfirmform($data);
			}
			
			$this->setParam('socnetauth2_confirmdata', '');
			$customer_id = $this->model_account_socnetauth2->addCustomer( $data );
			
			if( $customer_id && $this->getParam('socnetauth2_confirmdata_rawdata') )
			{
				$this->model_account_socnetauth2->addCustomerComment( 
					$customer_id, 
					$data['provider'],
					$this->getParam('socnetauth2_confirmdata_rawdata')
				);
			}
			
			if( $this->config->has('reward_customer_sv') )
			{
				#$this->rwcsv->addPointsRegister($customer_id);
			}
			
			
			$this->session->data['customer_id'] = $customer_id;	
			/* start 1601 */
			return $this->getSuccess();
			/* end 1601 */
		}
		
		$this->data['action'] = $this->url->link('account/socnetauth2/frame', '', 'SSL');
		
		$this->data['header'] = $this->language->get('header');
		$this->data['header_notice'] = $this->language->get('header_notice');
		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['text_none'] = $this->language->get('text_none');
		
		/* kin insert metka: c1 */
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_postcode'] = $this->language->get('entry_postcode');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
		$this->data['entry_country'] = $this->language->get('entry_country');
		
		$this->data['text_select'] = $this->language->get('text_select');
		
		$this->data['firstname_required'] = $this->config->get('socnetauth2_confirm_firstname_required');
		$this->data['lastname_required']  = $this->config->get('socnetauth2_confirm_lastname_required');
		$this->data['email_required']     = $this->config->get('socnetauth2_confirm_email_required');
		$this->data['telephone_required'] = $this->config->get('socnetauth2_confirm_telephone_required');
		$this->data['company_required']   = $this->config->get('socnetauth2_confirm_company_required');
		$this->data['postcode_required']  = $this->config->get('socnetauth2_confirm_postcode_required');
		$this->data['country_required']   = $this->config->get('socnetauth2_confirm_country_required');
		$this->data['zone_required']      =	$this->config->get('socnetauth2_confirm_zone_required');
		$this->data['city_required']      = $this->config->get('socnetauth2_confirm_city_required');
		$this->data['address_1_required'] = $this->config->get('socnetauth2_confirm_address_1_required');
		
		$old_dobor = array();
		
		#if( $this->config->get('socnetauth2_dobortype') == 'every' )
		#{
			$old_dobor = $this->model_account_socnetauth2->getOldDoborData( $socnetauth_data );
		#}
		
		/* start 1303 */
		$this->data['entry_agree'] = $this->language->get('entry_agree');
		$this->data['agree_required'] = $this->config->get('socnetauth2_confirm_agree_required');
		
		if( $this->config->get('socnetauth2_confirm_agree_status') )
		{
			$this->data['is_agree'] = 1;
		}
		else
		{
			$this->data['is_agree'] = 0;
		}
		
		
		$this->load->model('catalog/information');

		$this->data['inf'] = $this->model_catalog_information->getInformation( $this->config->get('socnetauth2_confirm_agree_status') );
		
		if( $this->data['inf'] )
			$this->data['inf']['href'] = $this->url->link( 'information/information', 
				'information_id='.$this->config->get('socnetauth2_confirm_agree_status') 
			);
		
		$this->data['inf2'] = $this->model_catalog_information->getInformation( $this->config->get('socnetauth2_confirm_agree2_status') );
		
		if( $this->data['inf2'] )
			$this->data['inf2']['href'] = $this->url->link( 'information/information', 
				'information_id='.$this->config->get('socnetauth2_confirm_agree2_status') 
			);
		$this->data['inf3'] = $this->model_catalog_information->getInformation( $this->config->get('socnetauth2_confirm_agree3_status') );
		
		if( $this->data['inf3'] )
			$this->data['inf3']['href'] = $this->url->link( 'information/information', 
				'information_id='.$this->config->get('socnetauth2_confirm_agree3_status') 
			);
		
		
		$this->data['entry_agrees'] = $this->language->get('entry_agrees');
		
		if( $this->config->get('socnetauth2_confirm_agree2_status') )
			$this->data['is_agree2'] = 1;
		else
			$this->data['is_agree2'] = 0;
		
		if( $this->config->get('socnetauth2_confirm_agree3_status') )
			$this->data['is_agree3'] = 1;
		else
			$this->data['is_agree3'] = 0;
		
		$this->data['count_agrees'] = 0;
		if( $this->data['is_agree'] )
			$this->data['count_agrees']++;
		if( $this->data['is_agree2'] )
			$this->data['count_agrees']++;
		if( $this->data['is_agree3'] )
			$this->data['count_agrees']++;
		
		if( $this->data['count_agrees'] > 1 )
		{
			$this->data['is_many_agree'] = 1;
			$this->data['entry_agree'] = $this->language->get('entry_agrees');
		}
		else
			$this->data['is_many_agree'] = 0;
	
		if( !empty( $this->error['agree2'] ) )
			$this->data['error_agree2'] = $this->language->get('error_agree');
		else
			$this->data['error_agree2'] = '';
		
		if( !empty( $this->error['agree3'] ) )
			$this->data['error_agree3'] = $this->language->get('error_agree');
		else
			$this->data['error_agree3'] = '';
		
		if( !empty( $this->error['agree'] ) )
		{
			$this->data['error_agree'] = $this->error['agree'];
		}
		else
		{
			$this->data['error_agree'] = '';
		}
		
		/* end 1303 */
		/* start 0102 */
		$this->data['entry_group'] = $this->language->get('entry_group');
		$this->data['group_required'] = $this->config->get('socnetauth2_confirm_group_required');
		
		$this->load->model('account/customer_group');
		/* start 0502 */
		$groups = $this->model_account_customer_group->getCustomerGroups();
		
		$group_display = $this->config->get('config_customer_group_display');
		$this->data['groups'] = array();
		if( $group_display )
		{
			foreach( $groups as $group )
			{
				if( in_array( $group['customer_group_id'], $group_display) )
				{
					$this->data['groups'][] = $group;
				}
			}
		}
		/* end 0502 */
		
		
		if( isset($this->request->post['group']) )
		{
			$this->data['group'] = $this->request->post['group'];
		}
		elseif( !empty( $old_dobor['group'] ) )
		{
			$this->data['group'] = $old_dobor['group'];
		}
		else
		{
			$this->data['group'] = '';
		}
		
		/* start 1007  */
		if( !empty($old_dobor['group']) && $this->config->get('socnetauth2_confirm_agree_hideifhas') )
		{
			$this->data['is_group'] = 0;
		} else
		/* end 1007 */
		if( $this->config->get('socnetauth2_confirm_group_status') )
		{
			$this->data['is_group'] = 1;
		}
		else
		{
			$this->data['is_group'] = 0;
		}
		/* end 0102 */
		
		
		$this->load->model('localisation/country');
    	$this->data['countries'] = $this->model_localisation_country->getCountries();

		if( isset($this->request->post['company']) )
		{
			$this->data['company'] = $this->request->post['company'];
		}
		elseif( !empty( $old_dobor['company'] ) )
		{
			$this->data['company'] = $old_dobor['company'];
		}
		else
		{
			$this->data['company'] = '';
		}
		
		if( isset($socnetauth_data['company']) )
		{
			$this->data['is_company'] = 1;
		}
		else
		{
			$this->data['is_company'] = 0;
		}
		
		if( isset($this->request->post['address_1']) )
		{
			$this->data['address_1'] = $this->request->post['address_1'];
		}
		elseif( !empty( $old_dobor['address_1'] ) )
		{
			$this->data['address_1'] = $old_dobor['address_1'];
		}
		else
		{
			$this->data['address_1'] = '';
		}
		
		if( isset($socnetauth_data['address_1']) )
		{
			$this->data['is_address_1'] = 1;
		}
		else
		{
			$this->data['is_address_1'] = 0;
		}
		
		if( isset($this->request->post['postcode']) )
		{
			$this->data['postcode'] = $this->request->post['postcode'];
		}
		elseif( !empty( $old_dobor['postcode'] ) )
		{
			$this->data['postcode'] = $old_dobor['postcode'];
		}
		else
		{
			$this->data['postcode'] = '';
		}
		
		if( isset($socnetauth_data['postcode']) )
		{
			$this->data['is_postcode'] = 1;
		}
		else
		{
			$this->data['is_postcode'] = 0;
		}
		
		if( isset($this->request->post['city']) )
		{
			$this->data['city'] = $this->request->post['city'];
		}
		elseif( !empty( $old_dobor['city'] ) )
		{
			$this->data['city'] = $old_dobor['city'];
		}
		else
		{
			$this->data['city'] = '';
		}
		
		if( isset($socnetauth_data['city']) )
		{
			$this->data['is_city'] = 1;
		}
		else
		{
			$this->data['is_city'] = 0;
		}
		
		if( isset($this->request->post['zone']) )
		{
			$this->data['zone'] = $this->request->post['zone'];
		}
		elseif( !empty( $old_dobor['zone'] ) )
		{
			$this->data['zone'] = $old_dobor['zone'];
		}
		else
		{
			$this->data['zone'] = '';
		}
		
		if( isset($socnetauth_data['zone']) )
		{
			$this->data['is_zone'] = 1;
		}
		else
		{
			$this->data['is_zone'] = 0;
		}
		
		/* start 2507 */
		$this->data['entry_newsletter'] = $this->language->get('entry_newsletter');
		
		if( $this->config->get('socnetauth2_confirm_newsletter') )
		{
			$this->data['is_newsletter'] = 1;
		}
		else
		{
			$this->data['is_newsletter'] = 0;
		}
		
		if( isset($this->request->post['newsletter']) )
		{
			$this->data['newsletter'] = $this->request->post['newsletter'];
		}
		elseif( !empty( $old_dobor['newsletter'] ) )
		{
			$this->data['newsletter'] = $old_dobor['newsletter'];
		}
		else
		{
			$this->data['newsletter'] = '';
		}
		/* end 2507 */
		
		
		if( isset($this->request->post['country']) )
		{
			$this->data['country'] = $this->request->post['country'];
		}
		elseif( !empty( $old_dobor['country'] ) )
		{
			$this->data['country'] = $old_dobor['country'];
		}
		else
		{
			$this->data['country'] = $this->config->get('config_country_id');
		}
		
		if( isset($socnetauth_data['country']) )
		{
			$this->data['is_country'] = 1;
		}
		else
		{
			$this->data['is_country'] = 0;
		}
		
		if( !empty( $this->error['company'] ) )
		{
			$this->data['error_company'] = $this->error['company'];
		}
		else
		{
			$this->data['error_company'] = '';
		}
		
		if( !empty( $this->error['address_1'] ) )
		{
			$this->data['error_address_1'] = $this->error['address_1'];
		}
		else
		{
			$this->data['error_address_1'] = '';
		}
		
		if( !empty( $this->error['postcode'] ) )
		{
			$this->data['error_postcode'] = $this->error['postcode'];
		}
		else
		{
			$this->data['error_postcode'] = '';
		}
		
		if( !empty( $this->error['city'] ) )
		{
			$this->data['error_city'] = $this->error['city'];
		}
		else
		{
			$this->data['error_city'] = '';
		}
		
		if( !empty( $this->error['zone'] ) )
		{
			$this->data['error_zone'] = $this->error['zone'];
		}
		else
		{
			$this->data['error_zone'] = '';
		}
		
		if( !empty( $this->error['country'] ) )
		{
			$this->data['error_country'] = $this->error['country'];
		}
		else
		{
			$this->data['error_country'] = '';
		}
		
		/* 
		company
		address_1
		address_2
		postcode
		city
		zone_id
		country_id
		end kin metka: c1 */
		
		$this->data['text_submit'] = $this->language->get('text_submit');
		
		
		
		if( !empty($this->request->post['firstname']) )
		{
			$this->data['firstname'] = $this->request->post['firstname'];
		}
		elseif( !empty($socnetauth_data['firstname']) )
		{
			$this->data['firstname'] = $socnetauth_data['firstname'];
		}
		elseif( !empty( $old_dobor['firstname'] ) )
		{
			$this->data['firstname'] = $old_dobor['firstname'];
		}
		else
		{
			$this->data['firstname'] = '';
		}
		
		if( isset($socnetauth_data['firstname']) )
		{
			$this->data['is_firstname'] = 1;
		}
		else
		{
			$this->data['is_firstname'] = 0;
		}
		
		if( !empty($this->request->post['lastname']) )
		{
			$this->data['lastname'] = $this->request->post['lastname'];
		}
		elseif( !empty($socnetauth_data['lastname']) )
		{
			$this->data['lastname'] = $socnetauth_data['lastname'];
		}
		elseif( !empty( $old_dobor['lastname'] ) )
		{
			$this->data['lastname'] = $old_dobor['lastname'];
		}
		else
		{
			$this->data['lastname'] = '';
		}
		
		if( isset($socnetauth_data['lastname']) )
		{
			$this->data['is_lastname'] = 1;
		}
		else
		{
			$this->data['is_lastname'] = 0;
		}
		
		if( !empty($this->request->post['email']) )
		{
			$this->data['email'] = $this->request->post['email'];
		}
		elseif( !empty($socnetauth_data['email']) )
		{
			$this->data['email'] = $socnetauth_data['email'];
		}
		elseif( !empty( $old_dobor['email'] ) )
		{
			$this->data['email'] = $old_dobor['email'];
		}
		else
		{
			$this->data['email'] = '';
		}
		
		if( isset($socnetauth_data['email']) )
		{
			$this->data['is_email'] = 1;
		}
		else
		{
			$this->data['is_email'] = 0;
		}
		
		if( !empty($this->request->post['telephone']) )
		{
			$this->data['telephone'] = $this->request->post['telephone'];
		}
		elseif( !empty($socnetauth_data['telephone']) )
		{
			$this->data['telephone'] = $socnetauth_data['telephone'];
		}
		elseif( !empty( $old_dobor['telephone'] ) )
		{
			$this->data['telephone'] = $old_dobor['telephone'];
		}
		else
		{
			$this->data['telephone'] = '';
		}
		
		/* start 1409 */
		$this->data['telephone_mask'] = $this->config->get('socnetauth2_telephone_mask');
		/* end 1409 */
		if( isset($socnetauth_data['telephone']) )
		{
			$this->data['is_telephone'] = 1;
		}
		else
		{
			$this->data['is_telephone'] = 0;
		}
		
		if( !empty( $this->error['firstname'] ) )
		{
			$this->data['error_firstname'] = $this->error['firstname'];
		}
		else
		{
			$this->data['error_firstname'] = '';
		}
		
		if( !empty( $this->error['lastname'] ) )
		{
			$this->data['error_lastname'] = $this->error['lastname'];
		}
		else
		{
			$this->data['error_lastname'] = '';
		}
		
		if( !empty( $this->error['email'] ) )
		{
			$this->data['error_email'] = $this->error['email'];
		}
		else
		{
			$this->data['error_email'] = '';
		}
		
		if( !empty( $this->error['telephone'] ) )
		{
			$this->data['error_telephone'] = $this->error['telephone'];
		}
		else
		{
			$this->data['error_telephone'] = '';
		}
		
		//-------------------------
		
		if(  version_compare(VERSION, '2.2.0.0') >= 0 )
		{
			return $this->load->view('account/socnetauth2_frame', $this->data);
		}
		else
		{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/socnetauth2_frame.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/account/socnetauth2_frame.tpl', $this->data);
			} else {
				return $this->load->view('default/template/account/socnetauth2_frame.tpl', $this->data);
			}
		}
		
		
	}
	
	/* start 1601 */
	public function success()
	{
		$this->response->setOutput( $this->getSuccess() );
	}
	
	private function getSuccess()
	{
	/* end 1601 */
		$this->language->load('account/socnetauth2');
		$this->data['header'] = $this->language->get('header');
		$this->data['success'] = $this->language->get('success');
		
		if(  version_compare(VERSION, '2.2.0.0') >= 0 )
		{
			return $this->load->view('account/socnetauth2_frame_success', $this->data);
		}
		else
		{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/socnetauth2_frame_success.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/account/socnetauth2_frame_success.tpl', $this->data);
			} else {
				return $this->load->view('default/template/account/socnetauth2_frame_success.tpl', $this->data);
			}
			
		}
		
		
	}
	
	
  	private function validate($data) {
    	
		if( isset( $this->request->post['firstname'] ) && 
			empty( $this->request->post['firstname'] ) &&
			$this->config->get('socnetauth2_confirm_firstname_required') 
		)
		{
			$this->error['firstname'] = $this->language->get('error_firstname');
		}
		
		if( isset( $this->request->post['lastname'] ) && 
			empty( $this->request->post['lastname'] ) &&
			$this->config->get('socnetauth2_confirm_lastname_required')  
		)
		{
			$this->error['lastname'] = $this->language->get('error_lastname');
		}
		
		if( isset( $this->request->post['email'] ) && 
			empty( $this->request->post['email'] ) &&
			$this->config->get('socnetauth2_confirm_email_required') 
		)
		{
			$this->error['email'] = $this->language->get('error_email');
		}
		elseif( 
			!empty( $this->request->post['email'] ) && 
			!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'] ) &&
			$this->config->get('socnetauth2_confirm_firstname_required') 
		)
		{
			$this->error['email'] = $this->language->get('error_email2');
		}
		
		if( isset( $this->request->post['telephone'] ) && 
			empty( $this->request->post['telephone'] ) &&
			$this->config->get('socnetauth2_confirm_telephone_required') )
		{
			$this->error['telephone'] = $this->language->get('error_telephone');
		}
		/* start 1809 */
		elseif( isset( $this->request->post['telephone'] ) && 
			!empty( $this->request->post['telephone'] ) &&
			strlen( preg_replace( "/[^\d]/", "", $this->request->post['telephone'] ) ) != 10 &&
			strlen( preg_replace( "/[^\d]/", "", $this->request->post['telephone'] ) ) != 11 &&
			strlen( preg_replace( "/[^\d]/", "", $this->request->post['telephone'] ) ) != 12 &&
			strlen( preg_replace( "/[^\d]/", "", $this->request->post['telephone'] ) ) != 13
		)
		{
			$this->error['telephone'] = $this->language->get('error_telephone2');
		}
		/* end 1809 */
		
		if( isset( $this->request->post['company'] ) && 
			empty( $this->request->post['company'] ) &&
			$this->config->get('socnetauth2_confirm_company_required') )
		{
			$this->error['company'] = $this->language->get('error_company');
		}
		
		/* start 1303 */
		if( $this->config->get('socnetauth2_confirm_agree_status') && 
			empty( $this->request->post['agree'] ) &&
			$this->config->get('socnetauth2_confirm_agree_required') )
		{
			$this->error['agree'] = $this->language->get('error_agree');
		}
		/* end 1303 */
		if( $this->config->get('socnetauth2_confirm_agree2_status') && 
			empty( $this->request->post['agree2'] ) &&
			$this->config->get('socnetauth2_confirm_agree2_required') )
		{
			$this->error['agree2'] = $this->language->get('error_agree');
		}
		
		if( $this->config->get('socnetauth2_confirm_agree3_status') && 
			empty( $this->request->post['agree3'] ) &&
			$this->config->get('socnetauth2_confirm_agree3_required') )
		{
			$this->error['agree3'] = $this->language->get('error_agree');
		}
		
		if( isset( $this->request->post['address_1'] ) && 
			empty( $this->request->post['address_1'] ) &&
			$this->config->get('socnetauth2_confirm_address_1_required') )
		{
			$this->error['address_1'] = $this->language->get('error_address_1');
		}
		
		if( isset( $this->request->post['postcode'] ) && 
			empty( $this->request->post['postcode'] ) &&
			$this->config->get('socnetauth2_confirm_postcode_required') )
		{
			$this->error['postcode'] = $this->language->get('error_postcode');
		}
		
		if( isset( $this->request->post['city'] ) && 
			empty( $this->request->post['city'] ) &&
			$this->config->get('socnetauth2_confirm_city_required') )
		{
			$this->error['city'] = $this->language->get('error_city');
		}
		
		if( isset( $this->request->post['zone'] ) && 
			empty( $this->request->post['zone'] ) &&
			$this->config->get('socnetauth2_confirm_zone_required') )
		{
			$this->error['zone'] = $this->language->get('error_zone');
		}
		
		if( isset( $this->request->post['country'] ) && 
			empty( $this->request->post['country'] ) &&
			$this->config->get('socnetauth2_confirm_country_required') )
		{
			$this->error['country'] = $this->language->get('error_country');
		}
		
    	if (!$this->error) {
			if( !empty($this->request->post['firstname']) )
			{
				$data['firstname'] = $this->request->post['firstname'];
			}
			
			if( !empty($this->request->post['lastname']) )
			{
				$data['lastname']  = $this->request->post['lastname'];
			}
						
			if( !empty($this->request->post['email']) )
			{
				$data['email']  = $this->request->post['email'];
			}
			
			/* start 0102 */
			if( !empty($this->request->post['group']) )
			{
				$data['group']  = $this->request->post['group'];
			}
			/* end 0102 */
						
			if( !empty($this->request->post['telephone']) )
			{
				$data['telephone']  = $this->request->post['telephone'];
			}
			
			if( !empty($this->request->post['company']) )
			{
				$data['company']  = $this->request->post['company'];
			}
			
			if( !empty($this->request->post['address_1']) )
			{
				$data['address_1']  = $this->request->post['address_1'];
			}
			
			if( !empty($this->request->post['postcode']) )
			{
				$data['postcode']  = $this->request->post['postcode'];
			}
			
			if( !empty($this->request->post['city']) )
			{
				$data['city']  = $this->request->post['city'];
			}
			
			if( !empty($this->request->post['zone']) )
			{
				$data['zone']  = $this->request->post['zone'];
			}
			
			if( !empty($this->request->post['country']) )
			{
				$data['country']  = $this->request->post['country'];
			}
			
			/* start 2507 */
			if( !empty($this->request->post['newsletter']) )
			{
				$data['newsletter']  = $this->request->post['newsletter'];
			}
			else
			{
				$data['newsletter']  = 0;
			}
			/* end 2507 */
			
      		return $data;
    	} else {
      		return false;
    	}  	
  	}
	
	
	protected function isNeedConfirm($data)
	{
		$confirm_data = array();
		/* start 0102 */
		if( $this->config->get('socnetauth2_confirm_group_status') == 1 )
		{
			$confirm_data['group'] = isset($data['group']) ?  $data['group'] : '';
		}
		/* end 0102 */
		
		if( $this->config->get('socnetauth2_confirm_firstname_status') == 2 || (
			$this->config->get('socnetauth2_confirm_firstname_status') == 1 && empty($data['firstname'])
			) )
		{
			$confirm_data['firstname'] = $data['firstname'];
		}
		
		if( $this->config->get('socnetauth2_confirm_lastname_status') == 2 || (
			$this->config->get('socnetauth2_confirm_lastname_status') == 1 && empty($data['lastname'])
		) )
		{
			$confirm_data['lastname'] = $data['lastname'];
		}
		
		if( $this->config->get('socnetauth2_confirm_email_status') == 2 || (
			$this->config->get('socnetauth2_confirm_email_status') == 1 && empty($data['email'])
			) )
		{
			$confirm_data['email'] = $data['email'];
		}
		
		if( $this->config->get('socnetauth2_confirm_telephone_status') == 2 || (
			$this->config->get('socnetauth2_confirm_telephone_status') == 1 && empty($data['telephone'])
		) )
		{
			$confirm_data['telephone'] = $data['telephone'];
		}
		
		/* kin insert metka: c1 */
		if( $this->config->get('socnetauth2_confirm_company_status') == 2 || (
			$this->config->get('socnetauth2_confirm_company_status') == 1 && empty($data['company'])
		) )
		{
			$confirm_data['company'] = '';
		}
		
		if( $this->config->get('socnetauth2_confirm_address_1_status') == 2 || (
			$this->config->get('socnetauth2_confirm_address_1_status') == 1 && empty($data['address_1'])
		) )
		{
			$confirm_data['address_1'] = '';
		}
		
		if( $this->config->get('socnetauth2_confirm_postcode_status') == 2 || (
			$this->config->get('socnetauth2_confirm_postcode_status') == 1 && empty($data['postcode'])
		) )
		{
			$confirm_data['postcode'] = '';
		}
		
		if( $this->config->get('socnetauth2_confirm_city_status') == 2 || (
			$this->config->get('socnetauth2_confirm_city_status') == 1 && empty($data['city'])
		) )
		{
			$confirm_data['city'] = '';
		}
		
		if( $this->config->get('socnetauth2_confirm_zone_status') == 2 || (
			$this->config->get('socnetauth2_confirm_zone_status') == 1 && empty($data['zone'])
		) )
		{
			$confirm_data['zone'] = '';
		}
		
		if( $this->config->get('socnetauth2_confirm_country_status') == 2 || (
			$this->config->get('socnetauth2_confirm_country_status') == 1 && empty($data['country'])
		) )
		{
			$confirm_data['country'] = '';
		}
		/* end kin metka: c1 */
		
		
		if( !$confirm_data )
		{	
			return false;
		}
		else
		{		
			return $confirm_data;
		}
	}
	
	public function country() 
	{
		$json = array();
		
		$this->load->model('localisation/country');

    	$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);
		
		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	
	/* start 1911 */
	public function getConfirmCode($ar=array())
	{
		if( !$this->getParam('socnetauth2_confirmdata') ||
			!$this->getParam('socnetauth2_confirmdata_show') 
			 ||
			(
				!empty( $this->request->get['lastlink'] ) &&  
				strstr($this->request->get['lastlink'], "information/information")
			)
			 ||
			(
				!empty( $this->request->get['lastroute'] ) &&  
				strstr($this->request->get['lastroute'], "information/information")
			)
		)
			exit();
		
		$socnetauth2_confirmdata = $this->getParam('socnetauth2_confirmdata');
		
		$dop = 0;
		
		if( !empty($socnetauth2_confirmdata['agree']) )
			$dop = 20;
		if( !empty($socnetauth2_confirmdata['agree2']) )
			$dop += 20;
		if( !empty($socnetauth2_confirmdata['agree3']) )
			$dop += 20;
		
			
		
		$tmp_data = array(
			"divframe_height" => $dop+(340-(32*(5-(count($this->getParam('socnetauth2_confirmdata')))))),
			"frame_height"    => $dop+(360-(32*(5-(count($this->getParam('socnetauth2_confirmdata')))))),
			"lastlink"        => isset($this->request->get['lastlink']) ? urldecode($this->request->get['lastlink']) : '',
			"lastroute"        => isset($this->request->get['route']) ? urldecode($this->request->get['route']) : '',
			"socnetauth2_is_close_disabled" => $this->config->get('socnetauth2_is_close_disabled'),
			"frame_url"		  => $this->url->link( 'account/socnetauth2/frame', '', 'SSL' )
		);
	
		
		if( !$this->config->get('socnetauth2_is_noiframe') )
		{
			$tmp_data['is_iframe'] = 1;
		}
		else
		{
			$tmp_data['noframe'] = $this->getFrame();
			$tmp_data['is_iframe'] = 0;
		}
		
		
		$socnetauth2_confirm_block = '';
		if(  version_compare(VERSION, '2.2.0.0') >= 0 )
		{
			$socnetauth2_confirm_block = $this->load->view('account/socnetauth2_confirm', $tmp_data);
		}
		else
		{
			$socnetauth2_confirm_block = $this->load->view('default/template/account/socnetauth2_confirm.tpl', $tmp_data);
		}
		
		exit($socnetauth2_confirm_block); 
	}
	/* start 1911 */
	
	/* start 1505 */
	public function showcode($ar=array())
	{
		$this->load->model('account/socnetauth2');
			
		if( empty($this->session->data['customer_id']) && 
			!empty($_COOKIE['socnetauth2_authcode']) &&
			$customer_id = $this->model_account_socnetauth2->getCustomerIdByAuthCode( 
				$_COOKIE['socnetauth2_authcode'] 
			)
		)
		{
			$this->session->data['customer_id'] = $customer_id;
			setcookie('socnetauth2_authcode', '', time()+3600, '/');
				
			header("Location: ".$this->request->server['REQUEST_URI']);
			exit();
		}
		
		$this->model_account_socnetauth2->clearAuthCode();
		
		$SOCNETAUTH2_DATA = array();
		$SOCNETAUTH2_DATA['code'] = '';
		
		if( !$this->config->get('socnetauth2_status') ) return $SOCNETAUTH2_DATA;
		if( $this->customer->isLogged() ) return $SOCNETAUTH2_DATA;
		
		$STR = 'account';
		
		if( !empty($this->request->get['route']) )
		{
			if( $this->request->get['route'] == 'checkout/login' ) $STR = 'checkout';
			elseif( $this->request->get['route'] == 'account/register' ) $STR = 'reg';
			elseif( $this->request->get['route'] == 'checkout/simplecheckout' ) $STR = 'checkout';
			elseif( $this->request->get['route'] == 'account/simpleregister' ) $STR = 'reg';
			elseif( $this->request->get['route'] == 'checkout/checkout' ) $STR = 'checkout';
			elseif( strstr($this->request->get['route'], 'checkout' ) ) $STR = 'checkout';
			elseif( strstr($this->request->get['route'], 'fastorder' ) ) $STR = 'checkout';
		}
		
		if( !empty( $ar['str'] ) )
		{
			$STR = $ar['str'];
		}
		
		$SOCNETAUTH2_DATA['format'] = $this->config->get('socnetauth2_'.$STR.'_format');
		
		if( !empty($ar['format']) ) $SOCNETAUTH2_DATA['format'] = $ar['format'];
		
		if( !empty($this->request->get['socnetauth2close']) )
		{
			$this->setParam('socnetauth2_confirmdata_show', 0);
		}
		
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
		 
			
		/* start 2106 */
		if( !strstr($this->request->server['REQUEST_URI'], 'common/cart/info') 
			&& 
			!strstr($this->request->server['REQUEST_URI'], 'revolution/revpopuplogin') 
		)
		{
			$lastlink = $http.$this->request->server['HTTP_HOST'].$this->request->server['REQUEST_URI'];
			$lastlink = str_replace("checkout/login", "checkout/checkout", $lastlink);
			$lastlink = str_replace("&socnetauth2close=1", "", $lastlink);
			$lastlink = str_replace("?socnetauth2close=1", "", $lastlink);
			
			$this->setParam('socnetauth2_lastlink', $lastlink);
		}
		/* end 2106 */


		if( !empty($ar['dobor_only']) )
		{
			if( strstr($lastlink, "?") )
				$lastlink .= '&socnetauth2close=1';
			else
				$lastlink .= '?socnetauth2close=1';
				
			$tmp_data = array(
			"lastlink"        => isset($this->request->get['lastlink']) ? urldecode($this->request->get['lastlink']) : '',
			"lastroute"        => isset($this->request->get['route']) ? urldecode($this->request->get['route']) : '',
			);
			
			if(  version_compare(VERSION, '2.2.0.0') >= 0 )
			{
				$socnetauth2_confirm_block = $this->load->view('account/socnetauth2_confirm_js', $tmp_data);
			}
			else
			{
				$socnetauth2_confirm_block = $this->load->view('default/template/account/socnetauth2_confirm_js.tpl', $tmp_data);
			}
			
			if( !$this->config->get('config_maintenance') || !empty($this->session->data['user_id']) )
			$SOCNETAUTH2_DATA['code'] .= $socnetauth2_confirm_block;
		}
		
		if( empty($ar['dobor_only']) && 
			$this->config->get('socnetauth2_design_'.$STR.'_status' ) )
		{
			$socnetauth2_code = $this->config->get('socnetauth2_'.$STR.'_code_'.$SOCNETAUTH2_DATA['format']);
			
			$socnetauth2_code = $this->custom_unserialize($socnetauth2_code);
			
			if( !empty($socnetauth2_code[ $this->config->get('config_language_id') ]) )
			{
				$socnetauth2_code = $socnetauth2_code[ $this->config->get('config_language_id') ];
				
				$socnetauth2_shop_folder = '';
				if( $this->config->get('socnetauth2_shop_folder') )
					$socnetauth2_shop_folder .= '/'.$this->config->get('socnetauth2_shop_folder');
				
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
					
				$redirect_url = '';
				if( $this->config->get('socnetauth2_shop_folder_in_redirect') )
					$redirect_url = $http.$this->request->server['HTTP_HOST'].$socnetauth2_shop_folder.'/socnetauth2/loginza.php';
				else
					$redirect_url = $http.$this->request->server['HTTP_HOST'].'/socnetauth2/loginza.php';
				$redirect_url = urlencode($redirect_url);
				
				$socnetauth2_code = str_replace("#redirect_url#", $redirect_url, $socnetauth2_code);
				
				$SOCNETAUTH2_DATA['code'] .= $socnetauth2_code;
			}
		}
		
		/* start 2408 */
		$this->load->model('account/socnetauth2');
		$socnets = $this->model_account_socnetauth2->getSocnets();
		foreach( $socnets as $socnet )
		{
			if( $socnet['short'] == 'od' )
				$socnet['short'] = 'ok';	
			
			if( strstr($SOCNETAUTH2_DATA['code'], "{title_".$socnet['short']."}") )
			{
				$title = $this->custom_unserialize( $this->config->get('socnetauth2_'.$socnet['key'].'_title') );
				
				if( isset( $title[ $this->config->get('config_language_id') ] ) )
					$title = $title[ $this->config->get('config_language_id') ]; 
				else
					$title = '';
				
				$SOCNETAUTH2_DATA['code'] = str_replace(
					"{title_".$socnet['short']."}", 
					$title,
					$SOCNETAUTH2_DATA['code']
				);
			}
		}
		/* end 2408 */
		
		$SOCNETAUTH2_DATA['code'] = html_entity_decode($SOCNETAUTH2_DATA['code'], 
													   ENT_QUOTES, 'UTF-8');
			
		return $SOCNETAUTH2_DATA;
	}
	

	public function closeWindow()
	{
		$this->setParam('socnetauth2_confirmdata_show', 0);
		exit('OK');
	}
	
	public function showcode2($ar=array())
	{
		return $this->showcode2($ar);
	}
	
	private function custom_unserialize($s)
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
	/* end 1505 */
	
	public function confirmform($data = array() )
	{
		$this->response->setOutput( $this->getConfirmform($data) );
	}
	
	private function getConfirmform($data = array() )
	{
		$this->data['is_noiframe'] = $this->config->get('socnetauth2_is_noiframe');
			
		$this->language->load('account/socnetauth2');
		$this->data['confirmform_header'] = $this->language->get('confirmform_header');
		$this->data['confirmform_entry_code'] = $this->language->get('confirmform_entry_code');
		$this->data['confirmform_message'] = $this->language->get('confirmform_message');
		$this->data['confirmform_button'] = $this->language->get('confirmform_button');
		
		
		$this->data['action'] = $this->url->link('account/socnetauth2/confirmation', '', 'SSL');
		
		$this->data['error_code'] = '';
		
		if( !empty( $this->error['error_code'] ) )
		$this->data['error_code'] = $this->error['error_code'];
		
		if( !empty($this->request->post['data']) )
		{
			$this->data['data'] = $this->request->post['data'];
		}
		else
		{
			$this->data['data'] = $data;
		}
		
		if(  version_compare(VERSION, '2.2.0.0') >= 0 )
		{
			return $this->load->view('account/socnetauth2_frame_confirmform', $this->data);
		}
		else
		{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/socnetauth2_frame_confirmform.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/account/socnetauth2_frame_confirmform.tpl', $this->data);
			} else {
				return $this->load->view('default/template/account/socnetauth2_frame_confirmform.tpl', $this->data);
			}
		}
	}
	
	public function confirmation()
	{
		$this->language->load('account/socnetauth2');
		$this->load->model('account/socnetauth2');
		
		if( $this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateConfirm() )
		{
			/* start 0609 */
			$this->request->post['data']['email'] = $this->getParam('controlled_email');
			$this->setParam('socnetauth2_confirmdata', '');
			$this->setParam('controlled_email', '');
			/* end 0609 */
			
			
			$customer_id = $this->model_account_socnetauth2->addCustomerAfterConfirm( $this->request->post['data'] );
			
			if( $this->config->has('reward_customer_sv') )
			{
				#$this->rwcsv->addPointsRegister($customer_id);
			}
			
			if( $customer_id && $this->getParam('socnetauth2_confirmdata_rawdata') )
			{
				$this->model_account_socnetauth2->addCustomerComment( 
					$customer_id, 
					$this->request->post['data']['provider'], 
					$this->getParam('socnetauth2_confirmdata_rawdata')
				);
			}
			
			$this->session->data['customer_id'] = $customer_id;	
			
			$this->success();
			return;
		}
		
		$this->confirmform();
	}
	
  	private function validateConfirm() 
	{
    	if( empty($this->request->post['code']) )
		{
			$this->error['error_code'] = $this->language->get('error_code_empty');
		}
		elseif( !$this->model_account_socnetauth2->checkConfirmCode( 
					$this->request->post['data']['identity'], 
					$this->request->post['code'] ) )
		{
			$this->error['error_code'] = $this->language->get('error_code_invalid');
		}
		elseif( !$this->getParam('controlled_email') )
		{
			exit('error_email');
		}
		
		if( $this->error ) return false;
		else return true;
	}
	
	private function getParam($key)
	{
		if( !empty($this->session->data[ $key ]) )
		{
			return $this->custom_unserialize( $this->session->data[ $key ] );
		}
		elseif( !empty($this->request->cookie[$key]) )
		{
			return $this->custom_unserialize( 
				html_entity_decode($this->request->cookie[ $key ])
			);
		}
	}
	
	private function setParam($key, $value)
	{
		$this->session->data[ $key ] = $value;
		$this->request->cookie[ $key ] = '';
		setcookie($key, $value, time()+3600, '/');
	}
}
?>