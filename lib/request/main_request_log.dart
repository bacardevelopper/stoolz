// ignore_for_file: unnecessary_new
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_fonctions/functions_common.dart';
import 'package:stoolz/states_controllers/crtl_login.dart';
import 'package:stoolz/states_controllers/ctrl_splash.dart';

var dio = new Dio();
final loadSplashCtrl = Get.put(LoadSplashCtrls());
final logCtrl = Get.put(LoginCtrl());
var navSys = new NavigationSys();

class MainRequestLog {
  MainRequestLog();

  Future authentification() async {
    var token = await getToken();
    try {
      var reponse = await dio.get(uri_config + uri_step["auth"] + token!);
      navSys.navIn("pageGestion");
      print("AFFICHE ----- DATA AUTHENTIFICATION -----");
      print(reponse.data);
      //loadSplashCtrl.updateLoad("loadOk");
    } catch (e) {
      navSys.navIn("pageLogin");
      // loadSplashCtrl.updateLoad("loadNotOk");
    }
  }

  Future loginRequest(String email, String motDePasse) async {
    try {
      var reponse = await dio.post(uri_config + uri_step['connexion'],
          data: {"email": email, "password": motDePasse});
      List dataLoginSuccess = [
        reponse.data["user_name"],
        reponse.data["token"]
      ];
      writeIdInLocal(dataLoginSuccess[1], dataLoginSuccess[0]);
      navSys.navIn("pageGestion");
    } catch (e) {
      print(e);
    }
  }
}
