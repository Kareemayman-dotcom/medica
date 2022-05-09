// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'custom_text.dart';

class CustomTextFromField extends StatelessWidget {
  final String text;
  final int fontSize;
  final Color color;
  final String hint;
  final Icon? icon_name;
  final void Function(String?)? onSave;
  final FormFieldValidator<String>? validator;
  CustomTextFromField({
    required this.text,
    required this.fontSize,
    required this.color,
    required this.hint,
    this.icon_name,
    required this.onSave,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CustomText(
          text: text,
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: color,
          ),
          textAlign: Alignment.topLeft,
        ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              prefixIcon: icon_name,
              hintStyle: TextStyle(
                color: Color(0xff6D6487),
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal
              ),
              fillColor: Colors.white,
              
               border: InputBorder.none
   
              

              ),
        ),
      ],
    ));
  }
}
