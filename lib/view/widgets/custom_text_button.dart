import 'dart:ffi';

import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundclr;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final Function onPressed;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.backgroundclr = Colors.transparent,
      this.borderRadius = BorderRadius.zero,
      this.textStyle = const TextStyle(color: Colors.white)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed(),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          backgroundColor: backgroundclr,
        ),
        child: CustomText(text: text, textStyle: textStyle));
  }
}
