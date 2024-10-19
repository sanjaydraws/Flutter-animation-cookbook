import 'package:flutter/material.dart';




class AnimatedContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatededContainer'),
        ),
        body: Center(
          child: CurveSelector(),
        ),
      ),
    );
  }
}

class CurveSelector extends StatefulWidget {
  @override
  _CurveSelectorState createState() => _CurveSelectorState();
}

class _CurveSelectorState extends State<CurveSelector> {
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

  bool _isExpanded = false; // Track whether the button is expanded

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Dropdown to select curve
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
        SizedBox(height: 20),

        // Animated button that uses the selected curve
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: _selectedCurve, // Apply selected curve here
            width: _isExpanded ? 300 : 150, // Expand width on tap
            height: _isExpanded ? 150 : 60, // Expand height on tap
            decoration: BoxDecoration(
              color: _isExpanded ? Colors.blue : Colors.orange,
              borderRadius: BorderRadius.circular(_isExpanded ? 30 : 15),
              boxShadow: _isExpanded
                  ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ]
                  : [],
            ),
            child: Center(
              child: Text(
                _isExpanded ? "Expanded" : "Tap Me",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
