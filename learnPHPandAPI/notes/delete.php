<?php

include "../connect.php";

$noteid=securytiRequsetpost("id");
$imagename=securytiRequsetpost("imagename");

$stmt=$con->prepare("DELETE FROM notes WHERE notes_id=?");

$stmt->execute(array($noteid));

$count = $stmt->rowCount();

if($count >0){
  deletefile("../upload",$imagename);
echo json_encode(array("status"=>"success"));
}else{
  echo json_encode(array("status"=>"faild"));
}


?>