import 'package:flutter/material.dart';
import 'package:noteappapiphp/app/Home.dart';
import 'package:noteappapiphp/app/auth/Login.dart';
import 'package:noteappapiphp/app/auth/Signup.dart';
import 'package:noteappapiphp/app/notes/add.dart';
import 'package:noteappapiphp/app/notes/update.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences prefs;
void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),

        
      ),
      title: 'Note app with PHP API',
      initialRoute: prefs.getString("id") == null? '/':"home",
      routes: {
        '/' :(context)=>  Login(),
        'signup' :(context)=>  Signup(),
        'home' :(context)=>  Home(),
        'Addnote' :(context)=>  AddNote(),
        'updatenote' :(context)=>  UpdateNote(),
      },
    );
  }
}