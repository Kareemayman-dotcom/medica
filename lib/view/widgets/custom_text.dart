import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const CustomText({
    Key? key,
    required this.text,
    this.textStyle = const TextStyle(color: Colors.black),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text, style: textStyle),
    );
  }
}
