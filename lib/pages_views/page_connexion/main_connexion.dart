// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:stoolz/common_widgets/input_widgets.dart';
import 'package:stoolz/common_widgets/widget_button.dart';
import 'package:stoolz/pages_views/page_connexion/widgets_for_connexion.dart';

class PageConnexion extends StatelessWidget {
  Future<bool> _onWillPop() async {
    return false;
  }

  double widthMax = 320.0;
  @override
  Widget build(BuildContext context) {
    double heightMax = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: heightMax,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logoApp(2.1),
                  textAfficher(),
                  espacerHeight(35.0),
                  inputText("email@email.fr", "Email", widthMax),
                  espacerHeight(25.0),
                  inputText("xxxxxxxxx", "Password", widthMax),
                  espacerHeight(40.0),
                  btnLogin(widthMax, context)
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
