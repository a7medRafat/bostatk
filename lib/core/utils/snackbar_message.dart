import 'package:flutter/material.dart';

void showSuccessSnackBar({required BuildContext context , required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    ),
  );
}

void showErrorSnackBar({required BuildContext context , required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    ),
  );
}