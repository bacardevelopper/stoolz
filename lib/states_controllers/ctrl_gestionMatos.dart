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

  void updGetAllMatos(List listeMatos) {
    listeMateriels = listeMatos;
    sizeListe = listeMatos.length;
    print("SIZE =====> $sizeListe");
    for (int index = 0; index < sizeListe; index++) {
      listeWithCheck.add({
        '_id': listeMateriels[index]['_id'],
        'nom': listeMateriels[index]['nom'],
        'lieu': listeMateriels[index]['lieu'],
        'avis': listeMateriels[index]['avis'],
        'disponible': listeMateriels[index]['disponible'],
        'check': false,
      });
    }
    getAllMatosLoad = true;
    update();
    print(listeWithCheck);
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
    update();
  }
}
