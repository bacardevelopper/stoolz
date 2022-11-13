// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, must_be_immutable
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stoolz/pages_views/splash_load/main_splash_load.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stoolz/request/main_request_log.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashLoadCaller(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _SplashLoadWrapperState extends State<SplashLoadWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
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

class SplashLoadCaller extends StatelessWidget {
  MainRequestLog mainRequestLog = MainRequestLog();

  @override
  Widget build(BuildContext context) {
    return SplashLoadWrapper(
      onInit: () {
        _getThingsOnStartup().then((value) {
          mainRequestLog.authentification();
        });
      },
      child: SplashLoad(),
    );
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
