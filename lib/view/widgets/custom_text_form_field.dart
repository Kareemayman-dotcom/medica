import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFromField extends StatelessWidget {
  final String text;
  final String hint;
  final void Function(String?)? onSave;
  final FormFieldValidator<String>? validator;
  const CustomTextFromField({
    Key? key,
    required this.text,
    required this.hint,
    required this.onSave,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CustomText(
          text: text,
          textStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
        ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black,),
              fillColor: Colors.white),
        ),
      ],
    ));
  }
}
