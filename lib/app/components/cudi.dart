import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';


  String _basicAuth = 'Basic ' +
    base64Encode(utf8.encode(
        'kuteybe:kuteybe12345'));
  
    Map<String, String> myheaders = {
          'authorization': _basicAuth
    };
class Cudi {

  getresponse(String uri) async {
    try {
      var respunse = await http.get(Uri.parse(uri));
      if (respunse.statusCode == 200) {
        var data = jsonDecode(respunse.body);
        return data;
      } else {
        print("error ${respunse.statusCode}");
      }
    } catch (e) {
      print("error cash $e");
    }
  }

  postresponse(String uri, Map data) async {
    try {
      var respunse = await http.post(Uri.parse(uri), body: data, headers: myheaders);
      if (respunse.statusCode == 200) {
        var data = jsonDecode(respunse.body);
        return data;
      } else {
        print("error ${respunse.statusCode}");
      }
    } catch (e) {
      print("error cash $e");
    }
  }

  postrequsetfile(String uri, Map data, File file) async {
    var requsrt = http.MultipartRequest("POST", Uri.parse(uri));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipart = http.MultipartFile("image", stream, length,
        filename: basename(file.path));
    requsrt.headers.addAll(myheaders);
    requsrt.files.add(multipart);
    data.forEach((key, value) {
      requsrt.fields[key] = value;
    });
    var myresponse = await requsrt.send();
    var response = await http.Response.fromStream(myresponse);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }else{
      print("error ${response.statusCode}");
    }
  }
}
