import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Color color;
  final double fontSize;
  final String text;
  final Alignment alignment;
  final FontWeight fontWeight;
  final String fontFamily;
  final FontStyle fontStyle;
  const CustomText(
      {Key? key,
      this.color = Colors.black,
      this.fontSize = 16,
      this.text = "",
      this.alignment = Alignment.topCenter,
      this.fontWeight = FontWeight.normal,
      this.fontFamily = 'Arial',
      this.fontStyle = FontStyle.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            fontStyle: fontStyle,
            
          )),
    );
  }
}
