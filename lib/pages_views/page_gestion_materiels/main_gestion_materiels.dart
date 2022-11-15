// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:stoolz/pages_views/app_bar_views/app_bar.dart';

class PageGestion extends StatelessWidget {
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: MyAppBarGestion(
          titre: 'Bacar',
          affiche: false,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
