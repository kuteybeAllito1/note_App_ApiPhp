<?php


$dsn = "mysql:host=localhost;port=3308;dbname=noteapp";
$username = "root";
$pass = "";
$opthion = array(
  PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES UTF8', #FOR ARABIC
);

try {
  $con = new PDO($dsn, $username, $pass, $opthion);
  $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  include "foncshons.php";





  header("Access-Control-Allow-Origin: *");
  header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
  header("Access-Control-Allow-Methods: POST, OPTIONS , GET");
  checkAuthenticate();
  // echo "connected";
} catch (PDOException $e) {
  echo "failed to connect" . $e->getMessage();
}
?>