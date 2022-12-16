// ignore_for_file: unnecessary_new
import 'package:get/get.dart';

class GestionMatosCtrl extends GetxController {
  bool getAllMatosLoad = false;
  List listeMateriels = [];

  void updGetAllMatos(List listeMatos) {
    getAllMatosLoad = true;
    listeMateriels = listeMatos;
    print(listeMateriels);
    update();
  }
}

// ajout un à un les materiel dans une autre liste en plus avec une clé check : bool
void addBoolCheck() {}
