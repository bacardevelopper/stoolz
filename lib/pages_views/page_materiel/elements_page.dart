// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:stoolz/common_widgets/input_widgets.dart';

Widget modifieTitre() {
  return Center(
    child: Text(
      "Modifier materiel",
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget labelInputMdf(String labelName) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 4, 0, 5),
        child: Text(
          labelName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}

Widget inputTextMdf(String idf, String logId, double widthArg) {
  return SizedBox(
    width: widthArg,
    child: Column(
      children: [
        labelInputMdf(logId),
        FastTextField(
          name: 'field_destination',
          placeholder: idf,
          decoration: designInput(),
          onChanged: (value) => print(value),
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

Widget btnModif(double widthArg, BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 60.0,
      width: widthArg,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      child: Icon(
        Icons.upgrade_rounded,
        size: 30,
        color: Colors.yellow,
      ),
    ),
  );
}

Widget switchDispo(double widthArg) {
  return SizedBox(
    width: widthArg,
    child: FastCheckbox(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      name: 'Disponibilité',
      titleText: 'Disponible',
      onChanged: ((value) {}),
    ),
  );
}
