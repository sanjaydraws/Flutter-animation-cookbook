import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('3D Card Rotation')),
        body: Center(child: RotatingCard()),
      ),
    );
  }
}

class RotatingCard extends StatefulWidget {
  @override
  _RotatingCardState createState() => _RotatingCardState();
}

class _RotatingCardState extends State<RotatingCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationX;
  late Animation<double> _rotationY;
  late Animation<double> _rotationZ;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _rotationX = Tween(begin: 0.0, end: 3.14159).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _rotationY = Tween(begin: 0.0, end: 3.14159).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _rotationZ = Tween(begin: 0.0, end: 3.14159).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationX(_rotationX.value)
              ..rotateY(_rotationY.value)
              ..rotateZ(_rotationZ.value),
            alignment: Alignment.center,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: 200,
                height: 300,
                color: Colors.blue,
                child: Center(child: Text('3D Rotation', style: TextStyle(color: Colors.white))),
              ),
            ),
          );
        },
      ),
    );
  }
}
