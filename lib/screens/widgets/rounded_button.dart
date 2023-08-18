import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
   RoundedButton({super.key,required this.onpressed,required this.color,required this.text});
   final  Function() ? onpressed;
   final Color color;
   final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color), 
      onPressed: onpressed, child: Text(text));
  }
}