




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_cookbook/AnimatedContainer.dart';
import 'package:flutter_animation_cookbook/my_celebreation_screen.dart';
import 'package:flutter_animation_cookbook/page_route_transition/page_route_transition.dart';
import 'package:flutter_animation_cookbook/parallax_animation_example.dart';
import 'package:flutter_animation_cookbook/product_screen.dart';
import 'package:flutter_animation_cookbook/sliding_drawer.dart';
import 'package:flutter_animation_cookbook/staggered_animation/staggered_animation_demo.dart';
import 'package:flutter_animation_cookbook/tinder_swipe_card.dart';
import 'package:flutter_animation_cookbook/tween_animation_builder_example.dart';

import 'Tween_animation_builder_example2.dart';
import 'animated_align_example.dart';
import 'animated_list/animated_list_demo.dart';
import 'animated_list/animated_list_demo2.dart';
import 'animated_opacity_example.dart';
import 'animation_controller.dart';
import 'animation_swatcher/animated_swatcher_example.dart';
import 'flip_card_animation.dart';
import 'heartbeat_animation.dart';
import 'hero/first_screen.dart';
import 'lottie_animation/lottie_animation.dart';

class AnimationSample extends StatefulWidget {
  const AnimationSample({super.key});

  @override
  State<AnimationSample> createState() => _AnimationSampleState();
}

class _AnimationSampleState extends State<AnimationSample> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Flutter Animation')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Wrap(
            children: [
              CustomElevatedButton(
                buttonText: "AnimatedContainer",
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnimatedContainerExample()),
                  );
                },
              ),
              CustomElevatedButton(
                  buttonText: "AnimatedCrossFade",
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductScreen()),
                );
              },),
              CustomElevatedButton(
                buttonText: "AnimatedOpacity",
                backgroundColor: Colors.tealAccent,
                textColor: Colors.black,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OpacityAnimationWidget()),
                );
              },),
              CustomElevatedButton(
                buttonText: "AnimatedAlign",
                backgroundColor: Colors.purple,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedAlignWidget()),
                );
              },),
              CustomElevatedButton(
                buttonText: "AnimatedBuilder Example1",
                backgroundColor: Colors.indigo,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SizeAnimationWidget()),
                );
              },),
              CustomElevatedButton(
                buttonText: "AnimatedBuilder Example2",
                backgroundColor: Colors.indigo,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeartbeatIconWidget()),
                );
              },),
              CustomElevatedButton(
                buttonText: "AnimatedBuilder Example3",
                backgroundColor: Colors.indigo,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RotateContainer()),
                );
              },),
              CustomElevatedButton(
                buttonText: "TweenAnimationBuilder",
                backgroundColor: Colors.deepOrangeAccent,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SimpleOpacityAnimation()),
                );
              },),
              CustomElevatedButton(
                buttonText: "BouncingBox Demo",
                backgroundColor: Colors.teal,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BouncingBox()),
                );
              },),
              CustomElevatedButton(
                buttonText: "Hero Animation",
                backgroundColor: Colors.green,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },),
              CustomElevatedButton(
                buttonText: "StaggeredAnimation",
                backgroundColor: Colors.pinkAccent,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StaggeredAnimationDemo()),
                );
              },),

              CustomElevatedButton(
                buttonText: "AnimatedList Animation Example1",
                backgroundColor: Colors.amberAccent,
                textColor: Colors.black,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedListExample()),
                );
              },),
              CustomElevatedButton(
                buttonText: "AnimatedList Animation Example2",
                backgroundColor: Colors.amberAccent,
                textColor: Colors.black,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedListExample2()),
                );
              },),
              CustomElevatedButton(
                buttonText: "AnimatedSwitcher ",
                backgroundColor: Colors.deepPurpleAccent,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedSwitcherExample()),
                );
              },),
              CustomElevatedButton(
                buttonText: "Lottie Anim",
                backgroundColor: Colors.deepPurple,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LottieExample()),
                );
              },),
              CustomElevatedButton(
                buttonText: "Page route Animation",
                backgroundColor: Colors.indigo,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageRouteTransition()),
                );
              },),
              CustomElevatedButton(
                buttonText: "Celebration Animation",
                backgroundColor: Colors.indigo,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCelebrationScreen()),
                );
              },),
              CustomElevatedButton(
                buttonText: "Parallax Animation",
                backgroundColor: Colors.indigo,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExampleParallax()),
                );
              },),
              CustomElevatedButton(
                buttonText: "SwipeCards Animation",
                backgroundColor: Colors.indigo,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TinderSwipeCards()),
                );
              },),
              CustomElevatedButton(
                buttonText: "FlipCard Animation",
                backgroundColor: Colors.indigo,
                textColor: Colors.white,onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlipCard()),
                );
              },),

            ],
          ),
        ),
      ),
    );
  }
}



// Define a reusable button widget that accepts text, background color, and text color
class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  CustomElevatedButton({
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Background color
        foregroundColor: textColor, // Text color
      ),
      child: Text(buttonText),
    );
  }
}
