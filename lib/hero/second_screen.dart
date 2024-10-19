import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Hero(
        tag: 'hero-tag',  // Must match with the source Hero
        child: Container(
          width: double.infinity,
          height: 300.0,
          // color: Colors.blue,
          child: Center(
            child:  Image.network(
              'https://media.istockphoto.com/id/2087206077/photo/two-professionals-engaged-in-a-business-discussion-at-a-modern-office.jpg?s=1024x1024&w=is&k=20&c=DPlizdy9FBtH-N0qP7XnaJsSX2t2UijPF65t93FxmzM=',
            ),
          ),
        ),
      ),
    );
  }
}
