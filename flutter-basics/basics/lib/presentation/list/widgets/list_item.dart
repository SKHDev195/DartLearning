import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    required this.title,
    required this.index,
    super.key,
  });

  final String title;
  final int index;

  @override
  State<ListItem> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ListItem> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
          title: Center(
            child: Text(
              widget.title,
            ),
          ),
          subtitle: Center(child: Text('Item number ${widget.index}')),
          leading: Checkbox(
            value: _isSelected,
            onChanged: (value) {
              setState(() {
                _isSelected = value ?? false;
              });
            },
          )),
    );
  }
}
