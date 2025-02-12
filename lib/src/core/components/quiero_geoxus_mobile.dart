import 'package:flutter/material.dart';

class QuieroGeoxusMobileComponent extends StatelessWidget {
  QuieroGeoxusMobileComponent(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.textTitle});

  final double screenWidth;
  final double screenHeight;

  String textTitle = '';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black45,
        backgroundColor: Colors.white, // Color del texto
      ),
      child: SizedBox(
        width: screenWidth * 0.35,
        height: screenHeight * 0.05,
        child: Center(
          child: Text(
            textTitle,
            style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
