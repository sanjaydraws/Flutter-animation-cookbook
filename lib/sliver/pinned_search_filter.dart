import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../app_colors.dart';

class FilterPinnedListView extends StatefulWidget {
  @override
  _FilterPinnedListViewState createState() => _FilterPinnedListViewState();
}

class _FilterPinnedListViewState extends State<FilterPinnedListView> {
  ScrollController _scrollController = ScrollController();
  bool _isScrollingUp = false;

  @override
  void initState() {
    super.initState();

    // Listen to scroll events
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        // Scrolling down
        if (_isScrollingUp) {
          setState(() {
            _isScrollingUp = false; // Hide the filter when scrolling down
          });
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        // Scrolling up
        if (!_isScrollingUp) {
          setState(() {
            _isScrollingUp = true; // Show the filter when scrolling up
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
    return Scaffold(
      appBar: AppBar(title: Text('Pinned Filter Example')),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // SliverPersistentHeader for the filter, only visible when scrolling up
          SliverPersistentHeader(
            pinned: _isScrollingUp,  // Pin only when scrolling up
            delegate: _FilterHeaderDelegate(),
          ),
          // SliverList for the 200 items
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item ${index + 1}'),
                );
              },
              childCount: 200,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 80.0; // Height of the filter when collapsed
  @override
  double get maxExtent => 110.0; // Height of the filter when expanded

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      child: SingleChildScrollView(  // Wrap in SingleChildScrollView to prevent overflow
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Filter Title', style: TextStyle(color: Colors.white)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search filter...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false; // No need to rebuild if the state doesn't change
  }
}

void main() {
  runApp(MaterialApp(home: FilterPinnedListView()));
}
