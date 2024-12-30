import 'package:flutter/material.dart';

import '../app_colors.dart';


class PinnedHeaderWithTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Pinned Header',
                  style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Parallax background
                    Image.network(
                      'https://images.unsplash.com/photo-1465513527097-544020a68b06?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      fit: BoxFit.cover,
                    ),
                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(

          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    'Item ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('This is a creative description.'),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey.shade700),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PinnedHeaderWithSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 250.0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Parallax background
                    Image.network(
                      'https://images.unsplash.com/photo-1465513527097-544020a68b06?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      fit: BoxFit.cover,
                    ),
                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
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
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 8,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  'Item ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('This is a creative description.'),
                trailing: Icon(Icons.chevron_right, color: Colors.grey.shade700),
              ),
            );
          },
        ),
      ),
    );
  }
}




class PinnedHeaderWithImageAndHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // Pinned Search Bar
            SliverAppBar(
              backgroundColor: yellow,
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
                child: Image.asset (
                  'assets/images/banner_img.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // Pinned Horizontal List
            SliverPersistentHeader(
              pinned: true,
              delegate: HorizontalListDelegate(),
            ),

          ];
        },
        body: feature_foods_list(),
      ),
    );
  }

  Widget feature_foods_list() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Center align image and text
            children: [
              // Image for food item
              Container(
                width: double.infinity, // Makes image stretch to available width
                height: 150.0, // Set the height of the image
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
              const SizedBox(height: 8.0), // Space between image and title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Food Item ${index + 1}', // Dynamic food name
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 4.0), // Space between title and subtitle
              const Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16,bottom: 15),
                child: Text(
                  'This is a creative description.',
                  textAlign: TextAlign.center, // Center align the description
                  style: TextStyle(color: Colors.grey),
                ),
              ),

            ],
          ),
        );
      },
    );
  }

}



// Delegate for Horizontal List
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
        itemCount: 10, // Adjust as needed
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = index == selectedIndex; // Check if this item is selected

          return GestureDetector(
            onTap: () {
              // Update selectedIndex when an item is tapped
              selectedIndex = index;
              (context as Element).markNeedsBuild(); // Rebuild the widget
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ensures column only takes necessary space
                children: [
                  // Image for food item
                  Container(
                    width: 70.0, // Set the size of the image
                    height: 70.0, // Set the size of the image
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://media.istockphoto.com/id/466149291/photo/italian-pizza-with-cherry-tomatoes.webp?a=1&b=1&s=612x612&w=0&k=20&c=KFGQZWsPTLxt8Sp5SQGJlNOuLA1_5GorNEFtZy-cuU4='),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  const SizedBox(height: 8.0), // Space between image and text
                  Text(
                    'Food ${index + 1}', // Dynamic food name
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Bottom border that is highlighted red for the selected item
                  Container(
                    width: 70,
                    height: 4.0, // Bottom line height
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.red : Colors.transparent, // Red bottom line for selected item
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0), // Round the top-left corner
                        topRight: Radius.circular(8.0), // Round the top-right corner
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
  double get maxExtent => 102.0;
  @override
  double get minExtent => 102.0;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true; // Rebuild on state change
}

