import 'package:flutter/material.dart';



class AnimatedAlignWidget extends StatefulWidget {
  @override
  _AnimatedAlignWidgetState createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  Alignment _alignment = Alignment.topLeft; // Initial alignment

  void _toggleAlignment() {
    setState(() {
      // Change alignment when button is pressed
      if (_alignment == Alignment.topLeft) {
        _alignment = Alignment.bottomRight;
      } else {
        _alignment = Alignment.topLeft;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedAlign')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedAlign(
            alignment: _alignment, // The alignment that will animate
            duration: Duration(seconds: 1), // Duration of the animation
            curve: Curves.easeInOut, // Animation curve for smooth movement
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Box',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _toggleAlignment,
            child: Text('Move Box'),
          ),
        ],
      ),
    );
  }
}
