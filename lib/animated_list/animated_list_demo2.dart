import 'package:flutter/material.dart';

class AnimatedListExample2 extends StatefulWidget {
  @override
  _AnimatedListExample2State createState() => _AnimatedListExample2State();
}

class _AnimatedListExample2State extends State<AnimatedListExample2> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  void _addItem() {
    final int index = _items.length;
    _items.add('Item ${index + 1}');
    _listKey.currentState?.insertItem(index, duration: const Duration(milliseconds: 400));
  }

  void _removeItem(int index) {
    final removedItem = _items[index];
    _items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
          (context, animation) => _buildItem(removedItem, animation),
      duration: const Duration(milliseconds: 400),
    );
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition( // Adds a fade effect
        opacity: animation,
        child: SlideTransition( // Adds a slide effect
          position: Tween<Offset>(
            begin: const Offset(1, 0), // Start off-screen to the right
            end: Offset.zero, // Slide to its normal position
          ).animate(animation),
          child: ListTile(
            title: Text(item),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeItem(_items.indexOf(item)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedList Example')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addItem,
            child: Text('Add Item'),
          ),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(_items[index], animation);
              },
            ),
          ),
        ],
      ),
    );
  }
}

