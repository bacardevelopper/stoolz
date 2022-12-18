// ignore_for_file: unnecessary_new
import 'package:get/get.dart';

class GestionMatosCtrl extends GetxController {
  bool getAllMatosLoad = false;
  List listeMateriels = [];
  List listeWithCheck = [];
  int sizeListe = 0;

  void updGetAllMatos(List listeMatos) {
    listeMateriels = listeMatos;

    sizeListe = listeMateriels.length;
    for (int index = 0; index < listeMatos.length; index++) {
      listeWithCheck.add({
        '_id': listeMateriels[index]['_id'],
        'nom': listeMateriels[index]['nom'],
        'lieu': listeMateriels[index]['lieu'],
        'disponible': listeMateriels[index]['disponible'],
        'check': false,
      });
    }
    getAllMatosLoad = true;
    update();
    print(listeWithCheck);
  }

/*
  checkOrnot(int indexArg) {
    bool check = listeMateriels[indexArg]['disponible'];

    if (check) {
      listeMateriels[indexArg]['disponible'] = false;
      update();
    } else {
      listeMateriels[indexArg]['disponible'] = true;
      update();
    }
  }
  */
}
