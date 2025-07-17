import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuieroGeoxusComponent extends StatelessWidget {
  QuieroGeoxusComponent(
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
        backgroundColor: Colors.white,
      ),
      child: SizedBox(
        width: screenWidth * 0.15,
        height: screenHeight * 0.075,
        child: Center(
          child: Text(
            'QUIERO GEOXUS',
            style: TextStyle(
                fontSize: screenWidth * 0.015,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
