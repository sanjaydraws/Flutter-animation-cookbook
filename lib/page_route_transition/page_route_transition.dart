


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_cookbook/hero/second_screen.dart';

class PageRouteTransition extends StatefulWidget {
  const PageRouteTransition({super.key});

  @override
  State<PageRouteTransition> createState() => _PageRouteTransitionState();
}

class _PageRouteTransitionState extends State<PageRouteTransition> {

  // List of animation curves as a Map<String, dynamic>
  final List<Map<String, dynamic>> _curves = [
    {"name": "ease", "curve": Curves.ease },
    {"name": "easeIn", "curve": Curves.easeIn},
    {"name": "Ease In Quad", "curve": Curves.easeInQuad},
    {"name": "Ease Out Quad", "curve": Curves.easeOutQuad},
    {"name": "Ease In Out Quad", "curve": Curves.easeInOutQuad},
    {"name": "Ease In Circ", "curve": Curves.easeInCirc},
    {"name": "Ease Out Circ", "curve": Curves.easeOutCirc},
    {"name": "Ease In Out Circ", "curve": Curves.easeInOutCirc},
    {"name": "Bounce In", "curve": Curves.bounceIn},
    {"name": "Bounce Out", "curve": Curves.bounceOut},
    {"name": "bounceInOut", "curve": Curves.bounceInOut},
    {"name": "decelerate", "curve": Curves.decelerate},
    {"name": "slowMiddle", "curve": Curves.slowMiddle},
    // {"name": "elasticIn", "curve": Curves.elasticIn},
    // {"name": "elasticOut", "curve": Curves.elasticOut},
    // {"name": "elasticInOut", "curve": Curves.elasticInOut},
    {"name": "easeInCubic", "curve": Curves.easeInCubic},
    {"name": "easeInSine", "curve": Curves.easeInSine},
    {"name": "easeInOutSine", "curve": Curves.easeInOutSine},
    {"name": "easeOutSine", "curve": Curves.easeOutSine},


    // {"name": "Ease In Back", "curve": Curves.easeInBack},
    // {"name": "Ease Out Back", "curve": Curves.easeOutBack},
  ];

  // Default selected curve
  Curve _selectedCurve = Curves.easeInQuad;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageRouteTransition Animation')),
      body: Center(
        child: Column(
          children: [
            // Dropdown to select curve
            Text("Select Curve",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
            DropdownButton<Map<String, dynamic>>(
              value: _curves.firstWhere((element) => element['curve'] == _selectedCurve, orElse: () => _curves[0]),
              onChanged: (Map<String, dynamic>? newValue) {
                setState(() {
                  _selectedCurve = newValue!['curve'];
                });
              },
              items: _curves.map((Map<String, dynamic> curveMap) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: curveMap,
                  child: Text(curveMap['name']), // Display the human-readable name
                );
              }).toList(),
            ),

            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SecondScreen();
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    Curve curve = _selectedCurve;

                    var tween = Tween(begin: begin, end: end);
                    var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

                    var offsetAnimation = tween.animate(curvedAnimation);

                    return SlideTransition(position: offsetAnimation, child: child);
                  },
                ),
              );
            }, child: Text("Navigate To other Screen"),
            ),
          ]
        ),
      ),
    );
  }
}
