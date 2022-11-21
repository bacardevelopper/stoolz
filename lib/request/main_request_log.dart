// ignore_for_file: unnecessary_new, unused_local_variable
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_fonctions/functions_common.dart';
import 'package:stoolz/states_controllers/crtl_login.dart';
import 'package:stoolz/states_controllers/ctrl_splash.dart';

var dio = new Dio();
var navSys = new NavigationSys();

final loadSplash = Get.put(LoadSplashCtrls());
final logCtrl = Get.put(LoginCtrl());

class MainRequestLog {
  MainRequestLog();

  Future authentification() async {
    var token = await box.read("token");
    var reponse = await dio.get(uri_config + uri_step["auth"] + token!);

    if (reponse.statusCode == 201) {
      Map? reponseMap = reponse.data;
      String? userName = reponse.data["userNameRes"].toString();
      logCtrl.getUserName(userName);
      navSys.navIn("pageGestion");
    } else {
      navSys.navIn("pageConnexion");
    }
  }

  Future loginRequest(String email, String motDePasse) async {
    try {
      var reponse = await dio.post(uri_config + uri_step['connexion'],
          data: {"email": email, "password": motDePasse});
      String userName = reponse.data["user_name"];
      String token = reponse.data["token"];
      writeId(userName);
      writeToken(token);
      navSys.navIn("pageGestion");
    } catch (e) {}
  }
}
