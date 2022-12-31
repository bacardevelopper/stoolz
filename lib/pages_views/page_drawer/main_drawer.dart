// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';

final gestionCtrl = Get.put(GestionMatosCtrl());

class DrawerView extends StatelessWidget {
  DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnFonction("DISPONIBLE", 1, context),
            btnFonction("SUPPRIMER", 2, context),
            btnFonction("INDISPONIBLE", 3, context),
            btnFonction("DEPLACER", 4, context),
            scanQrbtn(),
          ],
        ),
      ),
    );
  }

  Widget btnFonction(String nameArg, int dataArg, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(11.0),
      child: InkWell(
        onTap: () {
          if (dataArg == 2) {
            gestionCtrl.deleteMany();
            Navigator.of(context).pop();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nameArg,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 29.0,
              ),
            ),
            Container(
              width: 12.0,
            ),
            Icon(
              Icons.check_box_rounded,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget scanQrbtn() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.qr_code_scanner_rounded,
        size: 49.0,
        color: Colors.black,
      ),
    );
  }
}
