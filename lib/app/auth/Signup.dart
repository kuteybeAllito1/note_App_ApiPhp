// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:noteappapiphp/app/components/CustomTextForm.dart';
import 'package:noteappapiphp/app/components/cudi.dart';
import 'package:noteappapiphp/app/components/valid.dart';
import 'package:noteappapiphp/app/constant/Linkapi.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Cudi cudi = Cudi();

  bool isloading = false;

  signup() async {
    if (formkey.currentState!.validate()) {


      isloading = true;
    setState(() {});
    var requst = await cudi.postresponse(linkSignup, {
      "username": username.text,
      "email": email.text,
      "password": password.text,
    });
    isloading = false;
    setState(() {});
    if (requst["status"] == "success") {
      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
    } else {
      print("error ${requst["status"]}");
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
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
                          'images/logo-signup.png',
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Customtextform(
                          title: "Username",
                          controller: username,
                          validator: (val) {
                            return validInput(val!, 3, 5);
                          },
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
                            await signup();
                          },
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: const Text("Sign up"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ignore: prefer_const_constructors
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamedAndRemoveUntil("/", (route) => false),
                          child: const Text(
                            "Already have an account? Login",
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
