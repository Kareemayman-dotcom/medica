import 'package:flutter/material.dart';

import 'constance.dart';
import 'custom_text.dart';

class docCat extends StatelessWidget {
  String catName;
  int numOfDoctors;
  bool isActiv;
  docCat({
    Key? key,
    required this.catName,
    required this.numOfDoctors,
    this.isActiv = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (!isActiv) {
      return Container(
        margin: EdgeInsets.only(right: size.width * 0.02),
        child: Row(
          children: [
            TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  backgroundColor: Color(0xffFFE4DB),
                  minimumSize: Size(size.width * 0.25, size.height * 0.05),
                  // maximumSize:
                  //     Size(size.width * 0.25, size.height * 0.05),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: '$catName($numOfDoctors)',
                      textStyle:
                          TextStyle(color: primaryColor, fontFamily: 'inter'),
                    )
                  ],
                ))
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(right: size.width * 0.02),
        child: Row(
          children: [
            TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  backgroundColor: Color(0xffFF8F6A),
                  minimumSize: Size(size.width * 0.25, size.height * 0.05),
                  // maximumSize:
                  //     Size(size.width * 0.25, size.height * 0.05),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: '$catName($numOfDoctors)',
                      textStyle:
                          TextStyle(color: Colors.white, fontFamily: 'inter'),
                    )
                  ],
                ))
          ],
        ),
      );
    }
  }
}
