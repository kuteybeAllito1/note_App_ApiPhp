import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:noteappapiphp/app/components/CustomTextForm.dart';
import 'package:noteappapiphp/app/components/cudi.dart';
import 'package:noteappapiphp/app/components/valid.dart';
import 'package:noteappapiphp/app/constant/Linkapi.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noteappapiphp/main.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  File? image;

  bool isloading = false;
  Cudi curdi = Cudi();
  addnote() async {
    if (image == null) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        title: " الرجاء ادخال صوره",
        btnOkOnPress: () {
          
        },
      ).show();
    }
    if (formkey.currentState!.validate()) {
      isloading = true;
      setState(() {});
      var response = await curdi.postrequsetfile(
          linkaddnote,
          {
            "userid": prefs.getString("id"),
            "notetitle": title.text,
            "notecontent": content.text,
          },
          image!);
      isloading = false;
      setState(() {});
      if (response['status'] == "success") {
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(60),
              child: Form(
                key: formkey,
                child: ListView(
                  children: [
                    Customtextform(
                      title: 'title',
                      controller: title,
                      validator: (val) {
                        return validInput(val!, 1, 50);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Customtextform(
                      title: 'content',
                      controller: content,
                      validator: (val) {
                        return validInput(val!, 1, 250);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      color: Colors.green[400],
                      onPressed: () async {
                        await addnote();
                      },
                      child: const Text(
                        "Add Note",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.green[400],
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            XFile? file = await ImagePicker()
                                                .pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (file != null) {
                                              image = File(file.path);
                                            }else{
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          child: Container(
                                              color: Colors.green[400],
                                              padding: const EdgeInsets.all(10),
                                              child: const Text(
                                                "choose from gallery",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            XFile? file = await ImagePicker()
                                                .pickImage(
                                                    source: ImageSource.camera);
                                            if (file != null) {
                                              image = File(file.path);
                                            }else{
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          child: Container(
                                              color: Colors.green[400],
                                              padding: const EdgeInsets.all(10),
                                              child: const Text(
                                                "choose from Camera",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: const Text(
                        "Upload Image",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
