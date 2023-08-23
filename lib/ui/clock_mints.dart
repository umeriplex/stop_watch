import 'dart:math';

import 'package:flutter/material.dart';

class ClockMints extends StatelessWidget {
  const ClockMints({Key? key, required this.value, required this.radius, required this.maxValue}) : super(key: key);
  final int value;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = value % 5 == 0 ? Colors.white : Colors.grey.withOpacity(0.5);
    const width = 28.0;
    const height = 28.0;
    //debugPrint(radius.toString());
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width/2,-height/2,0)
        ..rotateZ(2*pi * (value/maxValue))
        ..translate(0.0,-(radius/100)*82,0)
      ,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateZ(-2*pi * (value/60)),
        child: Container(
          width: width,
          height: height,
          child: Center(
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
