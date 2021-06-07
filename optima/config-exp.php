<?php
ini_set('default_charset', 'utf-8');
mb_internal_encoding("utf-8");
define("HOST", "localhost");
define("DBNAME", "filter_test");
define("DBUSER", "optima_test");
define("DBPASSWORD", "I4b0J0k2");
try {
    $db = new PDO('mysql:host=' . HOST . ';dbname=' . DBNAME, DBUSER, DBPASSWORD,
    array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>