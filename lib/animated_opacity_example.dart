import 'package:flutter/material.dart';


class OpacityAnimationWidget extends StatefulWidget {
  @override
  _OpacityAnimationWidgetState createState() =>
      _OpacityAnimationWidgetState();
}

class _OpacityAnimationWidgetState extends State<OpacityAnimationWidget> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedOpacity')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Animated Opacity"),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              // child: Visibility(
              //   visible: _isVisible,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Hello, World!',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  // ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleVisibility,
              child: Text(_isVisible ? 'Hide' : 'Show'),
            ),
          ],
        ),
      ),
    );
  }
}
