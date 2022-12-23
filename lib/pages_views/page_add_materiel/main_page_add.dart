// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_widgets/input_widgets.dart';
import 'package:stoolz/pages_views/show_notif/notification.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';

class PageAjout extends StatelessWidget {
  PageAjout({super.key});

  final ctrlPageAdd = Get.put(GestionMatosCtrl());

  @override
  Widget build(BuildContext context) {
    double widthArg = MediaQuery.of(context).size.width / 1.2;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          inputTextAdd("Matériel", "Nom du matériel", widthArg),
          espacerHeight(20.0),
          inputTextAdd("Avis", "Avis matériel", widthArg),
          espacerHeight(30.0),
          btnAddMat(widthArg, context)
        ],
      ),
    );
  }

  Widget inputTextAdd(String idf, String logId, double widthArg) {
    return SizedBox(
      width: widthArg,
      child: Column(
        children: [
          labelInput(logId),
          FastTextField(
            name: 'field_destination',
            placeholder: idf,
            decoration: designInput(),
            onChanged: (value) {
              ctrlPageAdd.changeValue(idf, value!);
            },
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

  Widget btnAddMat(double widthArg, BuildContext context) {
    return InkWell(
      onTap: () {
        ctrlPageAdd.addNewMateriel();
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
          Icons.add_box_rounded,
          size: 30,
        ),
      ),
    );
  }
}
