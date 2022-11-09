// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:stoolz/pages_views/page_connexion/main_connexion.dart';
import 'package:stoolz/pages_views/page_gestion_materiels/main_gestion_materiels.dart';

List<String> loaderState = ["loading", "loadOk", "loadNotOk"];

final box = GetStorage();
const String uri_config = 'https://app-backend-matos.herokuapp.com/';

Map<dynamic, dynamic> uri_step = {
  'create': 'crud/create',
  'all': 'crud/read-all',
  'connexion': 'log/login',
  'auth': 'crud/read-all/',
  'read_item': 'crud/read-item/'
};

Future getToken() async {
  var token = box.read('user_token');
  return token;
}

class NavigationSys {
  NavigationSys();
  dynamic navIn(String path) {
    switch (path) {
      case 'pageGestion':
        Get.to(PageGestion());
        break;
      case 'pageLogin':
        Get.to(PageConnexion());
        break;
    }
  }
}
