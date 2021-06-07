<?php
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {

	include "config.php"; // подключаем конфиг

	/* Осуществляем проверку вводимых данных и их защиту от враждебных скриптов */
	$xd_zvonok_title = trim(strip_tags($_POST["xd_zvonok_title"]));
	$xd_zvonok_name = trim(strip_tags($_POST["xd_zvonok_name"]));
	$xd_zvonok_name_title = trim(strip_tags($_POST["xd_zvonok_name_title"]));
	$xd_zvonok_phone = trim(strip_tags($_POST["xd_zvonok_phone"]));
	$xd_zvonok_phone_title = trim(strip_tags($_POST["xd_zvonok_phone_title"]));
	$xd_zvonok_message = trim(strip_tags($_POST["xd_zvonok_message"]));
	$xd_zvonok_message_title = trim(strip_tags($_POST["xd_zvonok_message_title"]));
	
	/* получаем IP-адрес клиента */
	$xd_zvonok_ip = $_SERVER['REMOTE_ADDR'];
	$xd_zvonok_ip_title = 'IP address';
	
	/* адрес страницы, с которой произошел вызов */
	$xd_zvonok_url = trim(strip_tags($_POST["xd_zvonok_url"]));
	$xd_zvonok_url_title = 'URL';

	/* Создаем новую переменную, присвоив ей значение */
	$message_to_email = "$xd_zvonok_title<br /><br />";
	if ($xd_zvonok_name != '') {
		$message_to_email .= "$xd_zvonok_name_title: $xd_zvonok_name<br />";
	}
	if ($xd_zvonok_phone != '') {
		$message_to_email .= "$xd_zvonok_phone_title: $xd_zvonok_phone<br />";
	}
	if ($xd_zvonok_message != '') {
		$message_to_email .= "$xd_zvonok_message_title: $xd_zvonok_message<br />";
	}

	$message_to_email .= "$xd_zvonok_ip_title: $xd_zvonok_ip<br />";
	$message_to_email .= "$xd_zvonok_url_title: $xd_zvonok_url<br />";
	
	/******************* СОЕДИНЕНИЕ С БАЗОЙ *******************/

	$db_host = constant("DB_HOSTNAME");
	$db_database = constant("DB_DATABASE");
	$db_username = constant("DB_USERNAME");
	$db_password = constant("DB_PASSWORD");
	$db_prefix = constant("DB_PREFIX");
	$db_table = $db_prefix . 'setting';

	# Соединение
	$db_link = mysqli_connect($db_host, $db_username, $db_password, $db_database);
	$set_charset = mysqli_set_charset($db_link, "utf8");
    $result = mysqli_query($db_link, "SELECT * FROM `$db_table` WHERE `code` = 'config'");

    while ($row = mysqli_fetch_assoc($result)) {
		switch ($row['key']) {
			case 'config_name' :
				$shop_name = $row['value'];
				break;
		}
		switch ($row['key']) {
			case 'config_email' :
				$admin_email = $row['value'];
				break;
		}
    }

	$shop_name = mb_convert_encoding($shop_name, 'UTF-8', mb_detect_encoding($shop_name));
	$admin_email = mb_convert_encoding($admin_email, 'UTF-8', mb_detect_encoding($admin_email));

	/* Создаем from email */
	$from_email = $shop_name . ' <xd_zvonok@' . $_SERVER['SERVER_NAME'] . '>';
	/* Создаем заголовок */
	$headers = 'Content-type: text/html; charset=UTF-8' . " \r\n" . 'From:' . $from_email . " \r\n"; //Заголовок для отправки писем без файла
	/**************** отправка почты *********************/
	$subject = "$shop_name: $xd_zvonok_title";
	/* Отправляем сообщение, используя mail() функцию */
	mail($admin_email, '=?utf-8?B?'.base64_encode($subject).'?=', $message_to_email, $headers);

} else {
	die('spam!');
}