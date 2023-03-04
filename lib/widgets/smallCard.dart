import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final Color colour;
  final containerChild;
  SmallCard({required this.colour, this.containerChild});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: containerChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
