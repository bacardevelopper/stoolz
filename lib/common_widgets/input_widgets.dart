// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget labelInput(String labelName) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 4, 0, 5),
        child: Text(
          labelName,
          style: TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}

Widget espacerHeight(double hauteur) {
  return Container(
    height: hauteur,
  );
}

InputDecoration designInput() {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.0,
      ),
    ),
  );
}
