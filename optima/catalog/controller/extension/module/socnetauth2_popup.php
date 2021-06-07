<?php
class ControllerExtensionModuleSocnetauth2popup extends Controller {
	private $data;
	
	public function index($setting) {
	
		$this->load->language('extension/module/socnetauth2');
		
		if ($this->customer->isLogged()) {
	  		return false;
    	}
		
		if( !$this->config->get('socnetauth2_status') ) return false;
		
		if( empty( $_COOKIE['show_socauth2_popup'] ) )
		{
			$this->data['show_socauth2_popup'] = 1;
		}
		else
		{
			$this->data['show_socauth2_popup'] = 0;
		}
		
		$this->data['socnetauth2_mobile_control'] = $this->config->get('socnetauth2_mobile_control');
		
		$this->load->model('account/socnetauth2');
		$this->data['count_socnets'] = $this->model_account_socnetauth2->getCountEnabledSocnets();
		
		$this->data['socnetauth2_socnets'] = $this->model_account_socnetauth2->getEnabledSocnets();
		
		if( $this->config->get('socnetauth2_shop_folder') ) 
			$this->data['socnetauth2_shop_folder'] = '/'.$this->config->get('socnetauth2_shop_folder');
		else
			$this->data['socnetauth2_shop_folder'] = '';
		
		
      	$this->data['heading_title'] = $this->language->get('heading_title_popup');
      	$this->data['text_skip'] = $this->language->get('text_skip');
		
		return $this->load->view('extension/module/socnetauth2_popup', $this->data);
	
		
	}
}
?>