// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:stoolz/common_widgets/widget_button.dart';

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
                inputText("email", "idEmail", widthInput),
                espacerHeight(25.0),
                inputText("password", "idPass", widthInput),
                espacerHeight(40.0),
                btnLogin()
              ],
            ),
          ),
          backgroundColor: Colors.black,
        ));
  }

  Widget espacerHeight(double hauteur) {
    return Container(
      height: hauteur,
    );
  }

  Widget inputText(String idf, String logId, double widthArg) {
    return SizedBox(
      width: widthArg,
      child: FastTextField(
        name: 'field_destination',
        placeholder: idf,
        decoration: designInput(),
        onChanged: (value) {},
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  InputDecoration designInput() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
    );
  }

  Widget btnLogin() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 70.0,
        width: 70.0,
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
        fontSize: 18.0,
      ),
    );
  }
}
