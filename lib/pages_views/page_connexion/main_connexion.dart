// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:stoolz/common_widgets/widget_button.dart';
import 'package:stoolz/pages_views/page_connexion/widgets_for_connexion.dart';

class PageConnexion extends StatelessWidget {
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double widthInput = MediaQuery.of(context).size.width / 1.1;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoApp(2.1),
              textAfficher(),
              espacerHeight(35.0),
              inputText("email@email.fr", "Email", widthInput),
              espacerHeight(25.0),
              inputText("xxxxxxxxx", "Mot de passe", widthInput),
              espacerHeight(40.0),
              btnLogin(widthInput, context)
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
