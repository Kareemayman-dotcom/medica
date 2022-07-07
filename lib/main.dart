// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medica/doctor_profile.dart';
import 'package:medica/helper/binding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:medica/patient_book.dart';
import 'package:medica/patient_getstarted.dart';
import 'package:medica/patient_home.dart';
import 'package:medica/patient_register.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medica/patient_profile.dart';
import 'package:medica/patient_profiledata.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(MyApp());
  FlutterNativeSplash.remove();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

// whenever your initialization is completed, remove the splash screen:

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Loading.....'),
                ),
              ),
            );
          } else {
            isUserLoggedIn = snapshot.data?.getBool(k_keepMeLoggedIn) ?? false;
            return GetMaterialApp(
                initialBinding: Binding(),
                debugShowCheckedModeBanner: false,
                home: isUserLoggedIn ? doctorProfile() : patient_getstarted());
          }
        });
  }
}
