<?php

include "../connect.php";

$userid = securytiRequsetpost("userid");
$notetitle = securytiRequsetpost("notetitle");
$notecontent = securytiRequsetpost("notecontent");

$image = uploadimage("image");
   

if ($image != "fail") {

  $stmt = $con->prepare("INSERT INTO notes(note_title,note_content,note_users,note_image) VALUES (?,?,?,?) ");

  $stmt->execute(array($notetitle, $notecontent, $userid,$image));

  $count = $stmt->rowCount();

  if ($count > 0) {
    echo json_encode(array("status" => "success"));
  } else {
    echo json_encode(array("status" => "faild"));
  }
}
else {
  echo json_encode(array("status" => "faild"));
}


?>