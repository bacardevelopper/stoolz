// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoolz/states_controllers/crtl_login.dart';

class MyAppBarGestion extends AppBar {
  String? titre;
  bool? affiche;
  MyAppBarGestion({this.titre, required this.affiche})
      : super(
          title: colInfos(),
          backgroundColor: Colors.black,
          leading: Icon(
            Icons.account_circle_rounded,
            size: 40.0,
            color: Colors.yellowAccent,
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          elevation: 0,
        );
}

Widget colInfos() {
  return GetBuilder<LoginCtrl>(
    init: LoginCtrl(),
    builder: (data) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                data.userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "poste",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
