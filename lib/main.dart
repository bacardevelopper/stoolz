// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:stoolz/pages_views/splash_load/main_splash_load.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashLoad(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// StatefulWidget Wrapper
class SplashLoadWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;

  const SplashLoadWrapper({required this.onInit, required this.child});
  @override
  _SplashLoadWrapperState createState() => _SplashLoadWrapperState();
}

class _SplashLoadWrapperState extends State<SplashLoadWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.child;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class SplashLoadCaller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashLoadWrapper(
      onInit: () {
        _getThingsOnStartup().then((value) {});
      },
      child: SplashLoad(),
    );
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
