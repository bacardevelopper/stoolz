// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stoolz/common_widgets/input_widgets.dart';
import 'package:stoolz/common_widgets/load_animation.dart';
import 'package:stoolz/pages_views/app_bar_views/app_bar.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';
import 'elements_page.dart';

class PageMateriel extends StatelessWidget {
  PageMateriel({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMax = MediaQuery.of(context).size.height;
    double widthInput = MediaQuery.of(context).size.width / 1.1;
    double spaceHeight = 20.0;

    return GetBuilder<GestionMatosCtrl>(
      init: GestionMatosCtrl(),
      builder: (ctrl) {
        if (ctrl.getMateriel.isEmpty) {
          return Center(
            child: animatedLogo(),
          );
        } else {
          return Scaffold(
            appBar: MyAppBarGestion(
              titre: 'Bacar',
              affiche: false,
            ),
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: heightMax,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    espacerHeight(40.0),
                    modifieTitre(),
                    espacerHeight(spaceHeight),
                    inputTextMdf("Nom du matériel", "Nom", widthInput),
                    espacerHeight(spaceHeight),
                    inputTextMdf("Avis matériel", "Avis", widthInput),
                    espacerHeight(spaceHeight),
                    inputTextMdf("Lieu de stockage", "Lieu", widthInput),
                    espacerHeight(40.0),
                    switchDispo(widthInput),
                    espacerHeight(40.0),
                    btnModif(widthInput, context)
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.amber,
          );
        }
      },
    );
  }
}
