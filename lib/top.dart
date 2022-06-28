import 'package:flutter/material.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      child: Center(child: Text('List Item')),
    );
  }
}
