import 'package:flutter/material.dart';

class StaggeredAnimationDemo extends StatefulWidget {
  @override
  _StaggeredAnimationDemoState createState() => _StaggeredAnimationDemoState();
}

class _StaggeredAnimationDemoState extends State<StaggeredAnimationDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstAnimation;
  late Animation<double> _secondAnimation;
  late Animation<double> _thirdAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // Define animations with staggered intervals
    _firstAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.bounceIn),// animation runs during the first 50% of the controller's timeline.
      ),
    );

    _secondAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75, curve: Curves.easeInOut),//animation runs between 50% and 75% of the controller's total time.
      ),
    );

    _thirdAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut),//This animation runs during the last 25% of the timeline.
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Staggered Animation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _firstAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, 50 * (1 - _firstAnimation.value)),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Second Animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _secondAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, 50 * (1 - _secondAnimation.value)),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Third Animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _thirdAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, 50 * (1 - _thirdAnimation.value)),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

