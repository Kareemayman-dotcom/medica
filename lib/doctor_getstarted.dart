// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/doctor_register.dart';
import 'package:medica/loginType.dart';

import 'package:medica/patient_register.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';

import 'package:medica/view/widgets/slider_para.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'doctor_login.dart';

class doctor_getstarted extends StatelessWidget {
  List<Widget> cardList = [
    const sliderCard(
        text: 'Great',
        graph:
            'The point of using Lorem Ipsum is that it has a more-or-less no distribution of look like readable english.'),
    const sliderCard(
        text: 'Instant',
        graph:
            'The point of using Lorem Ipsum is that it has a more-or-less no distribution of look like readable english.'),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(loginAs());
        return true;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            myDefaultBackground(),
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/getstarted.png'),
                        fit: BoxFit.fill))),
            Stack(alignment: Alignment.bottomCenter, children: [
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                CustomPaint(
                  size: Size(
                      double.infinity,
                      (MediaQuery.of(context).size.width *
                              0.9 *
                              0.657932839159359)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: WavyGetStarted(),
                ),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: 'Let\'s Get Started',
                    textStyle: TextStyle(
                      color: Color(0xff300C92),
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.to(doctor_register());
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 17),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            )),
                            backgroundColor: primaryColor,
                          ),
                          child: CustomText(
                              text: 'REGISTER',
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14))),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(doctor_login());
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 64, vertical: 17),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            )),
                            backgroundColor: secondaryColor,
                          ),
                          child: CustomText(
                              text: 'LOGIN',
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14))),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  )
                ],
              )
            ]),
            Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Image.asset('assets/images/LogoWhite.png'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
              ),
              CarouselSlider(
                items: cardList,
                options: CarouselOptions(
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}