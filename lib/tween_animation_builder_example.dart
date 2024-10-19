
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleOpacityAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tween Animation"),),
      body: Center(
        child: Column(
          children:[
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0), // Opacity range
              duration: Duration(seconds: 2),     // Animation duration
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,                 // Animate the opacity value
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                );
              },
            ),
            SizedBox(height: 23),
            ColorTransition(),
            SizedBox(height: 23),
            ScaleAnimation(),
            SizedBox(height: 23),
            RotationAnimation(),
            SizedBox(height: 23),
            CombinedAnimation()
          ]
        ),
      ),
    );
  }
}

class ColorTransition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(begin: Colors.red, end: Colors.green), // Color range
        duration: Duration(seconds: 3),                          // Animation duration
        builder: (context, value, child) {
          return Container(
            width: 80,
            height: 80,
            color: value,                                        // Animated color
          );
        },
      ),
    );
  }
}
class ScaleAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 50.0, end: 200.0),     // Scale range
        duration: Duration(seconds: 2),            // Animation duration
        builder: (context, value, child) {
          return Container(
            width: value,                          // Animated width
            height: value,                         // Animated height
            color: Colors.purple,
          );
        },
      ),
    );
  }
}
class RotationAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 360.0),         // Rotation angle in degrees
        duration: Duration(seconds: 3),               // Animation duration
        builder: (context, value, child) {
          return Transform.rotate(
            angle: value * 3.1416 / 180,              // Convert degrees to radians
            child: child,
          );
        },
        child: Container(
            width: 80,
            height: 80, color: Colors.blue),
      ),
    );
  }
}
class CombinedAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: -100.0, end: 100.0),      // Position range
        duration: Duration(seconds: 2),
        builder: (context, positionValue, child) {
          return Transform.translate(
            offset: Offset(positionValue, 0),         // Horizontal movement
            child: TweenAnimationBuilder<Color?>(
              tween: ColorTween(begin: Colors.red, end: Colors.green),
              duration: Duration(seconds: 2),         // Same duration for color transition
              builder: (context, colorValue, child) {
                return Container(
                  width: 80,
                  height: 80,
                  color: colorValue,                  // Animated color
                );
              },
            ),
          );
        },
      ),
    );
  }
}
