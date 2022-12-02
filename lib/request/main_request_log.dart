// ignore_for_file: unnecessary_new, unused_local_variable
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_fonctions/functions_common.dart';
import 'package:stoolz/states_controllers/crtl_login.dart';
import 'package:stoolz/states_controllers/ctrl_splash.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();
var dio = new Dio();
var navSys = new NavigationSys();

final loadSplash = Get.put(LoadSplashCtrls());
final logCtrl = Get.put(LoginCtrl());

class MainRequestLog {
  MainRequestLog();

  Future authentification() async {
    var token = await box.read("token");

    try {
      var reponse = await dio.get(uri_config! + uri_step["auth"] + token!);
      Map? reponseMap = reponse.data;
      navSys.navIn("pageGestion");
    } catch (e) {
      navSys.navIn("pageLogin");
    }
  }

  Future reqGetUserName() async {
    var token = await box.read("token");

    try {
      var reponse = await dio.get(uri_config! + uri_step["auth"] + token);
      Map? reponseMap = reponse.data;
      String? userName = reponse.data["userNameRes"].toString();
      logCtrl.getUserName(userName, true);
    } catch (e) {}
  }

  Future loginRequest(String email, String motDePasse) async {
    try {
      var reponse = await dio.post(uri_config! + uri_step['connexion'],
          data: {"email": email, "password": motDePasse});
      String userName = reponse.data["user_name"];
      String token = reponse.data["token"];
      writeToken(token);
      navSys.navIn("pageGestion");
    } catch (e) {}
  }
}
