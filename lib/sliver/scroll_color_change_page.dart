import 'package:flutter/material.dart';

class ScrollColorChangePage extends StatefulWidget {
  @override
  _ScrollColorChangePageState createState() => _ScrollColorChangePageState();
}

class _ScrollColorChangePageState extends State<ScrollColorChangePage> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Transition from yellow to white based on scroll position
    Color scaffoldBackgroundColor = Color.lerp(Colors.green, Colors.white, (_scrollPosition / 300).clamp(0.0, 1.0)) ?? Colors.green;
    Color appBarBackgroundColor = Color.lerp(Colors.green, Colors.white, (_scrollPosition / 300).clamp(0.0, 1.0)) ?? Colors.green;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor, // Set the Scaffold background color
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: appBarBackgroundColor, // Set the AppBar background color
          title: Text("Scroll to Change Color"),
          // floating: true,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Scroll to Change Color"),
              background: Container(color: appBarBackgroundColor),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  height: 100.0,
                  color: Colors.grey[200],
                  child: Center(child: Text("Item $index")),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}

