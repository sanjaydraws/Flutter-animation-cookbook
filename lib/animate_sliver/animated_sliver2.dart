import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,  // Keeps the header visible at the top when scrolling
              delegate: MySliverHeaderDelegate(),
            ),

          SliverList(
              delegate: SliverChildListDelegate([
                // List items
                for (var i = 0; i < 30; i++) ListTile(title: Text('Item $i')),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 100.0;
  @override
  double get maxExtent => 200.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double opacity = (1 - shrinkOffset / maxExtent);
    return Opacity(
      opacity: opacity,
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            'Animated Header',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
