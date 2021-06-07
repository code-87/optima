<?php
class ModelExtensionModuleOchelpViewed extends Model {
	
	public function getTotalProductsHistory(){
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_viewed");

		return $query->row['total'];
	}

	public function getUrlAlias($route) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = '" . $this->db->escape($route) . "'");
			if($query->rows){
				return $query->row['keyword'];
			}else{
				return false;
			}
	}

	public function setUrlAlias($route, $keyword) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = '" . $this->db->escape($route) . "'");
		$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET `query` = '" . $this->db->escape($route) . "', `keyword` = '" . $this->db->escape($keyword) . "'");
	}
	
	public function deleteUrlAlias($route) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = '" . $this->db->escape($route) . "'");
	}
}