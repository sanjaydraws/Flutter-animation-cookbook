import 'package:flutter/material.dart';




//using nestedscrollview for sliver
class PinnedHeaderWithImages extends StatelessWidget {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1732465286852-a0b95393a90d?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1731902062588-4dce45ccc0cb?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzMnx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1716138192476-f34e85ad43c2?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1716138192562-71754b66e0cb?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fHw%3D',
  ];

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
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double expansionRatio =
                      (constraints.maxHeight - kToolbarHeight) / (250 - kToolbarHeight);

                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    title: expansionRatio < 0.5
                        ? const Text(
                      'Pinned Header',
                      style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                    )
                        : null,
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1465513527097-544020a68b06?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          fit: BoxFit.cover,
                        ),
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
                  );
                },
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 8,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
