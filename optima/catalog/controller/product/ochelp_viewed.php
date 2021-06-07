<?php
class ControllerProductOchelpViewed extends Controller {

    public function index() {
    	if($this->config->get('ochelp_viewed_ajax')){
    		$this->getAjaxList();
    	}else{ 
    		$this->getList();
    	}
    }

    private function getList() {

        $this->load->language('product/ochelp_viewed');

        $this->load->model('catalog/product');

        $this->load->model('catalog/ochelp_viewed');

        $this->load->model('tool/image');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->get['limit'])) {
            $limit = (int) $this->request->get['limit'];
        } else {
            $limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
        );

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('product/ochelp_viewed', $url),
        );

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_empty'] = $this->language->get('text_empty');
        $data['text_quantity'] = $this->language->get('text_quantity');
        $data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $data['text_model'] = $this->language->get('text_model');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_tax'] = $this->language->get('text_tax');
        $data['text_points'] = $this->language->get('text_points');
        $data['text_limit'] = $this->language->get('text_limit');

        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');
        $data['button_list'] = $this->language->get('button_list');
        $data['button_grid'] = $this->language->get('button_grid');

        if (isset($this->request->cookie['viewed_product'])) {
            $session_token = $this->request->cookie['viewed_product'];
        }else{
            $session_token = false;
        }

        $data['products'] = array();

        $filter_data = array(
            'start' => ($page - 1) * $limit,
            'limit' => $limit,
        );

        $results = array();

        $results = $this->model_catalog_ochelp_viewed->getViewedProduct($filter_data, $session_token);
        
        $product_total = $this->model_catalog_ochelp_viewed->getTotalViewedProduct($session_token);

        foreach ($results as $result) {
        	if ($result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }

                if (!$this->config->get('config_customer_price')) {
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
                    $rating = (int) $result['rating'];
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
                    'minimum'     => ($result['minimum'] > 0) ? $result['minimum'] : 1,
                    'rating'      => $rating,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                    'delete'      => $this->customer->isLogged() ? true : false,
                );
            }
        }
        
        $url = '';

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $url = '';

        $data['limits'] = array();

        $limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

        sort($limits);

        foreach ($limits as $value) {
            $data['limits'][] = array(
                'text' => $value,
                'value' => $value,
                'href' => $this->url->link('product/ochelp_viewed', $url . '&limit=' . $value),
            );
        }

        $url = '';

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->url = $this->url->link('product/ochelp_viewed', $url . '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

        // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
        if ($page == 1) {
            $this->document->addLink($this->url->link('product/ochelp_viewed', '', true), 'canonical');
        } elseif ($page == 2) {
            $this->document->addLink($this->url->link('product/ochelp_viewed', '', true), 'prev');
        } else {
            $this->document->addLink($this->url->link('product/ochelp_viewed', 'page=' . ($page - 1), true), 'prev');
        }

        if ($limit && ceil($product_total / $limit) > $page) {
            $this->document->addLink($this->url->link('product/ochelp_viewed', 'page=' . ($page + 1), true), 'next');
        }

        if (isset($this->request->get['page']) && $this->request->get['page'] > ceil($product_total / $limit)) {
            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
        }

        $data['limit'] = $limit;

        $data['button_continue'] = $this->language->get('button_continue');

        $data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('product/ochelp_viewed', $data));
    }

    private function getAjaxList(){
    	$this->load->language('product/ochelp_viewed');

        $this->load->model('catalog/product');

        $this->load->model('catalog/ochelp_viewed');

        $this->load->model('tool/image');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('product/ochelp_viewed'),
        );

        if (isset($this->request->get['page'])) {
            $data['page'] = $this->request->get['page'];
        } else {
            $data['page'] = 1;
        }

        if (isset($this->request->get['limit'])) {
            $data['limit'] = (int) $this->request->get['limit'];
        } else {
            $data['limit'] = $this->config->get($this->config->get('config_theme') . '_product_limit');
        }

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');

        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('product/ochelp_viewed_ajax', $data));
    }

    public function getProducts(){
    	$this->load->language('product/ochelp_viewed');
    	
        $this->load->model('catalog/product');

        $this->load->model('catalog/ochelp_viewed');

        $this->load->model('tool/image');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_empty'] = $this->language->get('text_empty');
        $data['text_quantity'] = $this->language->get('text_quantity');
        $data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $data['text_model'] = $this->language->get('text_model');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_tax'] = $this->language->get('text_tax');
        $data['text_points'] = $this->language->get('text_points');
        $data['text_limit'] = $this->language->get('text_limit');

        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');
        $data['button_list'] = $this->language->get('button_list');
        $data['button_grid'] = $this->language->get('button_grid');

        $url = '';

        if (isset($this->request->post['page'])) {
            $url .= '&page=' . $this->request->post['page'];
        }

        if (isset($this->request->post['limit'])) {
            $url .= '&limit=' . $this->request->post['limit'];
        }

        if (isset($this->request->post['page'])) {
            $page = $this->request->post['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['limit'])) {
            $limit = (int) $this->request->post['limit'];
        } else {
            $limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
        }

        if (isset($this->request->cookie['viewed_product'])) {
            $session_token = $this->request->cookie['viewed_product'];
        }else{
            $session_token = false;
        }

    	$data['button_continue'] = $this->language->get('button_continue');

        $data['continue'] = $this->url->link('common/home');

        $data['products'] = array();

        $filter_data = array(
            'start' => ($page - 1) * $limit,
            'limit' => $limit,
        );

        $results = array();

        $results = $this->model_catalog_ochelp_viewed->getViewedProduct($filter_data, $session_token);
        
        $product_total = $this->model_catalog_ochelp_viewed->getTotalViewedProduct($session_token);
        
        foreach ($results as $result) {
        	if ($result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }

                if (!$this->config->get('config_customer_price')) {
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
                    $rating = (int) $result['rating'];
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
                    'minimum'     => ($result['minimum'] > 0) ? $result['minimum'] : 1,
                    'rating'      => $rating,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                    'delete'      => $this->customer->isLogged() ? true : false,
                );
            }
        }
        
        $url = '';

        if (isset($this->request->post['limit'])) {
            $url .= '&limit=' . $this->request->post['limit'];
        }

        $url = '';

        $data['limits'] = array();

        $limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

        sort($limits);

        foreach ($limits as $value) {
            $data['limits'][] = array(
                'text' => $value,
                'value' => $value,
                'href' => $this->url->link('product/ochelp_viewed', $url . '&limit=' . $value),
            );
        }

        $url = '';

        if (isset($this->request->post['limit'])) {
            $url .= '&limit=' . $this->request->post['limit'];
        }

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->url = $this->url->link('product/ochelp_viewed', $url . '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

        // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
        if ($page == 1) {
            $this->document->addLink($this->url->link('product/ochelp_viewed', '', true), 'canonical');
        } elseif ($page == 2) {
            $this->document->addLink($this->url->link('product/ochelp_viewed', '', true), 'prev');
        } else {
            $this->document->addLink($this->url->link('product/ochelp_viewed', 'page=' . ($page - 1), true), 'prev');
        }

        if ($limit && ceil($product_total / $limit) > $page) {
            $this->document->addLink($this->url->link('product/ochelp_viewed', 'page=' . ($page + 1), true), 'next');
        }

        if (isset($this->request->post['page']) && $this->request->post['page'] > ceil($product_total / $limit)) {
            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
        }

        $data['limit'] = $limit;
        
	    $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');

        $this->response->setOutput($this->load->view('product/ochelp_viewed_products', $data));	
    }

    public function delete() {
        $this->load->language('product/ochelp_viewed');

        $this->load->model('catalog/ochelp_viewed');

        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (isset($this->request->post['product_id'])) {
                $this->model_catalog_ochelp_viewed->deleteViewedProduct($this->request->post['product_id']);
            }

            $json['success'] = $this->language->get('text_success');
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}