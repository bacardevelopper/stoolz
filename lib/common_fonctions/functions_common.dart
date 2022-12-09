// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:stoolz/pages_views/page_connexion/main_connexion.dart';
import 'package:stoolz/pages_views/page_gestion_materiels/main_gestion_materiels.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

List<String> loaderState = ["loading", "loadOk", "loadNotOk"];

final box = GetStorage();

void writeToken(String tokenId) async {
  await box.write('token', tokenId);
}

void writeId(String userName) async {
  await box.write('user_name', userName);
}

String? uri_config = dotenv.env['DOMAINE_LOCAL'];

Map<dynamic, dynamic> uri_step = {
  'create': 'crud/create',
  'read_all': 'crud/read-all/',
  'connexion': 'log/login',
  'auth': 'crud/auth/',
  'read_item': 'crud/read-item/'
};

class NavigationSys {
  NavigationSys();

  void navIn(String pathArg) {
    switch (pathArg) {
      case 'pageGestion':
        Get.to(() => GestionViewCaller());
        break;
      case 'pageLogin':
        Get.to(() => PageConnexion());
        break;
      default:
        break;
    }
  }
}
