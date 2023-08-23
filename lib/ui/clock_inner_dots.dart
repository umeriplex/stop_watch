import 'dart:math';

import 'package:flutter/material.dart';

class ClockInnerDots extends StatelessWidget {
  final double radius;
  const ClockInnerDots({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 12.0;
    const height = 12.0;
    //debugPrint(radius.toString());
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width/2,-height/2,0)
        ..rotateZ(0),

      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
