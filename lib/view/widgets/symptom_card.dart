import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constance.dart';
import 'custom_text.dart';

class symptomCard extends StatelessWidget {
  String primary;
  String secondary;
  symptomCard({
    Key? key,
    required this.primary,
    required this.secondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: Size(double.infinity, size.height * 0.09),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * 0.12,
              width: size.width * 0.28,
              decoration: BoxDecoration(
                color: Color(0xffF2EEFD),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 13,
                right: 10,
                left: 10,
              ),
              width: size.width * 0.5,
              height: size.height * 0.12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: primary,
                    textAlign: TextAlign.left,
                    textStyle: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomText(
                    text: secondary,
                    textAlign: TextAlign.left,
                    textStyle: TextStyle(
                      color: Colors.grey, fontSize: 13, fontFamily: 'Inter',
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'View more',
                        textStyle: TextStyle(
                          color: Color(0xffFF8F6A),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      SvgPicture.asset('assets/icons/chevron-right.svg')
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
