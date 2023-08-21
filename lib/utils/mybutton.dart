import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
   MyButton({super.key,required this.onpressed,required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Colors.green,
      child: Text(text),
    );
  }
}
