<?php
class ModelCatalogTyresFilter extends Model {

//загрузка размеров шин
public function getWidthSize() {  
$sql ="SELECT DISTINCT width FROM oc_shiny ORDER BY width ASC";
$query = $this->db->query($sql);
$shiny_width = $query->rows;
return $shiny_width; 
}
public function getProfileSize() {  
$sql ="SELECT DISTINCT profile FROM oc_shiny ORDER BY profile ASC";
$query = $this->db->query($sql);
$shiny_profile = $query->rows;
return $shiny_profile; 
}
public function getDiameterSize() {  
$sql ="SELECT DISTINCT diameter FROM oc_shiny ORDER BY diameter ASC";
$query = $this->db->query($sql);
$shiny_diameter = $query->rows;
return $shiny_diameter; 
}
public function getSeasonSize() {  
$sql ="SELECT DISTINCT season FROM oc_shiny ORDER BY profile ASC";
$query = $this->db->query($sql);
$shiny_season = $query->rows;
return $shiny_season; 
}
public function getBrandSize() {  
$sql ="SELECT DISTINCT brand, brand_id FROM oc_shiny WHERE brand_id!=0 ORDER BY brand ASC";
$query = $this->db->query($sql);
$shiny_brand = $query->rows;
return $shiny_brand; 
}
public function getTypeSize() {  
$sql ="SELECT DISTINCT type FROM oc_shiny ORDER BY type ASC";
$query = $this->db->query($sql);
$shiny_type = $query->rows;
return $shiny_type; 
}



//загрузка размеров дисков
public function getDiameterDiskSize() {  
$sql ="SELECT DISTINCT diameter FROM oc_diski ORDER BY diameter ASC";
$query = $this->db->query($sql);
$diski_diameter = $query->rows;
return $diski_diameter; 
}
public function getWidthDiskSize() {  
$sql ="SELECT DISTINCT width FROM oc_diski ORDER BY width ASC";
$query = $this->db->query($sql);
$diski_width = $query->rows;
return $diski_width; 
}
public function getDiaDiskSize() {  
$sql ="SELECT DISTINCT dia FROM oc_diski ORDER BY dia ASC";
$query = $this->db->query($sql);
$diski_dia = $query->rows;
return $diski_dia; 
}
public function getEtDiskSize() {  
$sql ="SELECT DISTINCT et FROM oc_diski ORDER BY et ASC";
$query = $this->db->query($sql);
$diski_et = $query->rows;
return $diski_et; 
}
public function getPcdDiskSize() {  
$sql ="SELECT DISTINCT pcd FROM oc_diski ORDER BY pcd ASC";
$query = $this->db->query($sql);
$diski_pcd = $query->rows;
return $diski_pcd; 
}
//
public function getAccStart() {  
$sql ="SELECT DISTINCT start_current FROM oc_acc ORDER BY start_current ASC";
$query = $this->db->query($sql);
$acc_start = $query->rows;
return $acc_start; 
}
public function getCapacitySize() {  
$sql ="SELECT DISTINCT capacity FROM oc_acc ORDER BY capacity ASC";
$query = $this->db->query($sql);
$acc_cap = $query->rows;
return $acc_cap; 
}
public function getAccBrand() {  
$sql ="SELECT DISTINCT brand, brand_id FROM oc_acc WHERE brand_id!=0 ORDER BY brand ASC";
$query = $this->db->query($sql);
$acc_brand = $query->rows;
return $acc_brand; 
}

//public function getAccType() {  
//$sql ="SELECT DISTINCT type FROM oc_acc ORDER BY type ASC";
//$query = $this->db->query($sql);
//$acc_type = $query->rows;
//return $acc_type; 
//}
public function getAccPolar() {  
$sql ="SELECT DISTINCT polarity FROM oc_acc ORDER BY polarity ASC";
$query = $this->db->query($sql);
$acc_polarity = $query->rows;
return $acc_polarity; 
}
public function getAccParams() {  
$sql ="SELECT DISTINCT params FROM oc_acc ORDER BY params ASC";
$query = $this->db->query($sql);
$acc_params = $query->rows;
return $acc_params; 
}

//загрузка фильтра шин 
public function getShinyFilter($shiny) {  
$sql ="SELECT DISTINCT * FROM oc_shiny WHERE ".$shiny." ORDER BY brand ASC";
$query = $this->db->query($sql);
$shiny_filter= $query->rows;
return $shiny_filter; 
}
//загрузка фильтра дисков 
public function getDiskiFilter($diski) {  
$sql ="SELECT DISTINCT * FROM oc_diski WHERE ".$diski." ";
$query = $this->db->query($sql);
$diski_filter= $query->rows;
return $diski_filter; 
}
//загрузка фильтра акб 
public function getAccFilter($acc) {  
$sql ="SELECT DISTINCT * FROM oc_acc WHERE ".$acc." ORDER BY brand ASC";
$query = $this->db->query($sql);
$acc_filter= $query->rows;
return $acc_filter; 
}

 //загрузка брендов авто 
public function getAutoBrand () {  
$sql ="SELECT DISTINCT vendor FROM search_by_vehicle ORDER BY vendor ASC";
$query = $this->db->query($sql);
$auto_brand = $query->rows;
return $auto_brand; 

}

//загрузка моделей авто
public function getAutoModel ($brand) {  
$sql ="SELECT DISTINCT model_seria FROM search_by_vehicle WHERE vendor = '" .$brand. "'  ORDER BY model_seria ASC";
$query = $this->db->query($sql);
$auto_model = $query->rows;
return $auto_model; 
}
//загрузка года авто
public function getAutoYear ($brand, $model) {  
$sql ="SELECT DISTINCT year FROM search_by_vehicle WHERE vendor = '" .$brand. "' AND model_seria =  '" .$model. "'  ORDER BY year ASC";
$query = $this->db->query($sql);
$auto_year = $query->rows;
return $auto_year; 
}

//загрузка модификации авто
public function getAutoMod ($brand, $model, $year) {  
$sql ="SELECT * FROM search_by_vehicle WHERE vendor = '" .$brand. "' AND model_seria =  '" .$model. "' AND year =  '" .$year. "' ORDER BY modification ASC";
$query = $this->db->query($sql);
$auto_mod = $query->rows;
return $auto_mod; 
}
//загрузка выбранного авто
public function getAutoFiltered ($brand, $model, $year, $mod) {  
$sql ="SELECT * FROM search_by_vehicle WHERE vendor = '" .$brand. "' AND model_seria =  '" .$model. "' AND year =  '" .$year. "' AND modification  =  '" .$mod. "' ";
$query = $this->db->query($sql);
$auto_filter = $query->rows;
return $auto_filter; 
}
}
?>