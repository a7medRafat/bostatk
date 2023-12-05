import 'package:clean_archeticture_posts_app/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final controller;
  final String msg;
  final String hint;
  final int? maxLines;
  final int? minLines;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.msg,
      this.maxLines,
      this.minLines,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return msg;
        }
        return null;
      },
      minLines: maxLines,
      maxLines: minLines,
      decoration: InputDecoration(
          hintText: hint,
          fillColor: defaultColor,
          filled: true,
          border: InputBorder.none,

      ),
    );
  }
}
