import 'package:flutter/cupertino.dart';

class DisplayMessageWidget extends StatelessWidget {
  final String message;

  const DisplayMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: SingleChildScrollView(
        child: Text(message,style: TextStyle(
          fontSize: 15,
        ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
