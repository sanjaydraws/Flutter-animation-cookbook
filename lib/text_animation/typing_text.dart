import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Typing Text Animation')),
        body: Center(child: TypingText()),
      ),
    );
  }
}

class TypingText extends StatefulWidget {
  @override
  _TypingTextState createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  String _text = '';
  final String _fullText = "Typing Text Animation!";
  final int _typingSpeed = 100; // Delay in milliseconds

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    Timer.periodic(Duration(milliseconds: _typingSpeed), (timer) {
      if (_text.length < _fullText.length) {
        setState(() {
          _text += _fullText[_text.length];
        });
      } else {
        timer.cancel(); // Stop once all text is typed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(fontSize: 32, color: Colors.blue),
    );
  }
}
