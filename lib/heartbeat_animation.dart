import 'package:flutter/material.dart';



class HeartbeatIconWidget extends StatefulWidget {
  @override
  _HeartbeatIconWidgetState createState() => _HeartbeatIconWidgetState();
}

class _HeartbeatIconWidgetState extends State<HeartbeatIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(milliseconds: 500), // animation duration
      vsync: this, // provides the TickerProvider for animation updates
    );

    // Define the Tween for scale (from 1.0 to 1.2 and back)
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when it's no longer needed
    _controller.dispose();
    super.dispose();
  }

  void _animateHeartbeat() {
    // Reset the controller and start the animation
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heartbeat Icon Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _animateHeartbeat, // Trigger the heartbeat animation on tap
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value, // Apply the scale animation
                child: Icon(
                  Icons.favorite, // Heartbeat icon
                  size: 50,
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
