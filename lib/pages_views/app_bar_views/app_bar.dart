// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:stoolz/common_fonctions/functions_common.dart';

class MyAppBarGestion extends AppBar {
  String? titre;
  bool? affiche;
  MyAppBarGestion({this.titre, required this.affiche})
      : super(
          title: colInfos('BACAR Darwin', "Conseiller num"),
          backgroundColor: Colors.black,
          leading: Icon(
            Icons.account_circle,
            size: 40.0,
            color: Colors.yellowAccent,
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          elevation: 0,
        );
}

var userName = getUserName();
Widget colInfos(String nom, String poste) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            nom,
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
            poste,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    ],
  );
}
