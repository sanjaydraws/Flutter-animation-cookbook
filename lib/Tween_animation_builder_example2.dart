




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BouncingBox extends StatefulWidget {
  @override
  _BouncingBoxState createState() => _BouncingBoxState();
}

class _BouncingBoxState extends State<BouncingBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the controller with a duration of 4 seconds
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(); // Repeats the animation forever

    // X-axis animation: Move top center -> right center -> left center -> right center
    _xAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.5, end: 1.0), weight: 1), // Move to the right center
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.5), weight: 1), // Stay on the right center
      TweenSequenceItem(tween: Tween(begin: 0.5, end: 0.0), weight: 1), // Move to the left center
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.5), weight: 1), // Stay on the left center
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    // Y-axis animation: Move top center -> bottom center -> top center
    _yAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1), // Move down to the bottom center
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1), // Move back up to the top center
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final boxSize = 80.0;  // Size of the animated box

    return Scaffold(
      appBar: AppBar(title: Text("Bouncing Box")),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Map the animation value to the box's position
          final xPos = _xAnimation.value * (screenWidth - boxSize); // X-axis position
          final yPos = _yAnimation.value * (screenHeight - boxSize - 80); // Y-axis position

          return Transform.translate(
            offset: Offset(xPos, yPos),
            child: Container(
              width: boxSize,
              height: boxSize,
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
