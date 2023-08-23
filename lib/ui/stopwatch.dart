import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/reset_button.dart';
import 'package:stopwatch_flutter/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/ui/stop_watch_renderer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> with SingleTickerProviderStateMixin{

  late final Ticker _ticker;
  Duration _prevElapsed = Duration.zero;
  Duration _currentElapsed = Duration.zero;
  Duration get elapsed => _prevElapsed + _currentElapsed;

  @override
  void initState() {
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _currentElapsed = elapsed;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onStartStopPressed() {
    if (_ticker.isTicking) {
      _ticker.stop();
      _prevElapsed += _currentElapsed;
      _currentElapsed = Duration.zero;
    } else {
      _ticker.start();
    }
    setState(() {});
  }

  void _onResetPressed() {
    _ticker.stop();
    _prevElapsed = Duration.zero;
    _currentElapsed = Duration.zero;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var radius = constraints.maxWidth/2;
        return Stack(
          children: [
            StopWatchRenderer(
              elapsed: elapsed,
              radius: radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: (){
                    _onResetPressed();
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  isRunning: _ticker.isTicking,
                  onPressed: (){
                    _onStartStopPressed();
                  },
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
