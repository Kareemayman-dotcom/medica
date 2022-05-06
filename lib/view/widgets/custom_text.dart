import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Color color;
  final double fontSize;
  final String text;
  final Alignment alignment;

  CustomText(
      {this.alignment = Alignment.topLeft,
      this.text = " ",
      this.fontSize = 16,
      this.color = Colors.black});


    
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          )),
    );
  }
}
