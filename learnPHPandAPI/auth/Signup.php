<?php

include "../connect.php";

$username=securytiRequsetpost("username");
$email=securytiRequsetpost("email");
$pass=securytiRequsetpost("password");



$stmt=$con->prepare("INSERT INTO users(username,email,password) VALUES (?,?,?) ");

$stmt->execute(array($username,$email,$pass));

$count = $stmt->rowCount();

if($count >0){
echo json_encode(array("status"=>"success"));
}else{
  echo json_encode(array("status"=>"faild"));
}


?>