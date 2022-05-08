import 'package:flutter/material.dart';
import 'package:medica/splash.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'loginType.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

// whenever your initialization is completed, remove the splash screen:

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginAs(),
    );
  }
}
