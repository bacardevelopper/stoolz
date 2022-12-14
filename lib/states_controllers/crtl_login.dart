// ignore_for_file: unnecessary_new
import 'package:get/get.dart';
import 'package:stoolz/request/main_request_log.dart';

var reqLog = new MainRequestLog();

class LoginCtrl extends GetxController {
  String email = '';
  String password = '';
  String poste = '';
  String userName = "";
  bool loadOrNot = false;

  getUserName(String userNameArg, String posteArg, bool load) {
    userName = userNameArg;
    poste = posteArg;
    loadOrNot = load;
    update();
  }

  changeValue(String idValue, String value) {
    if (idValue == "Password") {
      password = value;
      update();
    }
    if (idValue == "Email") {
      email = value;
      update();
    }
  }

  lunchConnexion() {
    reqLog.loginRequest(email, password);
  }
}
