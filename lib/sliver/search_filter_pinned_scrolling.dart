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
            _isScrollingUp = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isScrollingUp) {
          setState(() {
            _isScrollingUp = true;
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
  double get maxExtent => 200.0; // Height of the filter when expanded

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
  runApp(MaterialApp(
    home: PinnedHeaderWithImageAndHorizontalList(),
  ));
}

class PinnedHeaderWithImageAndHorizontalList extends StatefulWidget {
  const PinnedHeaderWithImageAndHorizontalList({super.key});

  @override
  State<PinnedHeaderWithImageAndHorizontalList> createState() => _PinnedHeaderWithImageAndHorizontalListState();
}

class _PinnedHeaderWithImageAndHorizontalListState extends State<PinnedHeaderWithImageAndHorizontalList> {

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          // Pinned Search Bar
          SliverAppBar(
            backgroundColor: Colors.pink,
            pinned: true,
            expandedHeight: 100.0,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.purple.shade300),
                      prefixIcon: Icon(Icons.search, color: Colors.purple),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              centerTitle: true,
            ),
          ),
          // Image that scrolls
          SliverToBoxAdapter(
            child: Container(
              height: 200.0,
              child: Image.network(
                'https://images.unsplash.com/photo-1533910534207-90f31029a78e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJhbm5lciUyMGhhcHB5JTIwY2FrZSUyMGRheXxlbnwwfHwwfHx8MA%3D%3D',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Pinned Horizontal List
          SliverPersistentHeader(
            pinned: true,
            delegate: HorizontalListDelegate(),
          ),
          SliverAppBar(
            backgroundColor: Colors.pink,
            pinned: true,
            expandedHeight: 100,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (builder,context){
                  return Text("Hello");
                }),
              )
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image for food item
                      Container(
                        width: double.infinity,
                        height: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://media.istockphoto.com/id/153985988/photo/pepperoni-pizza-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=_0Ceh6ANSSYmgoG3U7tUXV4dCUTTmJx9L9zOEbliZeE=',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Food Item ${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0,right: 16,bottom: 15),
                        child: Text(
                          'This is a creative description.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalListDelegate extends SliverPersistentHeaderDelegate {
  // Variable to track the selected index
  int selectedIndex = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              (context as Element).markNeedsBuild();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image for food item
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://media.istockphoto.com/id/466149291/photo/italian-pizza-with-cherry-tomatoes.webp?a=1&b=1&s=612x612&w=0&k=20&c=KFGQZWsPTLxt8Sp5SQGJlNOuLA1_5GorNEFtZy-cuU4='),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Food ${index + 1}',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Bottom border for selected item
                  Container(
                    width: 100,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.red : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 132.0;
  @override
  double get minExtent => 132.0;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
