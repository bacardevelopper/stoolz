// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stoolz/common_widgets/widget_button.dart';

class SplashLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: animatedLogo(),
      ),
    );
  }

  Widget animatedLogo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(0.0),
          child: logoApp(2.1),
        ),
        Padding(
          padding: EdgeInsets.all(0.0),
          child: LoadingAnimationWidget.twistingDots(
            leftDotColor: Colors.white,
            rightDotColor: Colors.yellow,
            size: 40,
          ),
        )
      ],
    );
  }
}
