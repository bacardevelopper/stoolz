// ignore_for_file: unnecessary_new, unused_local_variable, empty_catches
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
    print("lancement de l'auhtentification -------");
    var token = await box.read("token");

    try {
      var reponse = await dio.get(uri_config! + uri_step["auth"] + token!);
      Map? reponseMap = reponse.data;
      navSys.navIn("pageGestion");
      print(reponse);
    } catch (e) {
      print(e);
      navSys.navIn("pageLogin");
    }
  }

  Future reqGetUserName() async {
    var token = await box.read("token");

    try {
      var reponse = await dio.get(uri_config! + uri_step["auth"] + token);
      Map? reponseMap = reponse.data;
      String? userName = reponse.data["userNameRes"].toString();
      String? userPoste = reponse.data["poste"].toString();
      logCtrl.getUserName(userName, userPoste, true);
    } catch (e) {}
  }

  Future loginRequest(String email, String motDePasse) async {
    print("FONCTION LOGIN LANCER ------ ------ ------");
    try {
      var reponse = await dio.post(uri_config! + uri_step['connexion'],
          data: {"email": email, "password": motDePasse});
      String userName = reponse.data["user_name"];
      String token = reponse.data["token"];
      writeToken(token);
      print(reponse);
      navSys.navIn("pageGestion");
    } catch (e) {
      print(e);
    }
  }
}
