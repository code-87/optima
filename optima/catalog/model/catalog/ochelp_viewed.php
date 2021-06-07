<?php
class ModelCatalogOchelpViewed extends Model {
	public function addViewedProduct($session_token, $product_id, $product_limit) {

		$product_count = $this->getTotalViewedProduct($session_token);

		if($product_count == $product_limit){
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_viewed ORDER BY date_added ASC LIMIT 1");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_viewed WHERE session_token = '" . $this->db->escape($session_token) . "' AND product_id = '" . (int)$product_id . "'");
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "product_viewed SET session_token = '" . $this->db->escape($session_token) . "', customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', date_added = NOW()");
	}

	public function updateViewedProduct($session_token) {
		$this->db->query("UPDATE " . DB_PREFIX . "product_viewed SET customer_id = '" . (int)$this->customer->getId() . "' WHERE session_token = '" . $this->db->escape($session_token) . "'");
		$this->db->query("UPDATE " . DB_PREFIX . "product_viewed SET session_token = '" . $this->db->escape($session_token) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
	}

	public function deleteOldViewedProduct($interval) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_viewed WHERE date_added < DATE_SUB(NOW(), INTERVAL '" . (int)$interval . "' DAY)");
	}

	public function deleteViewedProduct($product_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_viewed WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$product_id . "'");
	}

	public function getViewedProduct($data = array(), $session_token = false) {
		$sql = "SELECT DISTINCT product_id FROM " . DB_PREFIX . "product_viewed";			

		if($this->customer->isLogged()){
			$sql .= " WHERE customer_id = '" . (int)$this->customer->getId() . "'";
		}else{
			$sql .= " WHERE session_token = '" . $this->db->escape($session_token) . "'";
		}

		$sql .= " GROUP BY product_id ORDER BY product_viewed_id DESC";

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$this->load->model('catalog/product');

		$product_data = array();

		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
		}

		return $product_data;
	}

	public function getTotalViewedProduct($session_token = false) {
		if($this->customer->isLogged()){
			$query = $this->db->query("SELECT COUNT(DISTINCT product_id) AS total FROM " . DB_PREFIX . "product_viewed WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		}else{
			$query = $this->db->query("SELECT COUNT(DISTINCT product_id) AS total FROM " . DB_PREFIX . "product_viewed WHERE session_token = '" . $this->db->escape($session_token) . "'");
		}

		return $query->row['total'];
	}
}