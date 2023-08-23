import 'dart:math';

import 'package:flutter/material.dart';

class ClockMarkers extends StatelessWidget {
  final int seconds;
  final double radius;
  const ClockMarkers({Key? key, required this.seconds, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey.withOpacity(0.5);
    const width = 2.0;
    const height = 12.0;
    //debugPrint(radius.toString());
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width/2,-height/2,0)
        ..rotateZ(2*pi * (seconds/60))
        ..translate(0.0,radius-height/2,0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
