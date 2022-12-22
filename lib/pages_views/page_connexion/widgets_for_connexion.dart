// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_widgets/input_widgets.dart';
import 'package:stoolz/pages_views/show_notif/notification.dart';
import 'package:stoolz/states_controllers/crtl_login.dart';

final ctrlLogin = Get.put(LoginCtrl());

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
          onChanged: (value) => ctrlLogin.changeValue(logId, value!),
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

Widget btnLogin(double widthArg, BuildContext context) {
  return InkWell(
    onTap: () {
      ctrlLogin.lunchConnexion();
      notificationMsg(context, "");
    },
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
