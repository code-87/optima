<?php  
class ControllerExtensionModulesocnetauth2 extends Controller {
	private $data;
	
	public function index() {
		
		if( !$this->config->get('socnetauth2_design_widget_status') )
		{
			return;
		}
		
		if( $this->customer->isLogged() && $this->config->get('socnetauth2_widget_after')=='hide' ) return;
		
		$this->language->load('extension/module/socnetauth2');
		
		/* start 1505 */
		$this->load->model('account/socnetauth2');
		$socnetauth2_widget_name = $this->model_account_socnetauth2->custom_unserialize( 
			$this->config->get('socnetauth2_widget_name') 
		);		
		
    	$this->data['heading_title'] = $socnetauth2_widget_name[ $this->config->get('config_language_id') ];
		
		
		/* end 1505 */
		
		$this->data['entry_email'] = $this->language->get('entry_email');		
		$this->data['entry_password'] = $this->language->get('entry_password');		
		$this->data['text_register'] = $this->language->get('text_register');		
		$this->data['text_forgotten'] = $this->language->get('text_forgotten');		
		
		$this->data['text_register'] = $this->language->get('text_register');
    	$this->data['text_login'] = $this->language->get('text_login');
		$this->data['text_logout'] = $this->language->get('text_logout');
		$this->data['text_forgotten'] = $this->language->get('text_forgotten');
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_edit'] = $this->language->get('text_edit');
		$this->data['text_password'] = $this->language->get('text_password');
		$this->data['text_wishlist'] = $this->language->get('text_wishlist');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_download'] = $this->language->get('text_download');
		$this->data['text_return'] = $this->language->get('text_return');
		$this->data['text_transaction'] = $this->language->get('text_transaction');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		
		$this->data['register'] = $this->url->link('account/register', '', 'SSL');
    	$this->data['login'] = $this->url->link('account/login', '', 'SSL');
		$this->data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$this->data['password'] = $this->url->link('account/password', '', 'SSL');
		$this->data['wishlist'] = $this->url->link('account/wishlist');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');
		$this->data['download'] = $this->url->link('account/download', '', 'SSL');
		$this->data['return'] = $this->url->link('account/return', '', 'SSL');
		$this->data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
		$this->data['action'] = $this->url->link('account/login', '', 'SSL');
		
		$this->data['socnetauth2_widget_format'] = $this->config->get('socnetauth2_widget_format');	
		
		$this->data['logged'] = $this->customer->isLogged();
		
		
		$this->session->data['socnetauth2_lastlink'] = $this->request->server['REQUEST_URI'];
		
		$this->data['count_socnets'] = $this->model_account_socnetauth2->getCountEnabledSocnets();
		
		$this->data['socnetauth2_socnets'] = $this->model_account_socnetauth2->getEnabledSocnets();
		
		if( $this->config->get('socnetauth2_shop_folder') ) 
			$this->data['socnetauth2_shop_folder'] = '/'.$this->config->get('socnetauth2_shop_folder');
		else
			$this->data['socnetauth2_shop_folder'] = '';
		
		return $this->load->view('extension/module/socnetauth2', $this->data);
		
		
	}
	
	public function sortMethods($socnetauth2_methods)
	{
		$sortable_arr = array();
		
		foreach($socnetauth2_methods as $key=>$val)
		{
			$val['k'] = $key;
			$sortable_arr[] = $val;
		}
		
		usort($sortable_arr, array($this, "cmp"));
		
		$sorted_socnetauth2_methods = array();
		
		foreach($sortable_arr as $key=>$val)
		{
			$sorted_socnetauth2_methods[ $val['k'] ] = $val;
		}
		
		return $sorted_socnetauth2_methods;
	}
	
	protected function cmp($a, $b)
	{
		if($a['sort'] == $b['sort']) {
			return 0;
		}
	
		return ($a['sort'] < $b['sort']) ? -1 : 1;
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
}
?>