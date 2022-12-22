import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});
  final gestionCtrl = Get.put(GestionMatosCtrl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GestionMatosCtrl>(
      init: GestionMatosCtrl(),
      builder: (value) {
        return BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: 0,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.yellowAccent,
          currentIndex: value.bottomNavInd,
          onTap: (int item) => gestionCtrl.bottomNavPage(item),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.feed_rounded),
              label: 'Les matériels',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_rounded),
              label: 'Ajout matériel',
            ),
          ],
        );
      },
    );
  }
}
