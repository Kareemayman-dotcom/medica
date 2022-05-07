import 'package:flutter/material.dart';
import 'package:medica/view/widgets/custom_background.dart';

import 'view/widgets/wavey_shape.dart';

class loginAs extends StatelessWidget {
  const loginAs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          myDefaultBackground(),
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/loginAsBg.png'),
                      fit: BoxFit.fill)
                      )
                      ),
        ],
      ),
    );
  }
}
