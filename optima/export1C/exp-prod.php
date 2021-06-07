<?php
include ('../config-exp.php');
function nl2p($str) {
$arr=explode("\n",$str);
$out='';
for($i=0; $i<count($arr); $i++) {
if(strlen(trim($arr[$i]))>0)
 $out.='<p>'.trim($arr[$i]).'</p>';}
return $out;
}

$data = simplexml_load_file('products.xml');
$status=1;
$language_id = 1;
$customer_group_id=1;

foreach ($data->Brands->B as $row) {
$brandId = strval($row['id']);
$brand = strval($row);

$sql = 'REPLACE  oc_manufacturer(manufacturer_id, name) VALUES(:manufacturer_id, :name)';
$params = ['manufacturer_id'=>$brandId, 'name'=>$brand];
$add = $db -> prepare($sql);
$add->execute($params);

$sql = 'REPLACE  oc_manufacturer_to_store(manufacturer_id) VALUES(:manufacturer_id)';
$params = ['manufacturer_id'=>$brandId];
$add = $db -> prepare($sql);
$add->execute($params);

$sql = 'REPLACE  oc_manufacturer_description(manufacturer_id, name,language_id) VALUES(:manufacturer_id, :name, :language_id)';
$params = ['manufacturer_id'=>$brandId, 'name'=>$brand, 'language_id'=>$language_id];
$add = $db -> prepare($sql);
$add->execute($params);

}


foreach ($data->Products->Product as $row) {
$id = strval($row['id']);
//check if isset id
$sql = 'SELECT * FROM oc_product WHERE product_id = ?';
$statement = $db->prepare($sql);
$statement->execute(array($id));
$count = $statement->fetchAll();
if (empty($count)){
$name = strval($row->name);
//$category = intval($row->category['id']);
$category = strval($row->category);
$brand = strval($row->brand);
//$brandId = intval($row->brand['id']);
//$description = strval($row->description['lang']->ru);
$description = strval($row->description);
$description = nl2p($description);
$photo = strval($row->photo);
$photo = "catalog/products/".$photo;
$price = floatval($row->price);
$quantity = strval($row->stock);
$min_qty = intval($row->min_qty);
$tyre_diameter= strval($row->tyre_diameter);
$tyre_width= strval($row->tyre_width);
$profile= strval($row->profile);
$speed_index= strval($row->speed_index);
$speed= strval($row->speed);
$load_index= strval($row->load_index);
$load= strval($row->load);//
$season= strval($row->season);
$modelAtt= strval($row->model);
$model= strval($row['id']);
$type= strval($row->type);
$axis = strval($row->axis);
$active = strval($row->active);
($active==="true") ? $status = 1 : $status = 0;

//Диски

$disc_width = strval($row->disc_width);
$disc_diameter = strval($row->disc_diameter);
$mount = strval($row->mount);
$dia = strval($row->dia);
$et = strval($row->et);


//АКБ
$battery_capacity = strval($row->battery_capacity);
$start_current = strval($row->start_current);
$polarity = strval($row->polarity);
$battery_length = strval($row->battery_length);
$battery_width = strval($row->battery_width);
$battery_height = strval($row->battery_height);
$battery_params = $battery_length."x".$battery_width."x".$battery_height;
$battery_type = strval($row->battery_type);

$sql = 'SELECT * FROM oc_manufacturer WHERE name = ?';
$statement = $db->prepare($sql);
$statement->execute(array($brand));
$result = $statement->fetch();
$manufacturer_id = $result['manufacturer_id'];

$min_qty = !empty($min_qty) ? "$min_qty" : "NULL";
$manufacturer_id = !empty($manufacturer_id) ? "$manufacturer_id" : "NULL";
$photo = !empty($photo) ? "$photo" : "NULL";
$quantity = !empty($photo) ? "$quantity" : "NULL";
$status = !empty($photo) ? "$status" : "NULL";
$price = !empty($price) ? "$price" : "NULL";
$description = !empty($description) ? "'$description'" : "NULL";
$name = !empty($name) ? "$name" : "NULL";

$date_added = date("Y-m-d H:i:s"); 
$date_available = date("Y-m-d"); 
$sql = 'INSERT INTO  oc_product(product_id, model, image, manufacturer_id, quantity, status, date_added, price, date_modified, date_available, minimum) VALUES(:product_id, :model, :image, :manufacturer_id, :quantity, :status, :date_added, :price, :date_modified, :date_available, :minimum)';
$params = ['product_id'=>$id,'model'=>$model, 'image'=>$photo, 'manufacturer_id'=>$manufacturer_id,  'quantity'=>$quantity, 'status'=>$status,  'date_added'=>$date_added, 'price'=>$price, 'date_modified'=>$date_added, 'date_available'=>$date_available, 'minimum'=>$min_qty];
$add = $db -> prepare($sql);
$add->execute($params);

$sql = 'INSERT INTO  oc_product_description(product_id, name, description, language_id) VALUES(:product_id, :name, :description, :language_id)';
$params = ['product_id'=>$id, 'name'=>$name, 'description'=>$description, 'language_id'=>$language_id];
$add = $db -> prepare($sql);
$add->execute($params);

$sql = 'INSERT INTO  oc_product_to_store(product_id) VALUES(:product_id)';
$params = ['product_id'=>$id];
$add = $db -> prepare($sql);
$add->execute($params);

$sql = 'INSERT INTO  oc_product_to_layout(product_id) VALUES(:product_id)';
$params = ['product_id'=>$id];
$add = $db -> prepare($sql);
$add->execute($params);

//
$sql = 'SELECT * FROM oc_category_description WHERE name = ?';
$statement = $db->prepare($sql);
$statement->execute(array($category));
$result = $statement->fetch();
$category_id = $result['category_id'];

$sql = 'INSERT INTO  oc_product_to_category(product_id, category_id) VALUES(:product_id, :category_id)';
$params = ['product_id'=>$id, 'category_id' =>$category_id];
$add = $db -> prepare($sql);
$add->execute($params);


if ( $category == "Шины"){
	
$sql = 'INSERT INTO  oc_shiny(id, width, profile, diameter, season, brand, brand_id, type) VALUES(:id,  :width, :profile, :diameter, :season, :brand, :brand_id, :type)';	
$params = ['id'=>$id, 'width' =>$tyre_width, 'profile'=>$profile, 'diameter'=>$tyre_diameter, 'season'=>$season, 'brand'=>$brand, 'brand_id'=>$manufacturer_id, 'type'=>$type];
$add = $db -> prepare($sql);
$add->execute($params);
	
$tyre_diameter1 =19;
$tyre_width1 = 20;
$profile1 =21;
$speed_index1= 22;
$speed1 = 23;
$load_index1= 24;
$season1 =25;
$type1=26;
$brand1=27;
$load1 = 32;//
$axis1 =45 ;//
$modelAtt1 = 42;
	//шины
if(!empty($tyre_diameter)){
$sql = 'INSERT INTO  oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$tyre_diameter1, 'language_id'=>$language_id, 'text'=>$tyre_diameter];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($tyre_width)){
$sql = 'INSERT INTO  oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$tyre_width1, 'language_id'=>$language_id, 'text'=>$tyre_width];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($profile)){
$sql = 'INSERT INTO  oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$profile1, 'language_id'=>$language_id, 'text'=>$profile];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($speed_index)){
$sql = 'INSERT INTO  oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$speed_index1, 'language_id'=>$language_id, 'text'=>$speed_index];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($speed)){
$sql = 'INSERT INTO  oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$speed1, 'language_id'=>$language_id, 'text'=>$speed];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($load_index)){
$sql = 'INSERT INTO  oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$load_index1, 'language_id'=>$language_id, 'text'=>$load_index];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($season)){
$sql = 'INSERT INTO  oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$season1, 'language_id'=>$language_id, 'text'=>$season];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($type)){
$sql = 'INSERT INTO  oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$type1, 'language_id'=>$language_id, 'text'=>$type];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($brand)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$brand1, 'language_id'=>$language_id, 'text'=>$brand];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($modelAtt)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$modelAtt11, 'language_id'=>$language_id, 'text'=>$modelAtt];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($load)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$load1, 'language_id'=>$language_id, 'text'=>$load];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($axis)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$axis1, 'language_id'=>$language_id, 'text'=>$axis];
$add = $db -> prepare($sql);
$add->execute($params);
}


} 
if ($category == "Диски"){
	
$sql = 'INSERT INTO oc_diski(id, diameter, width, dia, et, pcd) VALUES(:id, :diameter, :width, :dia, :et, :pcd)';	
$params = ['id'=>$id,  'diameter'=>$disc_diameter, 'width' =>$disc_width, 'dia'=>$dia, 'et'=>$et, 'pcd'=>$mount];
$add = $db -> prepare($sql);
$add->execute($params);

//диски
$disc_width1 =14;
$disc_diameter1 = 12;
$mount1 = 15;
$dia1 = 18;
$et1 = 16;
$brand1 = 17;
$modelAtt1 = 43;
if(!empty($disc_width)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$disc_width1, 'language_id'=>$language_id, 'text'=>$disc_width];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($disc_diameter)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$disc_diameter1, 'language_id'=>$language_id, 'text'=>$disc_diameter];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($mount)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$mount1, 'language_id'=>$language_id, 'text'=>$mount];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($dia)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$dia1, 'language_id'=>$language_id, 'text'=>$dia];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($et)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$et1, 'language_id'=>$language_id, 'text'=>$et];
$add = $db -> prepare($sql);
$add->execute($params);	
}	
if(!empty($brand)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$brand1, 'language_id'=>$language_id, 'text'=>$brand];
$add = $db -> prepare($sql);
$add->execute($params);	
}
if(!empty($modelAtt)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$modelAtt11, 'language_id'=>$language_id, 'text'=>$modelAtt];
$add = $db -> prepare($sql);
$add->execute($params);
}
} 
if($category == "Аккумуляторы") {
	
$sql = 'INSERT INTO oc_acc(id, capacity, brand, brand_id, start_current, type, polarity, params) VALUES(:id, :capacity, :brand, :brand_id, :start_current, :type, :polarity, :params)';	
$params = ['id'=>$id,  'capacity'=>$battery_capacity, 'brand' =>$brand, 'brand_id'=>$manufacturer_id, 'start_current'=>$start_current, 'type'=>$battery_type, 'polarity'=>$polarity, 'params'=>$battery_params];
$add = $db -> prepare($sql);
$add->execute($params);

$battery_capacity1= 33;
$start_current1 =34;
$battery_type1 =35;
$polarity1 = 36;
$battery_length1 = 38;
$battery_width1 =39;
$battery_height1 = 40;
$brand1 = 41;
$modelAtt1 = 44;


if ($polarity=="0"){
	$polarity=="00";
	$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$polarity1, 'language_id'=>$language_id, 'text'=>$polarity];
$add = $db -> prepare($sql);
$add->execute($params);

}

if(!empty($battery_capacity)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$battery_capacity1, 'language_id'=>$language_id, 'text'=>$battery_capacity];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($start_current)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$start_current1, 'language_id'=>$language_id, 'text'=>$start_current];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($battery_type)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$battery_type1, 'language_id'=>$language_id, 'text'=>$battery_type];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($polarity)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$polarity1, 'language_id'=>$language_id, 'text'=>$polarity];
$add = $db -> prepare($sql);
$add->execute($params);
}
if(!empty($battery_length)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$battery_length1, 'language_id'=>$language_id, 'text'=>$battery_length];
$add = $db -> prepare($sql);
$add->execute($params);	
}	
if(!empty($battery_width)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$battery_width1, 'language_id'=>$language_id, 'text'=>$battery_width];
$add = $db -> prepare($sql);
$add->execute($params);	
}
if(!empty($battery_height)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$battery_height1, 'language_id'=>$language_id, 'text'=>$battery_height];
$add = $db -> prepare($sql);
$add->execute($params);	
}
if(!empty($brand)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$brand1, 'language_id'=>$language_id, 'text'=>$brand];
$add = $db -> prepare($sql);
$add->execute($params);	
}
if(!empty($modelAtt)){
$sql = 'INSERT INTO oc_product_attribute(product_id, attribute_id, language_id, text) VALUES(:product_id,  :attribute_id, :language_id, :text)';
$params = ['product_id'=>$id, 'attribute_id' =>$modelAtt1, 'language_id'=>$language_id, 'text'=>$modelAtt];
$add = $db -> prepare($sql);
$add->execute($params);
}

}
	
} 
}
?>