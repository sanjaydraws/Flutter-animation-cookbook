import 'package:flutter/material.dart';
import 'package:flutter_animation_cookbook/hero/second_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: GestureDetector(
        onTap: () {
          // Navigate to the second screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );
        },
        child: Hero(
          tag: 'hero-tag',  // Must match with the destination Hero
          child: Container(
            width: 50.0,
            height: 50.0,
            // color: Colors.blue,
            child: Center(
              child: Image.network(
                'https://media.istockphoto.com/id/2087206077/photo/two-professionals-engaged-in-a-business-discussion-at-a-modern-office.jpg?s=1024x1024&w=is&k=20&c=DPlizdy9FBtH-N0qP7XnaJsSX2t2UijPF65t93FxmzM=',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

