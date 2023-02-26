<?php
$address = 'localhost';
$username = 'root';
$password = '';
$database = 'auto';
$charset = 'utf8';

try {
	$pdo = new PDO ("mysql:host=$address;dbname=$database;cahrset=$charset", $username, $password);
	$pdo->setAttribute (PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
	echo "Exception: " . $e->getMessage();
} 

$car_brand_id =	$_GET['car_brands'];
$sql_select_model = "SELECT `id`, `model` FROM `Models` WHERE (`car_brand_id` = :car_brand_id)";
$query_model = $pdo->prepare($sql_select_model);

try {
	$query_model->execute(['car_brand_id' => $car_brand_id]);
	$row_model = $query_model->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
	echo "Exception: " . $e->getMessage();
} 

$result = json_encode($row_model);
echo $result;
