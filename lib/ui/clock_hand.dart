import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color handColor;
  const ClockHand({Key? key, required this.rotationZAngle, required this.handThickness, required this.handLength, required this.handColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
      ..rotateZ(rotationZAngle)
      ..translate(-handThickness/2, 0, 0)
      ,
      child: Container(
        height: handLength,
        width: handThickness,
        color: handColor,
      ),
    );
  }
}
