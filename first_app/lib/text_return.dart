import 'package:flutter/material.dart';

class TextReturn extends StatelessWidget {
  final String textvalue;

  TextReturn(this.textvalue);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      child: Text(
        textvalue,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
