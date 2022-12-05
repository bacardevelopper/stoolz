// ignore_for_file: unused_local_variable
import 'package:dio/dio.dart';
import '../common_fonctions/functions_common.dart';

var dio = new Dio();

class MainRequestCrud {
  MainRequestCrud();

  Future getAllMateriels() async {
    var token = await box.read("token");
    print("get all materiels ------ ");
    try {
      var reponse = await dio.get(uri_config! + uri_step["read_all"] + token!);
      Map? reponseMap = reponse.data;
      print(reponseMap);
    } catch (e) {
      print(e);
    }
  }
}
