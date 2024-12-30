import 'dart:async';  // Required for Timer

import 'package:flutter/material.dart';


class TextCarousel extends StatefulWidget {
  @override
  _TextCarouselState createState() => _TextCarouselState();
}

class _TextCarouselState extends State<TextCarousel> {
  PageController _controller = PageController();
  int _currentPage = 0;

  // Define the list once
  final List<String> texts = [
    "Search for \"Thali\"",
    "Search for \"Pizza\"",
    "Search for \"Biryani\"",
    "Search for \"Sushi\"",
    "Search for \"Pasta\"",
    "Search for \"Burgers\"",
    "Search for \"Samosas\"",
    "Search for \"Paneer Tikka\"",
    "Search for \"Chole Bhature\"",
    "Search for \"Fried Chicken\"",
    "Search for \"Dosas\"",
    "Search for \"Ice Cream\"",
    "Search for \"Noodles\"",
    "Search for \"Cakes\"",
    "Search for \"Salads\"",
    "Search for \"Sandwiches\"",
    "Search for \"Tacos\"",
    "Search for \"Coffee\"",
    "Search for \"Vegan Wraps\"",
    "Search for \"Fried Fish\"",
  ];

  @override
  void initState() {
    super.initState();
    // Auto-scroll functionality
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < texts.length - 1) {
        _controller.animateToPage(_currentPage + 1,
            duration: Duration(seconds: 1), curve: Curves.easeInOut);
      } else {
        _controller.animateToPage(0,
            duration: Duration(seconds: 1), curve: Curves.easeInOut);
      }
      setState(() {
        _currentPage = (_currentPage + 1) % texts.length;  // Reset to 0 after the last page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50, // Adjust the height of the carousel
            width: double.infinity, // Container takes full width
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20), // Round the corners
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Ensures column only takes necessary space
              children: [
                // Container for icons
                Padding(
                  padding: EdgeInsets.zero,  // Removes the padding
                  child: IconButton(
                    icon: Icon(Icons.search, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    scrollDirection: Axis.vertical, // Set scroll direction to vertical
                    itemCount: texts.length,
                    physics: NeverScrollableScrollPhysics(), // Prevent manual scrolling
                    itemBuilder: (context, index) {
                      return Container(
                        child: Align(
                          alignment: Alignment.centerLeft, // Align to the top-left corner
                          child: Text(
                            texts[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                            ),
                            textAlign: TextAlign.start, // Align text to the start (left)
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: 1,
                  height: 20, // or use MediaQuery.of(context).size.height / your_scale_factor if needed
                  color: Colors.grey.shade400,
                ),
                Padding(
                  padding: EdgeInsets.zero,  // Removes the padding
                  child: IconButton(
                    icon: Icon(Icons.mic, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
