import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Alignment textAlign;
  const CustomText({
    Key? key,
    required this.text,
    this.textAlign = Alignment.center,
    this.textStyle = const TextStyle(color: Colors.black),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: textAlign,
      child: Text(
        text,
        style: textStyle,
        
      ),
    );
  }
}
