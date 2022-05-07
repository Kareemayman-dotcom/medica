import 'package:flutter/material.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_button.dart';

import 'view/widgets/wavey_shape.dart';

class loginAs extends StatelessWidget {
  const loginAs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          myDefaultBackground(),
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/loginAsBg.png'),
                      fit: BoxFit.fill))),
          Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Image.asset('assets/images/LogoWhite.png'),
              SizedBox(
                height: 50,
              ),
              CustomText(
                text: 'LOGIN AS',
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 102),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                    backgroundColor: primaryColor,
                  ),
                  child: CustomText(
                      text: 'PATIENT',
                      textStyle: TextStyle(
                        color: Colors.white,
                      ))),
              CustomButton(
                text: 'PATIENT',
                onPressed: () {},
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                padding: EdgeInsets.symmetric(),
                backgroundclr: primaryColor,
              ),
              CustomButton(
                text: 'DOCTOR',
                onPressed: () {},
                backgroundclr: secondaryColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
