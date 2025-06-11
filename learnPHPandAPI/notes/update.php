<?php

include "../connect.php";

$noteid = securytiRequsetpost("noteid");
$notetitle = securytiRequsetpost("notetitle");
$notecontent = securytiRequsetpost("notecontent");
$imagename = securytiRequsetpost("image");



if (isset($_FILES["image"])) {
  deletefile("../upload", $imagename);  // ← فقط إذا نجح الرفع
  $imagename = uploadimage("image");


}


$stmt = $con->prepare("UPDATE notes SET note_title=?,note_content=?,note_image=? WHERE notes_id=?");

$stmt->execute(array($notetitle, $notecontent, $imagename, $noteid));

$count = $stmt->rowCount();

if ($count > 0) {
  echo json_encode(array("status" => "success"));
} else {
  echo json_encode(array("status" => "faild"));
}

?>