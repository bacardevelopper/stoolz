// ignore_for_file: unused_local_variable, unnecessary_new, avoid_print, prefer_interpolation_to_compose_strings, await_only_futures
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stoolz/states_controllers/ctrl_animation.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';
import '../common_fonctions/functions_common.dart';

var dio = new Dio();
final gestionCtrl = Get.put(GestionMatosCtrl());

class MainRequestCrud {
  MainRequestCrud();

  Future getAllMateriels() async {
    var token = await getStrToken();
    try {
      var reponse = await dio.get(uri_config! + uri_step["read_all"] + token!);
      Map? reponseMap = reponse.data;
      gestionCtrl.updGetAllMatos(reponseMap!['doc']);
    } catch (e) {
      print(e);
    }
  }

  Future deleteOneMat(String id) async {
    var token = await getStrToken();
    var idAndToken = id + '/' + token;
    try {
      var reponse =
          await dio.get(uri_config! + uri_step["delete_one"] + idAndToken);
      Map? reponseMap = reponse.data;
      print(reponseMap);
    } catch (e) {
      print(e);
    }
  }

  Future deleteMany(List idListe) async {
    var token = await getStrToken();
    try {
      var reponse = await dio.post(uri_config! + uri_step["delete_many"],
          data: {"token": token, "array": idListe});
      print(reponse.data);
    } catch (e) {
      print(e);
    }
  }

  Future addMateriel(String nom, String avis) async {
    var token = await getStrToken();
    final animCtrl = await Get.put(AnimationCtrl());
    try {
      var reponse = await dio.post(uri_config! + uri_step["create"],
          data: {"nom": nom, "avis": avis, "token": token});
      print(reponse.data);
      animCtrl.updReqAddMatos(true);
    } catch (e) {
      print(e);
    }
  }
}
