import 'package:noteappapiphp/app/constant/messegs.dart';

validInput(String val,int min,int max){
  if (val.isEmpty){
    return "$isempty";
  }
  
  if (val.length < min){
    return "$isemin  $min";
  }

  
  if (val.length > max){
    return "$isemax  $max";
  }
  
  



}