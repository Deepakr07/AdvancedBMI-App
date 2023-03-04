import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color cardTextColor = Colors.grey;

class IconContent extends StatelessWidget {
  final iconImage;
  final iconText;
  const IconContent({this.iconImage, this.iconText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconImage,
          size: 65,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          iconText,
          style: TextStyle(color: cardTextColor),
        ),
      ],
    );
  }
}
