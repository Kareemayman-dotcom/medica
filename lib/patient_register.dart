import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_button.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';

class PatientRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      myDefaultBackground(),
      Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/getstarted.png'),
            fit: BoxFit.fill),
      )),
      Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomPaint(
              size: Size(
                  double.infinity,
                  (MediaQuery.of(context).size.height *
                          0.45 *
                          1.6680872965861588)
                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: LnRCurve(),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomText(
                text: 'MEDICA',
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomTextFromField(
              text: 'ssssdasdasds',
              hint: 'sssssssssss',
              onSave: (value) {},
              validator: (value) {})
        ])
      ]),
    ]));
  }
}
