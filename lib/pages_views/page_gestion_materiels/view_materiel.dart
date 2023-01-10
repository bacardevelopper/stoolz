// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_fonctions/functions_common.dart';
import 'package:stoolz/request/main_request_crud.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';

final navGestion = new NavigationSys();
final reqCrud = new MainRequestCrud();

class ViewMateriel extends StatelessWidget {
  ViewMateriel({Key? key, required this.data, required this.index})
      : super(key: key);
  Map data;
  int index;
  var radiusVar = BorderRadius.circular(14);
  final ctrlGestion = Get.put(GestionMatosCtrl());

  @override
  Widget build(BuildContext context) {
    var widthVar = MediaQuery.of(context).size.width / 1.05;
    // --- le build
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
      child: InkWell(
        child: Center(
          child: SizedBox(
            width: widthVar,
            height: 100.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: radiusVar,
                color: (data["disponible"]) ? Colors.white : Colors.red,
              ),
              child: rowOfWidget(data, index),
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  double sizeSideBox = 150.0;

  Widget rowOfWidget(Map data, int index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconRow(data),
          clmOfData(data),
          checkBox(data["check"], index),
        ],
      ),
    );
  }

  Widget iconRow(Map data) {
    return InkWell(
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: radiusVar,
          color: Colors.black,
        ),
        child: const Center(
          child: Icon(
            Icons.laptop,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      onTap: () {
        print(data["_id"]);
        reqCrud.getMateriel(data["_id"]);
        navGestion.navIn('pageMateriel');
      },
    );
  }

  Column clmOfData(Map data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        textOfTitle(data['nom']),
        positionArg(data['lieu'], true),
        positionArg(data['avis'], false),
      ],
    );
  }

  Widget textOfTitle(String data) {
    return SizedBox(
      width: sizeSideBox,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }

  Widget textOfPres(String data) {
    return SizedBox(
      width: sizeSideBox,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15.0,
            ),
          )
        ],
      ),
    );
  }

  Widget positionArg(String data, bool afficheIcon) {
    return SizedBox(
      width: sizeSideBox,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
          ),
          (afficheIcon)
              ? Icon(
                  Icons.location_on,
                  size: 18.0,
                )
              : Container()
        ],
      ),
    );
  }

  Widget checkBox(bool data, int index) {
    return GetBuilder<GestionMatosCtrl>(
      init: GestionMatosCtrl(),
      builder: (value) {
        return Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.black,
          value: data,
          side: BorderSide(color: Colors.black, width: 1),
          onChanged: (bool? value) {
            ctrlGestion.checkOrnot(index);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        );
      },
    );
  }
}
