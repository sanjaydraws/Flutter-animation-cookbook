import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lottie Animation Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Center(
                child: Lottie.asset('assets/anim1.json',// The Lottie animation file stored locally
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Lottie.network(
                    'https://lottie.host/6aa0d6c1-ff87-4eb6-8ef9-4f66cd04339b/dh4w6KZl92.json'),
              ),

            ],
          ),
        ]
      ),
    );
  }
}

