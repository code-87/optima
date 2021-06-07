<?php
include ('../config-exp.php');

header('Content-type: text/xml');
$dom = new DOMDocument('1.0', 'UTF-8');
$dom->formatOutput = true;            
$dom->preserveWhiteSpace = false;
$xmlRoot = $dom->createElement("orders");
$xmlRoot = $dom->appendChild($xmlRoot);



$stmt = $db->prepare('SELECT order_id, date_added, email, telephone, CONCAT(lastname, " ", firstname) as fio, total,   shipping_method,
CONCAT(payment_country, " ", payment_zone, " ", payment_city, " ", payment_address_1) as adress,
comment FROM oc_order order by order_id, date_added');
$stmt->execute();

while($row = $stmt->fetch()){
$xml = $xmlRoot->appendChild($dom->createElement('order')); 
$xml->appendChild($dom->createElement('Номер_заказа', $row['order_id']));
$xml->appendChild($dom->createElement('Дата_заказа', $row['date_added']));
$xml->appendChild($dom->createElement('Email', $row['email']));
$xml->appendChild($dom->createElement('Телефон', $row['telephone']));
$xml->appendChild($dom->createElement('ФИО', $row['fio']));
$xml->appendChild($dom->createElement('Общая_сумма_заказа', $row['total']));

$items = $xml->appendChild($dom->createElement('items')); 

$order_id = $row['order_id'];
$stmtItem = $db->prepare('SELECT  order_id, product_id, quantity, price FROM oc_order_product WHERE order_id = "'. (int)$order_id . '" ');
$stmtItem->execute();
$data =$stmtItem->fetchAll();

foreach ($data as $rowItem) {
  
$xmlItem  = $items->appendChild($dom->createElement('item'));
$xmlItem->appendChild($dom->createElement('ID_товаров', $rowItem['product_id']));
$xmlItem->appendChild($dom->createElement('Количество', $rowItem['quantity']));
$xmlItem->appendChild($dom->createElement('Цена_ед_товара', $rowItem['price']));
}

$xml->appendChild($dom->createElement('Способ_доставки', $row['shipping_method']));
$xml->appendChild($dom->createElement('Адрес_доставки', $row['adress']));
$xml->appendChild($dom->createElement('Комментарии', $row['comment']));
}

echo $dom->saveXML();
$dom->save("orders.xml");
exit();

?>