



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_cookbook/sliver/pinned_header_with_title.dart';
import 'package:flutter_animation_cookbook/sliver/pinned_header_with_images.dart';
import 'package:flutter_animation_cookbook/sliver/pinned_search_filter.dart';
import 'package:flutter_animation_cookbook/sliver/scroll_color_change_page.dart';
// import 'package:flutter_animation_cookbook/sliver/zomato_screen3.dart';

import '../custom/custom_elevated_button.dart';
import 'hint_scroll_container.dart';
import 'sliver_custom_scrollview1.dart';
import 'sliver_custom_scrollview2.dart';

class SliverExample extends StatefulWidget {
  const SliverExample({super.key});

  @override
  State<SliverExample> createState() => _SliverExampleState();
}

class _SliverExampleState extends State<SliverExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliver Example')),
      body: Column(
        children: [
          CustomElevatedButton(
            buttonText: "Nested Scrollview Collapsing Toolbar",
            backgroundColor: Colors.indigo,
            textColor: Colors.white,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PinnedHeaderWithTitle()),
            );
          },),
          CustomElevatedButton(
            buttonText: "Nested Scrollview PinnedHeaderWithSearch",
            backgroundColor: Colors.green,
            textColor: Colors.white,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PinnedHeaderWithSearchBox()),
            );
          },),
          CustomElevatedButton(
            buttonText: "Nested Scrollview PinnedHeaderWithImages",
            backgroundColor: Colors.purpleAccent,
            textColor: Colors.white,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PinnedHeaderWithImages()),
            );
          },),
          CustomElevatedButton(
            buttonText: "CustomScrollView CustomSliverExample",
            backgroundColor: Colors.black87,
            textColor: Colors.white,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomSliverExample()),
            );
          },),
          CustomElevatedButton(
            buttonText: "CustomScrollView Collapsing toolbarExample",
            backgroundColor: Colors.pink,
            textColor: Colors.white,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FlexibleSliverExample()),
            );
          },),
          CustomElevatedButton(
            buttonText: " Pinned Search In Scrolling",
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FilterPinnedListView()),
            );
          },),
          CustomElevatedButton(
            buttonText: "ScrollAppBarColorChange",
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScrollColorChangePage()),
            );
          },),
          // CustomElevatedButton(
          //   buttonText: "ZomatoHomeScreen",
          //   backgroundColor: Colors.orangeAccent,
          //   textColor: Colors.white,onPressed: (){
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => ZomatoHomeScreen()),
          //   );
          // },),
          CustomElevatedButton(
            buttonText: "TextCarousel",
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextCarousel()),
            );
          },),
        ],
      ),
    );
  }
}
