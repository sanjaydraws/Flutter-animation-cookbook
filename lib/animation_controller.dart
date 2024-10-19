


import 'package:flutter/material.dart';



class SizeAnimationWidget extends StatefulWidget {
  @override
  _SizeAnimationWidgetState createState() => _SizeAnimationWidgetState();
}

class _SizeAnimationWidgetState extends State<SizeAnimationWidget> with SingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2), // animation duration
      vsync: this, // provides the TickerProvider for animation updates
    );

    // Define the Tween for size (from 100 to 300)
    _sizeAnimation = Tween<double>(begin: 100, end: 300).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // smooth in/out animation curve
    ));
  }

  @override
  void dispose() {
    // Dispose of the controller when it's no longer needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedBuilder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated builder to rebuild the widget on each animation frame
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: _sizeAnimation.value, // animated width
                  height: _sizeAnimation.value, // animated height
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Animating Size',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Play the animation when the button is pressed
                if (_controller.isAnimating) {
                  _controller.stop(); // Stop if already animating
                } else {
                  _controller.forward(); // Start the animation
                }
              },
              child: Text(_controller.isAnimating ? 'Pause' : 'Start'),
            ),
            ElevatedButton(
              onPressed: () {
                // Reverse the animation when the button is pressed
                _controller.reverse(); // Reverse the animation
              },
              child: Text('Reverse'),
            ),
          ],
        ),
      ),
    );
  }
}
