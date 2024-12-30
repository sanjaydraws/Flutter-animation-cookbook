import 'package:flutter/material.dart';
import 'package:flutter_animation_cookbook/app_colors.dart';

class IconCardsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icon Cards Row"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCard(Icons.percent, "Offers", Colors.blue),
              _buildCard(Icons.cake, "Plan a party", Colors.orange),
              _buildCard(Icons.local_offer, "Brand packs", Colors.pink),
              _buildCard(Icons.fastfood, "Collections", Colors.amber),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:2,vertical: 2),
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.only(right: 16.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white20,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 36,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: IconCardsRow(),
  ));
}
