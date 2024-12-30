import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('LayoutBuilder Example')),
        body: Center(
          child: ResponsiveCard(),
        ),
      ),
    );
  }
}

class ResponsiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Check the width of the available space
        if (constraints.maxWidth > 600) {
          // Large screen layout
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Large Screen Layout',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        } else {
          // Small screen layout
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 150,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Small Screen Layout',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
