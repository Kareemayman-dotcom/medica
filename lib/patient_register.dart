// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/core/view_model/auth_view_model.dart';
import 'package:medica/patient_getstarted.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/my_flutter_app_icons.dart';

class PatientRegister extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var confirmPass;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => getstarted_patient(),
            ));
        return true;
      },
      child: Scaffold(
          body: Stack(children: [
        myDefaultBackground(),
        Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/getstarted.png'),
              fit: BoxFit.fill),
        )),
        Form(
          key: _formKey,
          child: Stack(children: [
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
                  text: '\t\t\tUsername',
                  fontSize: 18,
                  color: Color(0xff300C92),
                  hint: 'Your username',
                  icon_name: Icon(
                    MyFlutterApp.person,
                    size: 25,
                    color: Color(0xffF95DDE),
                  ),
                  onSave: (value) {
                    controller.name = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                  }),
              const Divider(
                color: Color(0xff3E1E96),
                indent: 20,
                endIndent: 20,
                height: 1,
                thickness: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextFromField(
                  text: '\t\t\tEmail',
                  fontSize: 20,
                  color: Color(0xff300C92),
                  hint: 'Your email',
                  icon_name: Icon(
                    MyFlutterApp.mail,
                    size: 12,
                    color: Color(0xffF95DDE),
                  ),
                  onSave: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                  }),
              const Divider(
                color: Color(0xff3E1E96),
                indent: 20,
                endIndent: 20,
                height: 1,
                thickness: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextFromField(
                  text: '\t\t\tPassword',
                  fontSize: 18,
                  color: Color(0xff300C92),
                  hint: 'Password',
                  icon_name: Icon(
                    MyFlutterApp.lock,
                    size: 20,
                    color: Color(0xffF95DDE),
                  ),
                  onSave: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    confirmPass = value;
                    if (value!.isEmpty) {
                      return "Please Enter New Password";
                    } else if (value.length < 8) {
                      return "Password must be atleast 8 characters long";
                    } else {
                      return null;
                    }
                  }),
              const Divider(
                color: Color(0xff3E1E96),
                indent: 20,
                endIndent: 20,
                height: 1,
                thickness: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextFromField(
                  text: '\t\t\tConfirm Password',
                  fontSize: 18,
                  color: Color(0xff300C92),
                  hint: 'Confirm Password',
                  icon_name: Icon(
                    MyFlutterApp.lock,
                    size: 20,
                    color: Color(0xffF95DDE),
                  ),
                  onSave: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Re-Enter New Password";
                    } else if (value.length < 8) {
                      return "Password must be atleast 8 characters long";
                    } else if (value != confirmPass) {
                      return "Password must be same as above";
                    } else {
                      return null;
                    }
                  }),
              const Divider(
                color: Color(0xff3E1E96),
                indent: 20,
                endIndent: 20,
                height: 1,
                thickness: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextButton(
                  onPressed: () {
                    _formKey.currentState?.save();

                    if (_formKey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 17),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
                    backgroundColor: secondaryColor,
                  ),
                  child: CustomText(
                      text: 'REGISTER',
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          fontSize: 14))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an account?",
                    textStyle: TextStyle(color: Color(0xff6D6487)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.020,
                  ),
                  CustomText(
                    text: "Sign in",
                    textStyle: TextStyle(
                        color: Color(0xff4CD2CF),
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
            ])
          ]),
        ),
      ])),
    );
  }
}
