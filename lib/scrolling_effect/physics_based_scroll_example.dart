import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PhysicsBasedScrollExample());
  }
}

class PhysicsBasedScrollExample extends StatefulWidget {
  const PhysicsBasedScrollExample({super.key});

  @override
  State<PhysicsBasedScrollExample> createState() => _PhysicsBasedScrollExampleState();
}

class _PhysicsBasedScrollExampleState extends State<PhysicsBasedScrollExample> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);
  }

  void animateScroll() {
    _animationController.reset();
    _animationController.forward();
    _scrollController.animateTo(
      300, // Target position
      duration: const Duration(seconds: 1),
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Physics-Based Scroll Animation')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: animateScroll,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
