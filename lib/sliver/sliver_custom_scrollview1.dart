import 'package:flutter/material.dart';


// used SliverToBoxAdapter SliverList inside CustomScrollView
class CustomSliverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar
          SliverAppBar(
            backgroundColor: Colors.purple,
            pinned: false,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Custom Slivers'),
              background: Image.network(
                'https://images.unsplash.com/photo-1465513527097-544020a68b06?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // SliverToBoxAdapter for custom content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Header Section",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "This is a description or detailed information about the content below. "
                        "You can add any widgets here like buttons, text, or images.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Click Me"),
                  ),
                ],
              ),
            ),
          ),

          // SliverList for a list of items
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return
                  ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text('${index + 1}'),
                  ),
                  title: Text('Item ${index + 1}'),
                  subtitle: const Text('This is a list item.'),
                );
              },
              childCount: 15, // Number of items in the list
            ),
          ),

          // SliverToBoxAdapter for additional content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "End of Content",
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
