import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StoryViewer());
  }
}

class StoryViewer extends StatelessWidget {
  const StoryViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final List<Color> storyColors = [
      Colors.purple,
      Colors.orange,
      Colors.cyan,
    ];

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: storyColors.length,
        itemBuilder: (context, index) {
          return Container(
            color: storyColors[index],
            child: Center(
              child: Text(
                'Story ${index + 1}',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
