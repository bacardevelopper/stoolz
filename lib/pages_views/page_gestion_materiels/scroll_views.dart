// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoolz/common_widgets/loader_anim.dart';
import 'package:stoolz/pages_views/page_gestion_materiels/view_materiel.dart';
import 'package:stoolz/request/main_request_crud.dart';
import 'package:stoolz/states_controllers/ctrl_gestionMatos.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// --

class ScrollMateriels extends StatelessWidget {
  final gestionCtrl = Get.put(GestionMatosCtrl());

  @override
  Widget build(BuildContext context) {
    return feedMateriels(context);
  }

// ScrollMateriels() or LoaderAnim()
  Widget feedMateriels(BuildContext context) {
    return GetBuilder<GestionMatosCtrl>(
      init: GestionMatosCtrl(),
      builder: (value) {
        if (value.getAllMatosLoad == false) {
          return Center(
            child: LoaderAnim(),
          );
        } else {
          return ListView.builder(
            itemCount: value.listeWithCheck.length,
            itemBuilder: (BuildContext context, int index) {
              return slidableView(index, value.listeWithCheck[index], context);
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
            onPressed: (context) {
              supprimerMatos(index);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'supprimer',
          ),
        ],
      ),
      child: ViewMateriel(
        data: data,
        index: index,
      ),
    );
  }

  supprimerMatos(int index) {
    gestionCtrl.deleteMat(index);
  }
}

// Mon Wrapper
// config

class _ScrollMatWrapperState extends State<ScrollMatWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class ScrollMatWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;

  const ScrollMatWrapper({required this.onInit, required this.child});
  @override
  _ScrollMatWrapperState createState() => _ScrollMatWrapperState();
}

class ScrollMatCaller extends StatelessWidget {
  var reqGestion = MainRequestCrud();

  @override
  Widget build(BuildContext context) {
    return ScrollMatWrapper(
      onInit: () {
        _getThingsOnStartup().then((value) {
          reqGestion.getAllMateriels();
        });
      },
      child: ScrollMateriels(),
    );
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
