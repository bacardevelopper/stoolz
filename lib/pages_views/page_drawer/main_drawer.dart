// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnFonction("DISPONIBLE", 1),
            btnFonction("SUPPRIMER", 2),
            btnFonction("INDISPONIBLE", 3),
            btnFonction("DEPLACER", 4),
            scanQrbtn(),
          ],
        ),
      ),
    );
  }

  Widget btnFonction(String nameArg, int dataArg) {
    return Padding(
      padding: EdgeInsets.all(11.0),
      child: InkWell(
        onTap: () {},
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
            )
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
