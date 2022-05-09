import 'package:flutter/material.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/custom_background.dart';

class PatientRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
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
        Column(
          children: [
            
          ],
        )
      ]),
    ]));
  }
}
