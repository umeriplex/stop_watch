import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_inner_dots.dart';

import 'clock_hand.dart';
import 'clock_markers.dart';
import 'clock_mints.dart';
import 'elapsed_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer({Key? key, required this.elapsed, required this.radius}) : super(key: key);
  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    //debugPrint(radius.toString());
    return Stack(
      children: [
        for(int i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockMarkers(
              seconds: i,
              radius: radius,
            ),
          ),

        for(int i = 5; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockMints(
              value: i,
              maxValue: 60,
              radius: radius,
            ),
          ),

        Positioned(
          left: radius,
          top: radius,
          child: ClockInnerDots(
            radius: radius,
          ),
        ),

        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            handThickness: 2,
            handLength: radius,
            handColor: Colors.white,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}





