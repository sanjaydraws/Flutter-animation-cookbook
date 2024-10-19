import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  @override
  _AnimatedListExampleState createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();// to control the list (inserting/removing items).
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  void _addItem() {
    final int index = _items.length;
    _items.add('Item ${index + 1}');
    _listKey.currentState?.insertItem(index, duration: const Duration(milliseconds: 300));
  }

  void _removeItem(int index) {
    final removedItem = _items[index];
    _items.removeAt(index);
    _listKey.currentState?.removeItem(index, (context, animation) => _buildItem(removedItem, animation),
      duration: const Duration(milliseconds: 300),
    );
  }

  Widget _buildItem(String item, Animation<double> animation) {
    // It wraps the list item in a SizeTransition widget
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(item),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => _removeItem(_items.indexOf(item)),
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

