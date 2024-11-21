import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BouncingScrollExample());
  }
}

class BouncingScrollExample extends StatelessWidget {
  const BouncingScrollExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bouncing Scroll Animation')),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
    );
  }
}
