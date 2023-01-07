import 'package:flutter/material.dart';
import 'package:bmi_buddy/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.cardIcon, required this.cardLabel});

  final IconData cardIcon;
  final String cardLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 85,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          cardLabel,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
