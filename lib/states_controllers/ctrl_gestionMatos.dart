// ignore_for_file: unnecessary_new
import 'package:get/get.dart';

class GestionMatosCtrl extends GetxController {
  bool getAllMatosLoad = false;

  void updGetAllMatos() {
    getAllMatosLoad = true;
    update();
  }
}
