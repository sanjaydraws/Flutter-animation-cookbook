import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Rotating Text Animation')),
        body: Center(child: RotatingText()),
      ),
    );
  }
}

class RotatingText extends StatefulWidget {
  @override
  _RotatingTextState createState() => _RotatingTextState();
}

class _RotatingTextState extends State<RotatingText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _rotation = Tween(begin: 0.0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true); // Repeating the animation
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotation.value,
          child: Text(
            'Rotating Text',
            style: TextStyle(fontSize: 32, color: Colors.red),
          ),
        );
      },
    );
  }
}
