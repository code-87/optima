<?php
class ControllerExtensionModuleOchelpViewedSetting extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/ochelp_viewed_setting');

		$this->document->setTitle($this->language->get('heading_main_title'));

		$this->load->model('setting/setting');
		$this->load->model('extension/module/ochelp_viewed');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ochelp_viewed', $this->request->post);
			
			$this->url($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['action'] = $this->url->link('extension/module/ochelp_viewed_setting', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		$data['token'] = $this->session->data['token'];

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_history_total'] = sprintf($this->language->get('text_history_total'), $this->model_extension_module_ochelp_viewed->getTotalProductsHistory());

		$data['tab_setting'] = $this->language->get('tab_setting');
        $data['tab_support'] = $this->language->get('tab_support');

        $data['entry_url'] = $this->language->get('entry_url');
        $data['entry_limit'] = $this->language->get('entry_limit');
        $data['entry_product_limit'] = $this->language->get('entry_product_limit');
        $data['entry_ajax_status'] = $this->language->get('entry_ajax_status');
        $data['entry_link_status'] = $this->language->get('entry_link_status');

        $data['help_ajax'] = $this->language->get('help_ajax');
        $data['help_keyword'] = $this->language->get('help_keyword');
        $data['help_limit'] = $this->language->get('help_limit');
        $data['help_product_limit'] = $this->language->get('help_product_limit');
        $data['help_link'] = $this->language->get('help_link');
        $data['help_support'] = $this->language->get('help_support');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/ochelp_viewed_setting', 'token=' . $this->session->data['token'], true)
		);

		if (isset($this->request->post['ochelp_viewed_ajax'])) {
			$data['viewed_ajax_status'] = $this->request->post['ochelp_viewed_ajax'];
		} elseif($this->config->get('ochelp_viewed_ajax')) {
			$data['viewed_ajax_status'] = $this->config->get('ochelp_viewed_ajax');
		} else {
			$data['viewed_ajax_status'] = false;
		}

		if (isset($this->request->post['ochelp_viewed_limit'])) {
			$data['viewed_limit'] = $this->request->post['ochelp_viewed_limit'];
		} elseif($this->config->get('ochelp_viewed_limit')) {
			$data['viewed_limit'] = $this->config->get('ochelp_viewed_limit');
		} else {
			$data['viewed_limit'] = '7';
		}

		if (isset($this->request->post['ochelp_viewed_product_limit'])) {
			$data['viewed_product_limit'] = $this->request->post['ochelp_viewed_product_limit'];
		} elseif($this->config->get('ochelp_viewed_product_limit')) {
			$data['viewed_product_limit'] = $this->config->get('ochelp_viewed_product_limit');
		} else {
			$data['viewed_product_limit'] = '50';
		}

		$data['viewed_url'] = $this->model_extension_module_ochelp_viewed->getUrlAlias('product/ochelp_viewed');

		if (isset($this->request->post['ochelp_viewed_link'])) {
			$data['viewed_link_status'] = $this->request->post['ochelp_viewed_link'];
		} elseif($this->config->get('ochelp_viewed_link')) {
			$data['viewed_link_status'] = $this->config->get('ochelp_viewed_link');
		} else {
			$data['viewed_link_status'] = false;
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/ochelp_viewed_setting', $data));

	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/ochelp_viewed_setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	private function url($data) {
		$this->load->model('extension/module/ochelp_viewed');

		if (isset($data['ochelp_viewed_url']) && !empty($data['ochelp_viewed_url'])) {
			$this->model_extension_module_ochelp_viewed->setUrlAlias('product/ochelp_viewed', $data['ochelp_viewed_url']);
		} else {
			$this->model_extension_module_ochelp_viewed->deleteUrlAlias('product/ochelp_viewed');
		}
	}
}