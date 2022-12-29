// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_widgets/load_animation.dart';
import 'package:stoolz/states_controllers/ctrl_animation.dart';

Future<void> notificationMsg(BuildContext context, String data) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return GetBuilder<AnimationCtrl>(
        init: AnimationCtrl(),
        builder: (ctrl) {
          return WillPopScope(
            onWillPop: ctrl.onWillPop,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Color.fromARGB(255, 0, 88, 46),
                ),
                height: 400.0,
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    animatedLogo(),
                    texteStatusMsg(),
                    btnMsg(context),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

final animCtrl = Get.put(AnimationCtrl());
Widget btnMsg(BuildContext context) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellowAccent)),
    onPressed: () {
      Navigator.pop(context);
      animCtrl.updtWillBoolVar();
    },
    child: Icon(
      Icons.arrow_back,
      color: Colors.black,
      size: 29,
    ),
  );
}

Widget texteStatusMsg() {
  return GetBuilder<AnimationCtrl>(
    init: AnimationCtrl(),
    builder: (ctrl) {
      if (ctrl.statusMsg) {
        return Text(
          "Ajout réussit",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        );
      } else {
        return Text(
          "Chargement ...",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        );
      }
    },
  );
}
