import 'package:flutter/material.dart';
import 'package:bmi_buddy/screens/input_screen.dart';

void main() => runApp(BMIBuddy());

class BMIBuddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light().copyWith(
          primary: Color(0xFF0A0D22),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      home: InputPage(),
    );
  }
}
