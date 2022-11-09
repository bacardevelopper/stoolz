// ignore_for_file: unnecessary_new
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_fonctions/functions_common.dart';
import 'package:stoolz/states_controllers/ctrl_splash.dart';

var dio = new Dio();
final loadSplashCtrl = Get.put(LoadSplashCtrls());
var navSys = new NavigationSys();

class MainRequestLog {
  MainRequestLog();

  Future authentification() async {
    print("Fonction test");
    var token = await getToken();
    try {
      var reponse = await dio.get(uri_config + uri_step["auth"] + token!);
      loadSplashCtrl.updateLoad("loadOk");
    } catch (e) {
      loadSplashCtrl.updateLoad("loadNotOk");
    }
  }

  Future loginRequest() async {}
}
