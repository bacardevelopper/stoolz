// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import '../show_notif/notification.dart';

Widget espacerHeight(double hauteur) {
  return Container(
    height: hauteur,
  );
}

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

Widget inputText(String idf, String logId, double widthArg) {
  return SizedBox(
    width: widthArg,
    child: Column(
      children: [
        labelInput(logId),
        FastTextField(
          name: 'field_destination',
          placeholder: idf,
          decoration: designInput(),
          onChanged: (value) {},
          cursorColor: Colors.black,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
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

Widget btnLogin(double widthArg, BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 60.0,
      width: widthArg,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.greenAccent,
      ),
      child: Icon(
        Icons.power_rounded,
        size: 30,
      ),
    ),
  );
}

Widget textAfficher() {
  return Text(
    "Se connecter à l'app",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
    ),
  );
}
