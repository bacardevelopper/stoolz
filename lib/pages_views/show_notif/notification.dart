// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:stoolz/common_widgets/load_animation.dart';

Future<void> notificationMsg(BuildContext context, String data) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          height: 400.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              animatedLogo(),
            ],
          ),
        ),
      );
    },
  );
}
