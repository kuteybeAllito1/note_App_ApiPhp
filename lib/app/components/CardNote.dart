import 'package:flutter/material.dart';
import 'package:noteappapiphp/app/Model/NotesModel.dart';
import 'package:noteappapiphp/app/constant/Linkapi.dart';

class Cardnote extends StatelessWidget {
  final void Function() ontap;
  final void Function()? ondelete;
  final NotesModel notesmodel;
  const Cardnote({
    super.key,
    required this.ontap,
    
    required this.ondelete, required this.notesmodel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    "$linkimage/${notesmodel.noteImage}",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text("${notesmodel.noteTitle}"),
                  subtitle: Text("${notesmodel.noteContent}"),
                  trailing: IconButton(
                    onPressed: ondelete,
                    icon: const Icon(Icons.delete),
                  ),
                )),
          ],
        ),
      ),
    );
    ;
  }
}
