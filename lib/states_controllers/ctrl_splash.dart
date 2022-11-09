// ignore_for_file: unnecessary_new
import 'package:get/get.dart';
import 'package:stoolz/common_fonctions/functions_common.dart';

var navSys = new NavigationSys();

class LoadSplashCtrls extends GetxController {
  updateLoad(String data) {
    switch (data) {
      case 'loadOk':
        navSys.navIn('pageGestion');
        update();
        break;
      case 'loadNotOk':
        navSys.navIn('pageLogin');
        update();
        break;
    }
  }
}
