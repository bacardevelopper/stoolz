// ignore_for_file: unused_local_variable
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';
import '../common_fonctions/functions_common.dart';

var dio = new Dio();
final gestionCtrl = Get.put(GestionMatosCtrl());

class MainRequestCrud {
  MainRequestCrud();

  Future getAllMateriels() async {
    var token = await box.read("token");
    print("get all materiels ------ ");
    try {
      var reponse = await dio.get(uri_config! + uri_step["read_all"] + token!);
      Map? reponseMap = reponse.data;
      gestionCtrl.updGetAllMatos(reponseMap!['doc']);
    } catch (e) {
      print(e);
    }
  }
}
