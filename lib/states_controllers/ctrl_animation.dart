import 'package:get/get.dart';

class AnimationCtrl extends GetxController {
  bool willBoolVar = false;
  bool statusMsg = false;

  updtWillBoolVar() {
    if (willBoolVar) {
      willBoolVar = false;
      update();
    } else {
      willBoolVar = true;
      update();
    }
  }

  updReqAddMatos(bool dataBool) {
    statusMsg = dataBool;
    print('BOOLEAN : $statusMsg');
    update();
  }

  Future<bool> onWillPop() async {
    return willBoolVar;
  }
}
