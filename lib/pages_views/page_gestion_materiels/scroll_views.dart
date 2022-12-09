// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_widgets/load_animation.dart';
import 'package:stoolz/pages_views/page_gestion_materiels/view_materiel.dart';
import 'package:stoolz/request/main_request_crud.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';
// --

class ScrollMateriels extends StatelessWidget {
  var reqGestion = MainRequestCrud();

  @override
  Widget build(BuildContext context) {
    reqGestion.getAllMateriels();
    return feedMateriels();
  }

  Widget feedMateriels() {
    return GetBuilder(
      init: GestionMatosCtrl(),
      builder: (value) {
        if (value.getAllMatosLoad == false) {
          return Center(
            child: animatedLogo(),
          );
        } else {
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ViewMateriel(data: dataRes);
            },
          );
        }
      },
    );
  }
}
