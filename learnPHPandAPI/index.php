<?php
include "connect.php"; // هذا الملف يحتوي على الاتصال بقاعدة البيانات


// $stmt= $con-> prepare("SELECT * FROM users"); // جلب 5 بيانات من جدول المستخدمين
// $stmt->execute();
// $row=$stmt-> fetch(PDO::FETCH_ASSOC); // جلب البيانات على شكل مصفوفة

// $count = $stmt->rowCount();
// echo $count;

// $jsson= json_encode($row); // تحويل المصفوفة الى جيسون
// print_r($jsson);
// 
//  $stmt= $con->prepare(query: "INSERT INTO users(userName,email) VALUES('KKK','ALLITO123KK@gmail.com'),('K2','ALLITO12@gmail.com')");
//  $stmt= $con->prepare(query: "INSERT INTO users(userName,email) VALUES(?,?)");


//  $stmt-> execute(array('jad','had@gmail.com'));


// $count = $stmt->rowCount();
// echo $count;
// $filename = "image.png";

// $exploer =array("png","jpg","gif");
// $arr= explode('.',$filename);
// $endMetod = end($arr);
// if( in_array($endMetod,$exploer)){
//   echo "yes";
// }else{
//   echo "no";
// }

// uploadimage("image");
?>
