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

  Future loginRequest(String email, String motDePasse) async {
    try {
      var reponse = await dio.post(uri_config + uri_step['connexion'],
          data: {"email": email, "password": motDePasse});
      List dataLoginSuccess = [
        reponse.data["user_name"],
        reponse.data["token"]
      ];
      print(reponse.data);
      navSys.navIn("pageGestion");
      //return dataLoginSuccess;
    } catch (e) {
      print(e);
    }
  }
}
