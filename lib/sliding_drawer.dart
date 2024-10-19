import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RotateContainer extends StatefulWidget {
  @override
  _RotateContainerState createState() => _RotateContainerState();
}

class _RotateContainerState extends State<RotateContainer> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
      // repeat: true, // Repeats indefinitely
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * 3.1416).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rotate container"),),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}

