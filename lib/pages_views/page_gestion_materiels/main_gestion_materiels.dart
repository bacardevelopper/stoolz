// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, unnecessary_new
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_widgets/load_animation.dart';
import 'package:stoolz/pages_views/app_bar_views/app_bar.dart';
import 'package:stoolz/pages_views/page_drawer/main_drawer.dart';
import 'package:stoolz/pages_views/page_gestion_materiels/view_materiel.dart';
import 'package:stoolz/request/main_request_log.dart';
import 'package:stoolz/states_controllers/crtl_login.dart';

final controller = Get.put(LoginCtrl());
final reqLog = new MainRequestLog();

class PageGestion extends StatelessWidget {
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginCtrl>(
      init: LoginCtrl(),
      builder: (ctrlUserName) {
        if (ctrlUserName.loadOrNot) {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              drawer: DrawerView(),
              appBar: MyAppBarGestion(
                titre: 'Bacar',
                affiche: false,
              ),
              backgroundColor: Colors.black,
              body: ViewMateriel(
                data: dataRes,
              ),
            ),
          );
        } else {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    animatedLogo(),
                    Container(
                      height: 20.0,
                    ),
                    Text(
                      "Chargement de la page gestion ...",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.black,
            ),
          );
        }
      },
    );
  }
}

class GestionViewWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const GestionViewWrapper({required this.onInit, required this.child});
  @override
  _GestionViewWrapperState createState() => _GestionViewWrapperState();
}

class _GestionViewWrapperState extends State<GestionViewWrapper> {
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

class GestionViewCaller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestionViewWrapper(
      onInit: () {
        _getThingsOnStartup().then((value) {
          reqLog.reqGetUserName();
        });
      },
      child: PageGestion(),
    );
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
