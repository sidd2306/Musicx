import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({ this.cardW});

  final Widget cardW;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardW,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}