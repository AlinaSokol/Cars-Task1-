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

$client_name =	$_GET['username'];
$phone = $_GET['phone'];
$model_id = $_GET['models'];
$spare_part_id = $_GET['spare_part'];

try {
	$sql_insert_order = "INSERT INTO Orders VALUES (NUll, ?, ?, ?, ?)";
	$query_order = $pdo->prepare($sql_insert_order);
	$row_order = $query_order->execute([$client_name, $phone, $model_id, $spare_part_id]);
} catch (PDOException $e) {
	echo "Exception: " . $e->getMessage();
}

echo $row_order;

$oid = $pdo->lastInsertId();

$headers = "Content-type:text/html;charset=windows-1251rn"; 
$headers .= "From: {$_SERVER['SERVER_NAME']} <noreply@{$_SERVER['SERVER_NAME']}.com>"; 
$headers .= "Reply-To: noreply@{$_SERVER['SERVER_NAME']}.com";

$to = "example@mail.ru"; 
$subject = "Hello!"; 
$message = "Hello! Your order #{$oid} from site {$_SERVER['SERVER_NAME']} is complete!"; 

mail($to, $subject, $message, $headers);
