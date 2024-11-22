import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true; // Tracks which side is currently visible

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3D Flip Card Animation')),
      body: Center(
        child: GestureDetector(
          onTap: _flipCard,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final isFlipped = _animation.value > 0.5;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // Perspective effect
                  ..rotateY(_animation.value * 3.1415926), // Rotate on Y-axis
                child: isFlipped
                    ? _buildCardBack() // Back side of the card
                    : _buildCardFront(), // Front side of the card
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCardFront() {
    return _buildCard(
      color: Colors.blue,
      content: 'Front Side',
    );
  }

  Widget _buildCardBack() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(3.1415926), // Rotate 180° for back side
      child: _buildCard(
        color: Colors.red,
        content: 'Back Side',
      ),
    );
  }

  Widget _buildCard({required Color color, required String content}) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 2)),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        content,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
