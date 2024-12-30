import 'package:flutter/material.dart';

import 'AnimatedContainer.dart';
import 'animation_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimationSample(),
    );
  }
}


class Dmeo extends StatefulWidget {
  const Dmeo({super.key});

  @override
  State<Dmeo> createState() => _DmeoState();
}

class _DmeoState extends State<Dmeo> {
  int selectedIndex = 0; // Store the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          itemCount: 10, // Adjust as needed
          itemBuilder: (BuildContext context, int index) {
            bool isSelected = index == selectedIndex; // Check if the current item is selected

            return GestureDetector(
              onTap: () {
                // Update selectedIndex when an item is tapped
                setState(() {
                  selectedIndex = index; // Update the selected index
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensures the column only takes necessary space
                  children: [
                    // Image for the food item
                    Container(
                      width: 100.0, // Set the size of the image
                      height: 100.0, // Set the size of the image
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://media.istockphoto.com/id/466149291/photo/italian-pizza-with-cherry-tomatoes.webp?a=1&b=1&s=612x612&w=0&k=20&c=KFGQZWsPTLxt8Sp5SQGJlNOuLA1_5GorNEFtZy-cuU4=',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(height: 8.0), // Space between the image and the text
                    Text(
                      'Food ${index + 1}', // Dynamic food name
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                      width: double.infinity,
                      height: 12.0, // Bottom line height
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}





