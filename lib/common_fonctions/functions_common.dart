// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:stoolz/pages_views/page_connexion/main_connexion.dart';
import 'package:stoolz/pages_views/page_gestion_materiels/main_gestion_materiels.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stoolz/pages_views/page_materiel/page_materiel.dart';
import 'package:stoolz/pages_views/page_scan_qr/main_scan_qr.dart';

List<String> loaderState = ["loading", "loadOk", "loadNotOk"];

final box = GetStorage();

void writeToken(String tokenId) async {
  await box.write('token', tokenId);
}

Future getStrToken() async {
  try {
    String token = box.read("token").toString();
    return token;
  } catch (e) {
    return '';
  }
}

void writeId(String userName) async {
  await box.write('user_name', userName);
}

String? uri_config = dotenv.env['DOMAINE_LOCAL'];

Map<dynamic, dynamic> uri_step = {
  'create': 'crud/create',
  'read_all': 'crud/read-all/',
  'delete_one': 'crud/delete/',
  'delete_many': 'crud/delete-many',
  'connexion': 'log/login',
  'auth': 'crud/auth/',
  'read_item': 'crud/read-item/'
};

class NavigationSys {
  NavigationSys();

  void navIn(String pathArg, {id}) {
    switch (pathArg) {
      case 'pageGestion':
        Get.to(() => GestionViewCaller());
        break;
      case 'pageLogin':
        Get.to(() => PageConnexion());
        break;
      case 'pageMateriel':
        Get.to(() => PageMateriel());
        break;
      case 'qrCodePage':
        Get.to(() => QrcodeScannerTool());
        break;
      default:
        break;
    }
  }
}
