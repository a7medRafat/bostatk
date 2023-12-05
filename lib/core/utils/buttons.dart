import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String txt;
  final function;
  final Color color;


  const ButtonWidget({super.key, required this.txt,required this.function, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(txt,style: Theme.of(context).textTheme.bodySmall,),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color
      ),
      onPressed: function
    );
  }
}
