// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_widgets/loader_anim.dart';
import 'package:stoolz/pages_views/page_gestion_materiels/view_materiel.dart';
import 'package:stoolz/request/main_request_crud.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// --

class ScrollMateriels extends StatelessWidget {
  var reqGestion = MainRequestCrud();

  @override
  Widget build(BuildContext context) {
    reqGestion.getAllMateriels();
    return feedMateriels(context);
  }

// ScrollMateriels() or LoaderAnim()
  Widget feedMateriels(BuildContext context) {
    return GetBuilder(
      init: GestionMatosCtrl(),
      builder: (value) {
        if (value.getAllMatosLoad == false) {
          return Center(
            child: LoaderAnim(),
          );
        } else {
          return ListView.builder(
            itemCount: value.sizeListe,
            itemBuilder: (BuildContext context, int index) {
              return slidableView(index, value.listeMateriels[index], context);
            },
          );
        }
      },
    );
  }

  Widget slidableView(int index, Map data, BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: supprimerMatos(context, index),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'supprimer',
          ),
        ],
      ),
      child: ViewMateriel(
        data: data,
      ),
    );
  }

  supprimerMatos(BuildContext context, int id) {}
}

// ViewMateriel(data: value.listeMateriels[index])