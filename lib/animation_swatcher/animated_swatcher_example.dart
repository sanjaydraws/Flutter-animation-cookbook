import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  @override
  _AnimatedSwitcherExampleState createState() => _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool _isFirst = true;

  void _toggle() {
    setState(() {
      _isFirst = !_isFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedSwitcher Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedSwitcher widget
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _isFirst
                  ? Container(
                key: ValueKey(1),
                width: 100,
                height: 100,
                color: Colors.blue,
              )
                  : Container(
                key: ValueKey(2),
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggle,
              child: Text('Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}

