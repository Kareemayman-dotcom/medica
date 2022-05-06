import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final backgroundclr;
  final Function onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundclr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: backgroundclr,
        ),
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: Colors.white,
        ));
  }
}
