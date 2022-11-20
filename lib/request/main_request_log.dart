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
    var token = await box.read("token");
    try {
      var reponse = await dio.get(uri_config + uri_step["auth"] + token!);
      logCtrl.getUserName(reponse.data["user_name"]);
      print("BIEN AUTHENTIFIEE");
      navSys.navIn("pageGestion");
    } catch (e) {
      print("NON AUTHENTIFIEE");
      navSys.navIn("pageLogin");
    }
  }

  Future loginRequest(String email, String motDePasse) async {
    try {
      var reponse = await dio.post(uri_config + uri_step['connexion'],
          data: {"email": email, "password": motDePasse});
      String userName = reponse.data["user_name"];
      String token = reponse.data["token"];
      box.write("user_name", userName);
      box.write("token", token);
      navSys.navIn("pageGestion");
    } catch (e) {}
  }
}
