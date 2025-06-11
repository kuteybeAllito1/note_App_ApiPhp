<?php
define('MB', 1048576);
function securytiRequsetpost($request)
{

  return htmlspecialchars(strip_tags($_POST["$request"]));

}

function securytiRequsetget($request)
{

  return htmlspecialchars(strip_tags($_GET["$request"]));

}

function uploadimage($requestName)
{
  global $error;
  $imagename = rand(1000, 10000) . $_FILES["$requestName"]["name"];
  $imagetmp = $_FILES["$requestName"]["tmp_name"];
  $imagesize = $_FILES["$requestName"]["size"];
  $allowed = array("png", "jpg", "gif", "pdf", "jpeg");
  $arr = explode('.', $imagename);
  $ext = end($arr);
  $ext = strtolower($ext);
  if (!empty($imagename) && !in_array($ext, $allowed)) {
    $error[] = "this file not allowed";
  }
  if ($imagesize > 2 * MB) {
    $error = "this file is too large";
  }

  if (empty($error)) {

    move_uploaded_file($imagetmp, "../upload/" . $imagename);
    return $imagename;
  } else {
    return "fail";
  }
}

function deletefile($dir, $imagename)
{

  if (file_exists($dir . "/" . $imagename)) {

    unlink($dir . "/" . $imagename);
  }
}




function checkAuthenticate(){
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {

        if ($_SERVER['PHP_AUTH_USER'] != "kuteybe" ||  $_SERVER['PHP_AUTH_PW'] != "kuteybe12345"){
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }
}

?>