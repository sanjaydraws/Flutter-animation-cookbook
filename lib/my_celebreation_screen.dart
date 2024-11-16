import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class MyCelebrationScreen extends StatefulWidget {
  @override
  _MyCelebrationScreenState createState() => _MyCelebrationScreenState();
}

class _MyCelebrationScreenState extends State<MyCelebrationScreen> {
  late ConfettiController _confettiController;
  late Timer _directionTimer;
  bool _isButtonEnabled = true;
  int _directionIndex = 0;

  Alignment _confettiAlignment = Alignment.topCenter;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 30));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _directionTimer.cancel();
    super.dispose();
  }

  void _startConfetti() {
    setState(() {
      _isButtonEnabled = false;
    });

    _confettiController.play();

    _directionTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _directionIndex = (_directionIndex + 1) % 4;
        _confettiAlignment = _getAlignmentForDirection(_directionIndex);
      });
    });

    Timer(Duration(seconds: 30), () {
      _confettiController.stop();
      _directionTimer.cancel();

      setState(() {
        _isButtonEnabled = true;
      });
    });
  }

  double get _blastDirection {
    switch (_directionIndex) {
      case 0:
        return -pi / 2; // Up
      case 1:
        return 0; // Right
      case 2:
        return pi / 2; // Down
      case 3:
        return pi; // Left
      default:
        return 0;
    }
  }

  Alignment _getAlignmentForDirection(int directionIndex) {
    switch (directionIndex) {
      case 0:
        return Alignment.bottomCenter; // Confetti blasts upwards
      case 1:
        return Alignment.centerLeft; // Confetti blasts right
      case 2:
        return Alignment.topCenter; // Confetti blasts downwards
      case 3:
        return Alignment.centerRight; // Confetti blasts left
      default:
        return Alignment.topCenter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Celebrate!")),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _isButtonEnabled ? _startConfetti : null,
              child: Text("Celebrate!"),
            ),
          ),
          Align(
            alignment: _confettiAlignment,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: _blastDirection,
              emissionFrequency: 0.05,
              numberOfParticles: 100,
              gravity: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
