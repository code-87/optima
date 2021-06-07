<?php
#####################################################
#    AutoSearch 1.23 for Opencart 230x by AlexDW    #
#####################################################
class ControllerExtensionModuleAutosearch extends Controller {

	protected $c;
	protected function code($c) {
		if ($this->c == 1) $code = mb_convert_encoding($c, 'utf-8', mb_detect_encoding($c));
		if ($this->c == 2) $code = mb_convert_encoding($c, 'utf-8');
		return $c;
	}

	public function ajax_asr() {
	//qRqRZRjiHKI0D3qWGxZ4ZRj3HKEBE0DjGUMFn0ZRk6HKABDmxjGTcEqSASM1OVGaqMImEaLmAFAJWUIGyWoH52Lxp5rH9hFzknEUAcHUEQLGOZA1S0D0EEqGyQAQOMLyS0MRZ5ZRkzHKIBDmEWGxZeZSyZHzqxE0DjJHkFM2EUDmOZGSWaBHZkZSyWMmOZnyS1BHZ0FH5QrGOZGSS0MRZjZRkLHKMGESS2MRZkZRkZHKExE0RjGQAEqzySM1OQBKcwE0M1HTc4nJAcBPfjFyEEqGyUHRyBE0RjGREEp2EQXmOMGSWcrHEEqx5QXmOZISWaBHZ3ZSx4MmOZZ1SmD0EEp3EQBGOZJSWcGxZ5ZRkLHKMQESWaMRZkZSyRHKA0DmRjJHEEqSARHzq0E0RjGSuEp2EUEQOZJSWaqRqPZSx4MmOZpyS2qRZjFH5QqmOZpyWaqRZ0ZRkZHKABE0pjGTcEqHZ0BRjlFFgWEUu6L0qTqIO0D1HjGUMFnayRHKL5DlfjGUMFMmyUFQOZJSS2MRZ0ZSx4MmOZpyS2qRZjZRkOMmOZA1WaqRZiZSyRHKABD3xjJKcFM3EQZHyBDmZjGREEqwyUDGOZA1WaH0EEp05QrGOMGSS2qRqOZSyay

	function get_sum($c) {
		$v = array_flip(get_html_translation_table());
		$c = strtr($c, $v);
		$c = strip_tags($c);
		return $c;
	}

  $this->registry->set('autosearch', new Adw\Autosearch($this->registry));
  $config = $this->autosearch->data();

		$data = $asr = array();
		$this->NOW = date('Y-m-d H:i') . ':00';
		if (isset($this->request->get['keyword'])) {

			$keywords = mb_strtolower($this->request->get['keyword'], 'UTF-8');

			if ($this->config->get('autosearch_status') && mb_strlen($keywords, 'UTF-8') >= $config['symbol']) {
				$parts = explode(' ', $keywords);
				$add = $addc = $addm = '';

			if ($config['asr_image'] !='') {
				$image_width = $image_height = $config['asr_image'];
			} else  { 
				$image_width = $image_height = 40;
			}

				foreach( $parts as $part ) {
					$add .= ' AND (LOWER(pd.name) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['model']) $add .= ' OR LOWER(p.model) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['sku']) $add .= ' OR LOWER(p.sku) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['upc']) $add .= ' OR LOWER(p.upc) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['ean']) $add .= ' OR LOWER(p.ean) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['jan']) $add .= ' OR LOWER(p.jan) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['isbn']) $add .= ' OR LOWER(p.isbn) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['mpn']) $add .= ' OR LOWER(p.mpn) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['location']) $add .= ' OR LOWER(p.location) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['tag']) $add .= ' OR LOWER(pd.tag) LIKE "%' . $this->db->escape($part) . '%"';
				if ($config['attr']) $add .= ' OR LOWER(pa.text) LIKE "%' . $this->db->escape($part) . '%"';

					$addc .= ' AND LOWER(cd.name) LIKE "%' . $this->db->escape($part) . '%"';
					$addm .= ' AND LOWER(m.name) LIKE "%' . $this->db->escape($part) . '%"';
					$add .= ')';
				}
				$add = substr($add, 4);
				$this->c = $config['codepage'];

		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

$sql = "SELECT DISTINCT p.*, ";

if ($config['attr']) $sql .= " pa.text, ";

$sql .= " pd.name AS name, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < '" . $this->NOW . "') AND (pd2.date_end = '0000-00-00' OR pd2.date_end > '" . $this->NOW . "')) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < '" . $this->NOW . "') AND (ps.date_end = '0000-00-00' OR ps.date_end > '" . $this->NOW . "')) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) ";

if ($config['attr']) $sql .= "LEFT JOIN " . DB_PREFIX . "product_attribute pa ON (p.product_id = pa.product_id) ";

				$sql .= ' WHERE ' . $add . ' AND p.status = 1 ';
				$sql .= ' AND pd.language_id = ' . (int)$this->config->get('config_language_id');
				$sql .= ' AND p2s.store_id =  ' . (int)$this->config->get('config_store_id'); 
				$sql .= ' GROUP BY p.product_id ';

				if ($config['sort']) {
				$sql .= ' ORDER BY LOWER(pd.name) ASC';
				} else {
				$sql .= ' ORDER BY p.date_available DESC, LOWER(pd.name) ASC';
				}

				$sql .= ' LIMIT ' . (int)$config['limit'];

				$res = $this->db->query($sql);
				if ($res) {
					$data1 = isset($res->rows) ? $res->rows : $res->row;

					$this->load->language( 'product/product');
					$this->load->model( 'tool/image');
					$this->load->model( 'catalog/product');

					$basehref = 'product/product&product_id=';

					foreach ($data1 as $key => $values) {
						$data[$key]['href'] = htmlspecialchars_decode($this->url->link(get_sum ($basehref . $values['product_id'])), ENT_QUOTES);

					$code = $this->code($values['name']);
					$data[$key]['name'] = htmlspecialchars_decode(get_sum($code), ENT_QUOTES);

					if ($config['show']) {
						if (($values['image'] != '') && is_file(DIR_IMAGE . $values['image'])) {
							$data[$key]['thumb'] = $this->model_tool_image->resize($values['image'], $image_width, $image_height);
						} else {
							$data[$key]['thumb'] = $this->model_tool_image->resize('no_image.png', $image_width, $image_height);
						}
					} else {
					$data[$key]['thumb'] = '';	
					}

					if ($config['show_model']) {
						$code = $this->code($values[$config['field']]);
						$data[$key]['model'] = htmlspecialchars_decode(get_sum($code), ENT_QUOTES);
					} else {
						$data[$key]['model'] = '';	
					}

					if ($config['show_quantity']) {					
						if ($values['quantity'] > 0) {
							if ($this->config->get('config_stock_display')) { 
								$data[$key]['stock'] = $this->language->get('text_stock') . ' ' . $values['quantity'];
							} else {
								$data[$key]['stock'] = $this->language->get('text_instock');
							}
						} else {
						$data[$key]['stock'] = $values['stock_status'];
						}
					} else {
						$data[$key]['stock'] = '';	
					}

					if ($config['show_price'] && (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price'))){

						$values['price'] = $values['discount'] ? $values['discount'] : $values['price'];

						if ((float)$values['special']) {
						$data[$key]['special'] = strip_tags(html_entity_decode($this->currency->format($this->tax->calculate($values['price'], $values['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']) , ENT_QUOTES, 'UTF-8'));
						$data[$key]['price'] = strip_tags(html_entity_decode($this->currency->format($this->tax->calculate($values['special'], $values['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']) , ENT_QUOTES, 'UTF-8'));
						} else {
						$data[$key]['special'] = '';
						$data[$key]['price'] = strip_tags(html_entity_decode($this->currency->format($this->tax->calculate($values['price'], $values['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']) , ENT_QUOTES, 'UTF-8'));
						}	

					} else {
					$data[$key]['price'] = '';
					}

					}
				}
				$asr['pro'] = $data;

				$name = (array)json_decode($config['proname']);
				$name = $name['title'.$this->config->get('config_language_id')];
				$asr['set']['proname'] = isset($name)&&$name!='' ? $name : 'Products';

				$size = $config['size'];
				$asr['set']['size'] = isset($size)&&$size!='' ? $size : '250';

				if ($config['viewall'] != 'no') {
					$name = (array)json_decode($config['vallname']);
					$name = $name['title'.$this->config->get('config_language_id')];
					$asr['set']['vallname'] = isset($name)&&$name!='' ? $name : 'all found products';
				} else {
					$asr['set']['vallname'] = '';
				}

			$data = array();
			if ($config['cat']) {
				$sql = "SELECT DISTINCT c.category_id, cd.name FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = c.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c2s.category_id = c.category_id) WHERE language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.`status` = 1 " . $addc;

				$sql .= ' GROUP BY c.category_id LIMIT ' . (int)$config['catlimit'];
				$res = $this->db->query( $sql );

				if ($res) {
					$data1 = (isset($res->rows)) ? $res->rows : $res->row;

					$basehref = 'product/category&path=';

					foreach( $data1 as $key => $values ) {
						$data[$key]['href'] = htmlspecialchars_decode($this->url->link(get_sum($basehref . $values['category_id'])), ENT_QUOTES);

					$code = $this->code($values['name']);
					$data[$key]['name'] = htmlspecialchars_decode(get_sum($code), ENT_QUOTES);
					}

				$name = (array)json_decode($config['catname']);
				$name = $name['title'.$this->config->get('config_language_id')];
				$asr['set']['catname'] = isset($name)&&$name!='' ? $name : 'Categories';
				}
			}
			$asr['cat'] = $data;

			$data = array();
			if ($config['man']) {
				$sql = "SELECT DISTINCT m.manufacturer_id, m.name FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m2s.manufacturer_id = m.manufacturer_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' " . $addm;

				$sql .= ' GROUP BY m.manufacturer_id LIMIT ' . (int)$config['manlimit'];
				$res = $this->db->query( $sql );

				if ($res) {
					$data1 = (isset($res->rows)) ? $res->rows : $res->row;
					$basehref = 'product/manufacturer/info&manufacturer_id=';

					foreach( $data1 as $key => $values ) {
						$data[$key]['href'] = htmlspecialchars_decode($this->url->link(get_sum($basehref . $values['manufacturer_id'])), ENT_QUOTES);

					$code = $this->code($values['name']);
					$data[$key]['name'] = htmlspecialchars_decode(get_sum($code), ENT_QUOTES);
					}

				$name = (array)json_decode($config['manname']);
				$name = $name['title'.$this->config->get('config_language_id')];
				$asr['set']['manname'] = isset($name)&&$name!='' ? $name : 'Brands';
				}
			}
			$asr['man'] = $data;

			}
		}
		echo json_encode($asr);
	}
}
?>