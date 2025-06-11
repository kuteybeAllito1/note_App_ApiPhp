import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noteappapiphp/app/components/CustomTextForm.dart';
import 'package:noteappapiphp/app/components/cudi.dart';
import 'package:noteappapiphp/app/components/valid.dart';
import 'package:noteappapiphp/app/constant/Linkapi.dart';
import 'package:noteappapiphp/main.dart';

class UpdateNote extends StatefulWidget {
  final note;
  UpdateNote({super.key, this.note});

  @override
  State<UpdateNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<UpdateNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  File? image;

  bool isloading = false;
  Cudi curdi = Cudi();
  editnote() async {
    if (formkey.currentState!.validate()) {
      isloading = true;
      setState(() {});
      var response;
      if (image != null) {
        response = await curdi.postrequsetfile(
            linkupdatenote,
            {
              "noteid": widget.note['notes_id'].toString(),
              "notetitle": title.text,
              "notecontent": content.text,
              "image": widget.note['note_image'].toString(),
            },
            image!);
      } else {
        response = await curdi.postresponse(linkupdatenote, {
          "noteid": widget.note['notes_id'].toString(),
          "notetitle": title.text,
          "notecontent": content.text,
          "noteimage": widget.note['note_image'].toString(),
        });
      }

      isloading = false;
      setState(() {});
      if (response['status'] == "success") {
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      }
    }
  }

  @override
  void initState() {
    title.text = widget.note['note_title'];
    content.text = widget.note['note_content'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("update Note"),
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
                                            } else {
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
                                            } else {
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
                    MaterialButton(
                      color: Colors.green[400],
                      onPressed: () async {
                        await editnote();
                      },
                      child: Text(
                        "update Note",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
