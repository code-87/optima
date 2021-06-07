<?php

class ControllerExtensionModuleTyresFilter extends Controller {
protected $registry;
protected $data = array();
public function __construct($registry) {
    parent::__construct($registry);	
	$this->load->model('catalog/tyresfilter');
	
}	
			
public function index($settings = array()) {	
$data['auto_brands'] = array();
$auto_brands = $this->model_catalog_tyresfilter->getAutoBrand ();
foreach ($auto_brands as $auto_brand) {
$name = $auto_brand['vendor'];
$data['auto_brands'][] = $name;
}

//SIZE TYRES
$data['tyre_widths']  = array();
$data['tyre_heights']  = array();
$data['tyre_diametrs']  = array();
$data['tyre_seasons']  = array();
$data['tyre_types']  = array();
$data['tyre_brands']  = array();

$shiny_widths = $this->model_catalog_tyresfilter->getWidthSize();
foreach ($shiny_widths as $shiny_width) {
$data['tyre_widths'][] = $shiny_width['width'];
}
	
$shiny_profiles = $this->model_catalog_tyresfilter->getProfileSize();
foreach ($shiny_profiles as $shiny_profile) {
$data['tyre_heights'][] = $shiny_profile['profile'];
}	

$shiny_diameters = $this->model_catalog_tyresfilter->getDiameterSize();
foreach ($shiny_diameters as $shiny_diameter) {
$data['tyre_diametrs'][] = $shiny_diameter['diameter'];
}	
$shiny_seasons = $this->model_catalog_tyresfilter->getSeasonSize();
foreach ($shiny_seasons as $shiny_season) {
$data['tyre_seasons'][] = $shiny_season['season'];
}	
$shiny_types = $this->model_catalog_tyresfilter->getTypeSize();
foreach ($shiny_types as $shiny_type) {
$data['tyre_types'][] = $shiny_type['type'];
}	
$shiny_brands = $this->model_catalog_tyresfilter->getBrandSize();
foreach ($shiny_brands as $shiny_brand) {
$data['tyre_brands'][].='<option value="'.$shiny_brand['brand_id'].'">'.$shiny_brand['brand'].'</option>';
}	

//SIZE DISK
$data['disk_diametrs']  = array();
$data['$disc_widths']  = array();
$data['$disc_dias']  = array();
$data['$disc_ets']  = array();
$data['$disc_pcds']  = array();

$diski_diameters = $this->model_catalog_tyresfilter->getDiameterDiskSize();
foreach ($diski_diameters as $diski_diameter) {
$data['disk_diametrs'][] = $diski_diameter['diameter'];
}

$diski_widths = $this->model_catalog_tyresfilter->getWidthDiskSize();
foreach ($diski_widths as $diski_width) {
$data['disc_widths'] [] = $diski_width['width'];
}

$diski_dias = $this->model_catalog_tyresfilter->getDiaDiskSize();
foreach ($diski_dias as $diski_dia) {
$data['disc_dias'][] = $diski_dia['dia'];
}

$diski_ets = $this->model_catalog_tyresfilter->getEtDiskSize();
foreach ($diski_ets as $diski_et) {
$data['disc_ets'][] = $diski_et['et'];
}

$diski_pcds = $this->model_catalog_tyresfilter->getPcdDiskSize();
foreach ($diski_pcds as $diski_pcd) {
$data['disc_pcds'][] = $diski_pcd['pcd'];	
}
//
$data['acc_capacitys'] = array();
$data['acc_brands'] = array();
$data['acc_starts'] = array();
//$data['acc_types'] = array();
$data['acc_polaritys'] = array();
$data['acc_params'] = array();

$acc_capacitys = $this->model_catalog_tyresfilter->getCapacitySize();
foreach ($acc_capacitys as $acc_capacity) {
$data['acc_capacitys'][] = $acc_capacity['capacity'];	
}

$acc_brands = $this->model_catalog_tyresfilter->getAccBrand();
foreach ($acc_brands as $acc_brand){
$data['acc_brands'][].='<option value="'.$acc_brand['brand_id'].'">'.$acc_brand['brand'].'</option>';
}

$acc_starts = $this->model_catalog_tyresfilter->getAccStart();
foreach ($acc_starts as $acc_start) {
$data['acc_starts'][] = $acc_start['start_current'];	
}
//$acc_types = $this->model_catalog_tyresfilter->getAccType();
//foreach ($acc_types as $acc_type) {
//$data['acc_types'][] = $acc_type['type'];	
//}
$acc_polaritys = $this->model_catalog_tyresfilter->getAccPolar();
foreach ($acc_polaritys as $acc_polarity) {
$data['acc_polaritys'][] = $acc_polarity['polarity'];	
}
$acc_params = $this->model_catalog_tyresfilter->getAccParams();
foreach ($acc_params as $acc_param) {
$data['acc_params'][] = $acc_param['params'];	
}

return $this->load->view('extension/module/tyresfilter', $data);
}

//SHINY
public function getShiny(){
//SIZE TYRES
$shinys= array();
 if (isset($this->request->get['shiny'])) {
$shiny = $this->request->get['shiny'];
$shiny_filters = $this->model_catalog_tyresfilter->getShinyFilter($shiny);
foreach ($shiny_filters as $shiny_filter) {
$shinys['width'][] = $shiny_filter['width'];
$shinys['profile'][] = $shiny_filter['profile'];
$shinys['diameter'][] = $shiny_filter['diameter'];
$shinys['season'][] = $shiny_filter['season'];
$shinys['brand'][] = $shiny_filter['brand'];
$shinys['brand_id'][] = $shiny_filter['brand_id'];
$shinys['type'][] = $shiny_filter['type'];
}
}
echo json_encode($shinys);
}

//Diski
public function getDiski(){
//SIZE TYRES
$diskis= array();
 if (isset($this->request->get['diski'])) {
$diski = $this->request->get['diski'];
$diski_filters = $this->model_catalog_tyresfilter->getDiskiFilter($diski);
foreach ($diski_filters as $diski_filter) {
$diskis['diameter'][] = $diski_filter['diameter'];
$diskis['width'][] = $diski_filter['width'];
$diskis['dia'][] = $diski_filter['dia'];
$diskis['et'][] = $diski_filter['et'];
$diskis['pcd'][] = $diski_filter['pcd'];
} }
echo json_encode($diskis);
}

//ACC
public function getAccum(){
$accs= array();
 if (isset($this->request->get['acc'])) {
$acc = $this->request->get['acc'];
$acc_filters = $this->model_catalog_tyresfilter->getAccFilter($acc);
foreach ($acc_filters as $acc_filter) {
$accs['capacity'][] = $acc_filter['capacity'];
$accs['brand'][] = $acc_filter['brand'];
$accs['brand_id'][] = $acc_filter['brand_id'];
$accs['start_current'][] = $acc_filter['start_current'];
$accs['type'][] = $acc_filter['type'];
$accs['polarity'][] = $acc_filter['polarity'];
$accs['params'][] = $acc_filter['params'];
} }
echo json_encode($accs);
}

	//MODEL
public function getModel(){
$models= array();
 if (isset($this->request->get['brand'])) {
$brand = $this->request->get['brand'];
$auto_models = $this->model_catalog_tyresfilter->getAutoModel ($brand);
foreach ($auto_models as $auto_model) {
$name = $auto_model['model_seria'];
$models[] = $name;
}}
echo json_encode($models);
}

//Year
public function getYear(){
$years= array();
 if (isset($this->request->get['brand']) && isset($this->request->get['model'])) {
$brand = $this->request->get['brand'];
$model = $this->request->get['model'];
$auto_years = $this->model_catalog_tyresfilter->getAutoYear ($brand, $model);
foreach ($auto_years as $auto_year) {
$name = $auto_year['year'];
$years[] = $name;
}}
echo json_encode($years);
}

//Modification
public function getMod(){
$mods= array();
 if (isset($this->request->get['brand']) && isset($this->request->get['model']) && isset($this->request->get['year'])) {
$brand = $this->request->get['brand'];
$model = $this->request->get['model'];
$year = $this->request->get['year'];
$auto_mods = $this->model_catalog_tyresfilter->getAutoMod ($brand, $model, $year);
foreach ($auto_mods as $auto_mod) {
$name = $auto_mod['modification'];
$mods[] = $name;
}}
echo json_encode($mods);
}


public function getFiltered(){
$filtered["tyre"]= array();
$filtered["disk"]= array();
 if (isset($this->request->get['brand']) && isset($this->request->get['model']) && isset($this->request->get['year']) && isset($this->request->get['mod'])) {
$brand = $this->request->get['brand'];
$model = $this->request->get['model'];
$year = $this->request->get['year'];
$mod = $this->request->get['mod'];
$auto_filtered = $this->model_catalog_tyresfilter->getAutoMod ($brand, $model, $year, $mod);
foreach ($auto_filtered as $auto_filter) {
$tyre = $auto_filter['tyres_factory'];
$filtered["tyre"] = $tyre;
$disk = $auto_filter['wheels_factory'];
$filtered["disk"] = $disk;
}}
echo json_encode($filtered);
}
}
?>