import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HeaderOnScroll(),
      ),
    );
  }
}

class HeaderOnScroll extends StatefulWidget {
  @override
  _HeaderOnScrollState createState() => _HeaderOnScrollState();
}

class _HeaderOnScrollState extends State<HeaderOnScroll> {
  ScrollController _scrollController = ScrollController();
  bool _isHeaderVisible = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // Detect if user is scrolling up or down
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isHeaderVisible) {
          setState(() {
            _isHeaderVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isHeaderVisible) {
          setState(() {
            _isHeaderVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 200,
          pinned: true,
          floating: false,
          snap: false,
          // flexibleSpace: FlexibleSpaceBar(
          //   title: Text('Header'),
          //   background: Container(
          //     color: Colors.blue,
          //   ),
          // ),
          flexibleSpace: _isHeaderVisible
              ? FlexibleSpaceBar(
            title: Text('Visible Header'),
            background: Container(
              color: Colors.blue,
            ),
          )
              : null,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return ListTile(
                title: Text('Item #$index'),
              );
            },
            childCount: 50,
          ),
        ),
      ],
    );
  }
}
