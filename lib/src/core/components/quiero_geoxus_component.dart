import 'package:flutter/material.dart';

class QuieroGeoxusComponent extends StatelessWidget {
  const QuieroGeoxusComponent({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.amber[800], // Color del texto
      ),
      child: SizedBox(
        width: screenWidth * 0.15,
        height: screenHeight * 0.075,
        child: Center(
          child: Text(
            'QUIERO GEOXUS',
            style: TextStyle(
                fontSize: screenWidth * 0.015, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
