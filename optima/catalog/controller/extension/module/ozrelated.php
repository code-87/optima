<?php
class ControllerExtensionModuleOzRelated extends Controller {
	public function index($setting) {

    $data['products']  = array();
    $data['simple']    = (isset($setting['simple'])?1:NULL);
    $data['title']     = $setting['title'];
    $source            = $setting['source'];
    $sql_tags          = '';
    $sql_keyword       = '';
    
		if (isset($this->request->get['product_id'])) {
  		$product_id = (int)$this->request->get['product_id'];
      $query      = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $product_id . "'"); 
			$category_id = 0;
      if (isset($query->row['main_category'])) {
        foreach ($query->rows as $category) {
          if ($category['main_category']!=0) $category_id = $category['category_id'];
          }
        }
      if ($category_id == 0 && isset($query->row['category_id'])) $category_id = $query->row['category_id'];
  		$this->load->model('catalog/product');
  		$product_info = $this->model_catalog_product->getProduct($product_id);
  		if ($product_info) {
        if ($setting['source']=='tags') {
			    $parts = explode(',', (string)$product_info['tag']);
          if (count($parts)<=1) $sql_tags .= " AND pd.tag  LIKE '%" . $product_info['tag'] . "%'";
          else {
            $sql_tags .= " AND (pd.tag  LIKE '%" . trim($parts[0]) . "%'";
            foreach ($parts as $key=>$tag) {
              if ($key==0) continue;
              $sql_tags .= " OR pd.tag  LIKE '%" . trim($tag) . "%'";
              }
              $sql_tags .= ")";
            }
          }
        if ($setting['source']=='keyword') {
			    $parts = explode(',', (string)$product_info['meta_keyword']);
          if (count($parts)<=1) $sql_keyword .= " AND pd.meta_keyword  LIKE '%" . $product_info['meta_keyword'] . "%'";
          else {
            $sql_keyword .= " AND (pd.meta_keyword  LIKE '%" . trim($parts[0]) . "%'";
            foreach ($parts as $key=>$tag) {
              if ($key==0) continue;
              $sql_keyword .= " OR pd.meta_keyword  LIKE '%" . trim($tag) . "%'";
              }
              $sql_keyword .= ")";
            }
          }
        // Выбор по критериям
        $sql = "SELECT p.product_id,p.manufacturer_id,p.price,p.tax_class_id,p.model,p.image,pd.name,pd.tag";
        $sql .= " FROM   " . DB_PREFIX . "product p LEFT JOIN  " . DB_PREFIX . "product_description pd ON ( p.product_id = pd.product_id ) LEFT JOIN  " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";
        $sql .= " WHERE p.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'"; 
        if (isset($setting['itself']))            $sql .= " AND p.product_id != '" . $product_id . "'"; 
        if (isset($setting['category']))          $sql .= " AND p2c.category_id = '" . $category_id . "'"; 
        if ($setting['source']=='vendor')         $sql .= " AND p.manufacturer_id = '" . $product_info['manufacturer_id'] . "'";
        if ($setting['source']=='model')          $sql .= " AND p.model = '" . $product_info['model'] . "'";
        if ($setting['source']=='tags')           $sql .= $sql_tags;
        if ($setting['source']=='keyword')        $sql .= $sql_keyword;
        $sql2 = $sql;
        if (isset($setting['from_current_id']))        $sql  .= " AND p.product_id > '" . $product_id . "'"; 
        if (isset($setting['from_current_id_fill']))   $sql2 .= " AND p.product_id > '0'"; 


        $sql3 = " GROUP BY p.product_id";
        $sql3 .= " ORDER BY " . $setting['order'];
        if (isset($setting['sort'])) $sql3 .= " ASC ";	
      	else                         $sql3 .= " DESC ";
        
        $sql  .= $sql3 . " LIMIT " . (int)$setting['limit'];
        $sql2 .= $sql3;
        
        $query = $this->db->query($sql);
        $h = $setting['height'];
        $w = $setting['width'];
		    $this->load->model('tool/image'); 
			  foreach ($query->rows as $result) {
          if ($h==0||$w==0) $image = NULL;
          else {
    				if ($result['image']) $image = $this->model_tool_image->resize($result['image'], $w, $h);
    				else     					    $image = $this->model_tool_image->resize('no_image.jpg', $w, $h);
            }
  				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
  				else 	$price = false;
          $data['products'][$result['product_id']]  = array(
            'product_id'  => $result['product_id'],
            'name'        => $result['name'],
  					'price'       => $price,
            'model'       => $result['model'],
            'image'       => $image,
            'self'        => ($result['product_id']==$product_id?true:false),
				    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
            'manufacturer_id' => $result['manufacturer_id']
            );
          }  
        $setting['limit'] -= count($query->rows);
         if ($setting['limit']>0) {
          $sql2 .= " LIMIT " . (int)$setting['limit'];
          $query = $this->db->query($sql2);
  			  foreach ($query->rows as $result) {
            if ($h==0||$w==0) $image = NULL;
            else {
      				if ($result['image']) $image = $this->model_tool_image->resize($result['image'], $w, $h);
      				else     					    $image = $this->model_tool_image->resize('no_image.jpg', $w, $h);
              }
    				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
    				else 	$price = false;
            $data['products'][$result['product_id']]  = array(
              'product_id'  => $result['product_id'],
              'name'        => $result['name'],
    					'price'       => $price,
              'model'       => $result['model'],
              'image'       => $image,
              'self'        => ($result['product_id']==$product_id?true:false),
  				    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
              'manufacturer_id' => $result['manufacturer_id']
              );
            }  
          }       
        // END
        }
		  }

      return $this->load->view('extension/module/ozrelated', $data);
	}
}