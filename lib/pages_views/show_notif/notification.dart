// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

Future<void> notificationMsg(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          height: 400.0,
          width: 300.0,
          child: Column(
            children: [],
          ),
        ),
      );
    },
  );
}
