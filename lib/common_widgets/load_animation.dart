import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'widget_button.dart';

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
