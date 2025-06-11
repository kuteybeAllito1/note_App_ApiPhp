// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:noteappapiphp/app/Model/LoginModel.dart';
import 'package:noteappapiphp/app/components/CustomTextForm.dart';
import 'package:noteappapiphp/app/components/cudi.dart';
import 'package:noteappapiphp/app/components/valid.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:noteappapiphp/app/constant/Linkapi.dart';
import 'package:noteappapiphp/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
AuthLogin login = AuthLogin();
  Cudi cudi = Cudi();
  bool isloading = false;

  connectData() async {
    if (formkey.currentState!.validate()) {
      isloading = true;
      setState(() {});
      var data = await cudi.postresponse(linkLogin, {
        "email": email.text,
        "password": password.text,
      });
      login = AuthLogin.fromJson(data['data']);
      isloading = false;
      setState(() {});
      if (data?["status"] == "success") {
        prefs.setString("id",login.id.toString());
        prefs.setString("username",login.username!);
        prefs.setString("email",login.email!);
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        AwesomeDialog(
          // ignore: use_build_context_synchronously
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "تنبيه",
          desc: "البريد أو كلمة المرور غير صحيحة!",
          btnOkOnPress: () {},
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading == true? Center( child: CircularProgressIndicator(),):  ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Form(
              key: formkey,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Image.asset(
                    'images/logo-login.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Customtextform(
                    title: "email",
                    controller: email,
                    validator: (val) {
                      return validInput(val!, 4, 20);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Customtextform(
                    title: "password",
                    controller: password,
                    validator: (val) {
                      return validInput(val!, 6, 20);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      await connectData();
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 10),
                    child: const Text("Login"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil("signup", (route) => false),
                    child: const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
