
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedCrossFade')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductCard(productName: 'Smartphone', price: '\$999', details: 'Latest 5G Smartphone with 128GB storage.'),
            ProductCard(productName: 'Laptop', price: '\$1999', details: 'High-performance laptop with 16GB RAM and 1TB SSD.'),
            ProductCard(productName: 'Headphones', price: '\$299', details: 'Noise-cancelling wireless headphones.'),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String productName;
  final String price;
  final String details;

  ProductCard({required this.productName, required this.price, required this.details});

  @override
  _ProductCardState createState() => _ProductCardState();
}


class _ProductCardState extends State<ProductCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container( // Use regular Container instead of AnimatedContainer
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.productName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(widget.price, style: TextStyle(fontSize: 16, color: Colors.green)),
            SizedBox(height: 10),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              firstChild: Container(), // Empty container when collapsed
              secondChild: Text(
                widget.details,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                iconSize: 20,
                icon: Icon(_isExpanded ? Icons.arrow_upward : Icons.arrow_downward),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
