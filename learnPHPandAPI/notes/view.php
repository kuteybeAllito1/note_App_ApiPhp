<?php 
include "../connect.php";


$userid=securytiRequsetpost("id");

$stmt=$con->prepare("SELECT * FROM  notes WHERE note_users=?");

$stmt->execute(array($userid));

$row = $stmt->fetchAll(PDO::FETCH_ASSOC);

$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success","data"=>$row));
} else{
  echo json_encode(array("status"=>"faild"));
}

?>