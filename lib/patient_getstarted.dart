import 'package:flutter/material.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:carousel_slider/carousel_slider.dart';


class getstarted_patient extends StatelessWidget {
  const  getstarted_patient ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          myDefaultBackground(),
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/getstarted.png'),
                      fit: BoxFit.fill))),
                      Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Image.asset('assets/images/LogoWhite.png'),
              const SizedBox(
                height: 225,
              )
            ]),

Column(
// ignore: prefer_const_literals_to_create_immutables
children: [
const CustomText(
                text: 'Great',
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                ),
              ),
                const Divider(
                        color: Color(0xffFEB197),
                        indent: 175,
                        endIndent: 175,
                        height: 30,
                        thickness: 2,
                      ),
            
          const Align(alignment: Alignment.center,
          
         child: CustomText(
                text: 'The point of using Lorem Ipsum is that\n it has a more-or-less no distribution of\n \t\t\t\t\t\t\t\t\t\tlook like readable english.',
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  
                ),
              ),
          
          ),
            ]

),
    Column(
           
            children: [
              CustomPaint(
                 size: Size(
                     double.infinity,
                     (306 * 0.657932839159359)
                         .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                 painter: WavyGetStarted(),
                  ),
         
                ]
              ),
            
         
        ],
      ),
    );
    
  }
}