// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class LoaderAnim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return animLoader();
  }

  Widget animLoader() {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: widgetLoop,
          ),
        );
      },
    );
  }

  var widgetLoop = LoopAnimationBuilder<Color?>(
    // mandatory parameters
    tween: ColorTween(begin: Colors.black, end: Colors.grey),
    duration: const Duration(seconds: 5),
    builder: (context, value, child) {
      double widthArg = MediaQuery.of(context).size.width;
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        width: widthArg / 1.1,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14), color: value),
                  )
                ],
              ),
              Container(
                width: 20.0,
              ),
              Container(
                width: (widthArg / 2.5),
                height: 90.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: (widthArg / 2.8),
                          height: 15.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: value,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: (widthArg / 4),
                          height: 15.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: value,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
    // optional parameters
    curve: Curves.fastOutSlowIn,
  );
}
