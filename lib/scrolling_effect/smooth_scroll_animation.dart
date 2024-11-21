import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SmoothScrollExample(),
    );
  }
}

class SmoothScrollExample extends StatelessWidget {
  const SmoothScrollExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Function to scroll to the top
    void scrollToTop() {
      scrollController.animateTo(
        0,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smooth Scroll Animation'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.deepPurple, Colors.indigo],
              ),
            ),
          ),
          // ListView with smooth scrolling
          ListView.builder(
            controller: scrollController,
            itemCount: 50,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Card(
                color: Colors.white.withOpacity(0.8),
                elevation: 8,
                shadowColor: Colors.black.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    'Beautiful Item ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Smooth scrolling animation example'),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scrollToTop,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }
}
