<?php 
include "../connect.php";


$email=securytiRequsetpost("email");
$pass=securytiRequsetpost("password");

$stmt=$con->prepare("SELECT * FROM users WHERE email=? AND password=?");

$stmt->execute(array($email,$pass));

$row = $stmt->fetch(PDO::FETCH_ASSOC);
if ($row["email"] == $email && $row["password"] == $pass) {
    echo json_encode(array("status" => "success","data"=>$row));
} else{
  echo json_encode(array("status"=>"faild"));
}






?>