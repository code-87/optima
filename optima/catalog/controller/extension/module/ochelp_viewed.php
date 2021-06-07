<?php
class ControllerExtensionModuleOchelpViewed extends Controller {
    public function index($setting) {
        static $module = 0;

        $this->load->language('extension/module/ochelp_viewed');

        $this->load->model('catalog/ochelp_viewed');

        if (isset($setting['title']) && $setting['title'][$this->config->get('config_language_id')]) {
            $data['heading_title'] = $setting['title'][$this->config->get('config_language_id')];
        } else {
            $data['heading_title'] = $this->language->get('heading_title');
        }

        if (isset($setting['link_text']) && $setting['link_text'][$this->config->get('config_language_id')]) {
            $data['text_show_all'] = $setting['link_text'][$this->config->get('config_language_id')];
        } else {
            $data['text_show_all'] = $this->language->get('text_show_all');
        }

        $data['show_link'] = $setting['link'];

        $data['link'] = $this->url->link('product/ochelp_viewed');

        if ($setting['limit']) {
            $data['limit'] = $setting['limit'];
        } else {
            $data['limit'] = 4;
        }

        $data['width'] = $setting['width'];

        $data['height'] = $setting['height'];

 		if (isset($this->request->cookie['viewed_product'])) {
 			$session_token = $this->request->cookie['viewed_product'];
 		}else{
 			$session_token = false;
 		}

        $results = array();
        
        $results = $this->model_catalog_ochelp_viewed->getViewedProduct($filter_data = array(), $session_token);

        $data['module'] = $module++;

        if ($results) {
            return $this->load->view('extension/module/ochelp_viewed', $data);
        }
    }

    public function getProducts() {
        $this->load->language('extension/module/ochelp_viewed');

        $this->load->model('catalog/ochelp_viewed');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['text_tax'] = $this->language->get('text_tax');

        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');

        $limit = $this->request->post['limit'];
        $width = $this->request->post['width'];
        $height = $this->request->post['height'];

 		if (isset($this->request->cookie['viewed_product'])) {
 			$session_token = $this->request->cookie['viewed_product'];
 		}else{
 			$session_token = false;
 		}

        $data['products'] = array();

        $filter_data = array(
        	'start' => 0,
        	'limit' => $limit
        );

        $results = array();

        $results = $this->model_catalog_ochelp_viewed->getViewedProduct($filter_data, $session_token);
 
        if ($results) {
            foreach ($results as $result) {
                if ($result) {
                    if ($result['image']) {
                        $image = $this->model_tool_image->resize($result['image'], $width, $height);
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', $width, $height);
                    }

                    if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $price = false;
                    }

                    if ((float) $result['special']) {
                        $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $special = false;
                    }

                    if ($this->config->get('config_tax')) {
                        $tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                    } else {
                        $tax = false;
                    }

                    if ($this->config->get('config_review_status')) {
                        $rating = $result['rating'];
                    } else {
                        $rating = false;
                    }

                    $data['products'][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
						'delete'      => $this->customer->isLogged() ? true : false,
                    );
                }
            }
        }

        if ($results) {
            $this->response->setOutput($this->load->view('extension/module/ochelp_viewed_products', $data));
        }
    }
}