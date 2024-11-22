import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class TinderSwipeCards extends StatefulWidget {
  @override
  _TinderSwipeCardsState createState() => _TinderSwipeCardsState();
}

class _TinderSwipeCardsState extends State<TinderSwipeCards> {
  final List<UserModel> users = [
    UserModel(name: 'User 1', imageUrl: 'https://images.unsplash.com/photo-1531764117131-cbd26e7885f0?q=80&w=2832&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    UserModel(name: 'User 2', imageUrl: 'https://images.unsplash.com/photo-1530452491045-fcc42194fe79?q=80&w=3085&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    UserModel(name: 'User 3', imageUrl: 'https://plus.unsplash.com/premium_photo-1673039393866-130d3d092b66?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDI4fHx8ZW58MHx8fHx8'),
    UserModel(name: 'User 4', imageUrl: 'https://images.unsplash.com/photo-1537669488153-c3f5cc345134?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDgxfHx8ZW58MHx8fHx8'),
    UserModel(name: 'User 4', imageUrl: 'https://images.unsplash.com/photo-1537808038302-287105ae5567?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDUzfHx8ZW58MHx8fHx8'),

  ];

  Offset _cardOffset = Offset.zero; // Offset to track card position

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _cardOffset += details.delta;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_cardOffset.dx > 100 || _cardOffset.dx < -100) {
      // Remove the swiped card and update the stack
      setState(() {
        _cardOffset = Offset.zero;
        users.removeAt(0);
      });
    } else {
      // Reset the card position
      setState(() {
        _cardOffset = Offset.zero;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Swipe Cards')),
      body: Stack(
        alignment: Alignment.center,
        children: users.reversed
            .map((user) {
          int index = users.indexOf(user);
          bool isTopCard = index == 0;

          return Positioned(
            top: 30 + (index * 10), // Slightly offset each card
            child: DraggableCard(
              user: user,
              offset: isTopCard ? _cardOffset : Offset.zero,
              onPanUpdate: isTopCard ? _onPanUpdate : null,
              onPanEnd: isTopCard ? _onPanEnd : null,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DraggableCard extends StatelessWidget {
  final UserModel user;
  final Offset offset;
  final Function(DragUpdateDetails)? onPanUpdate;
  final Function(DragEndDetails)? onPanEnd;

  DraggableCard({
    required this.user,
    required this.offset,
    this.onPanUpdate,
    this.onPanEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: Container(
          width: 350,
          height: 600 ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 2)),
            ],
            image: DecorationImage(
              image: NetworkImage(user.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}





class UserModel {
  final String name;
  final String imageUrl;

  UserModel({required this.name, required this.imageUrl});
}
