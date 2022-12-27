// ignore_for_file: unnecessary_new
import 'package:get/get.dart';
import 'package:stoolz/request/main_request_crud.dart';

var reqCrud = new MainRequestCrud();

class GestionMatosCtrl extends GetxController {
  bool getAllMatosLoad = false;
  List listeMateriels = [];
  List listeWithCheck = [];
  int sizeListe = 0;
  int bottomNavInd = 0;

  List listeId = [];

  void updGetAllMatos(List listeMatos) {
    listeMateriels = listeMatos;
    sizeListe = listeMatos.length;

    if (listeMatos.length != listeWithCheck.length) {
      listeWithCheck = [];
      for (int index = 0; index < sizeListe; index++) {
        print(listeMateriels[index]);

        listeWithCheck.add({
          '_id': listeMateriels[index]['_id'],
          'nom': listeMateriels[index]['nom'],
          'lieu': listeMateriels[index]['lieu'],
          'avis': listeMateriels[index]['avis'],
          'disponible': listeMateriels[index]['disponible'],
          'check': false,
        });
      }
    }
    getAllMatosLoad = true;
    update();
  }

  deleteMat(int index) {
    reqCrud.deleteOneMat(listeWithCheck[index]["_id"]);
    listeWithCheck.removeAt(index);
    update();
  }

  checkOrnot(int indexArg) {
    bool check = listeWithCheck[indexArg]['check'];

    if (check) {
      listeWithCheck[indexArg]['check'] = false;
      update();
    } else {
      listeWithCheck[indexArg]['check'] = true;
      update();
    }
  }

  bottomNavPage(int itemArg) {
    bottomNavInd = itemArg;
    if (itemArg == 0) {}
    update();
  }

  String nomMateriel = '';
  String nomAvis = '';
  changeValue(String idValue, String value) {
    if (idValue == "Matériel") {
      nomMateriel = value;
      update();
    }
    if (idValue == "Avis") {
      nomAvis = value;
      update();
    }
  }

  addNewMateriel() {
    reqCrud.addMateriel(nomMateriel, nomAvis);
    print('| ---- $nomMateriel $nomAvis  ----|');
  }
}
