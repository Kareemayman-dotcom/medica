import 'package:flutter/material.dart';

class loginAs extends StatelessWidget {
  const loginAs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffE822AC), Color(0xff9E32C6)],
                stops: [0.6, 2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
