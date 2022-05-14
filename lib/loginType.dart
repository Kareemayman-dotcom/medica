import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/doctor_getstarted.dart';
import 'package:medica/patient_getstarted.dart';
import 'package:medica/splash.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_button.dart';

import 'view/widgets/wavey_shape.dart';

class loginAs extends StatelessWidget {
  const loginAs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            myDefaultBackground(),
            Container(
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.luminosity,
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/png/Selecting_Login_Type.png'),
                        fit: BoxFit.fill))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/LogoWhite.png'),
                    const SizedBox(
                      height: 50,
                    ),
                    const CustomText(
                      text: 'LOGIN AS',
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(patient_getstarted());
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.7,
                              MediaQuery.of(context).size.width * 0.125),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          )),
                          backgroundColor: primaryColor,
                        ),
                        child: CustomText(
                            text: 'PATIENT',
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                fontSize: 18))),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(doctor_getstarted());
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.7,
                              MediaQuery.of(context).size.width * 0.125),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          )),
                          backgroundColor: secondaryColor,
                        ),
                        child: CustomText(
                            text: 'DOCTOR',
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                fontSize: 18))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    // CustomButton(
                    //   text: 'PATIENT',
                    //   textStyle: const TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //     fontFamily: 'Inter',
                    //     fontWeight: FontWeight.w800,
                    //   ),
                    //   onPressed: () {},
                    //   borderRadius: const BorderRadius.only(
                    //     topLeft: Radius.circular(25),
                    //     bottomRight: Radius.circular(25),
                    //   ),
                    //   padding:
                    //       const EdgeInsets.symmetric(horizontal: 102, vertical: 13),
                    //   backgroundclr: primaryColor,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // CustomButton(
                    //   text: 'DOCTOR',
                    //   textStyle: const TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //     fontFamily: 'Inter',
                    //     fontWeight: FontWeight.w800,
                    //   ),
                    //   onPressed: () {
                    //     // ignore: avoid_print
                    //     print('CLICKEDDDDDDDDDDDDDDD');
                    //   },
                    //   borderRadius: const BorderRadius.only(
                    //     topRight: Radius.circular(25),
                    //     bottomLeft: Radius.circular(25),
                    //   ),
                    //   padding:
                    //       const EdgeInsets.symmetric(horizontal: 102, vertical: 13),
                    //   backgroundclr: secondaryColor,
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
