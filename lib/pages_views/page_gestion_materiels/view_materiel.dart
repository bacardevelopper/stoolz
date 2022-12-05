// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

Map dataRes = {};

class ViewMateriel extends StatelessWidget {
  ViewMateriel({Key? key, required this.data}) : super(key: key);
  Map data;
  var radiusVar = BorderRadius.circular(14);
  @override
  Widget build(BuildContext context) {
    var widthVar = MediaQuery.of(context).size.width / 1.05;
    // --- le build
    return Center(
      child: SizedBox(
        width: widthVar,
        height: 100.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: radiusVar,
            color: Colors.white,
          ),
          child: rowOfWidget(data),
        ),
      ),
    );
  }

  double sizeSideBox = 150.0;
  
  Widget rowOfWidget(Map data) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconRow(data),
          clmOfData(data),
          checkBox(true, 0),
        ],
      ),
    );
  }

  Widget iconRow(Map data) {
    return Container(
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
    );
  }

  Column clmOfData(Map data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textOfTitle("PC portable 05"),
        positionArg("Ongojou"),
        textOfPres("disponible"),
        textOfPres("darwin"),
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
              fontSize: 15.0,
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
              fontSize: 13.0,
            ),
          )
        ],
      ),
    );
  }

  Widget positionArg(String data) {
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
          Icon(
            Icons.location_on,
            size: 18.0,
          )
        ],
      ),
    );
  }

  Widget checkBox(bool data, int index) {
    return Checkbox(
      checkColor: Colors.white,
      activeColor: Colors.black,
      value: data,
      side: BorderSide(color: Colors.white, width: 5),
      onChanged: (bool? value) {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
