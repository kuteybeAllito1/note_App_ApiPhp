// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Customtextform extends StatelessWidget {

  final String? Function(String?)? validator;
    final String? title;
    final TextEditingController? controller;
   const Customtextform({super.key, required this.title,required this.controller,required this.validator});


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator:validator,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: "$title",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          )),
    );
  }
}
