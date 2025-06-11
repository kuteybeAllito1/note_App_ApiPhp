// ignore_for_file: file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:noteappapiphp/app/Model/NotesModel.dart';
import 'package:noteappapiphp/app/components/CardNote.dart';
import 'package:noteappapiphp/app/components/cudi.dart';
import 'package:noteappapiphp/app/constant/Linkapi.dart';
import 'package:noteappapiphp/app/notes/update.dart';
import 'package:noteappapiphp/main.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Cudi curdi = Cudi();

  readNoteData() async {
    var id = prefs.getString("id");
    var request = await curdi.postresponse(linkviewnote, {"id": id});
    return request;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('Addnote');
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                prefs.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              icon: const Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ),
            ),
          ],
          title: const Text("Home"),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: ListView(
            children: [
              FutureBuilder(
                  future: readNoteData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data['data'] != null &&
                        snapshot.data['data'].isNotEmpty) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, index) {
                          return Cardnote(
                            ontap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UpdateNote(
                                      note: snapshot.data['data'][index])));
                            },
                            notesmodel: NotesModel.fromJson(
                                snapshot.data['data'][index]),
                            ondelete: () async {
                              var response =
                                  await curdi.postresponse(linkdeletenote, {
                                "id": snapshot.data['data'][index]['notes_id']
                                    .toString(),
                                    "imagename": snapshot.data['data'][index]['note_image']
                              });
                              if (response['status'] == "success") {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.success,
                                  title: "تم الحذف",
                                  desc: "تم حذف الملاحظة بنجاح",
                                  btnOkOnPress: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            "home", (route) => false);
                                  },
                                ).show();
                              }
                            },
                          );
                        },
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: Text("لا توجد ملاحظات"));
                    }

                    })
            ],
          ),
        ));
  }
}
