import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.photo, size: 120.0),
        SizedBox(height: 5.0),
        Text('Photo view'),
      ],
    );
  }
}