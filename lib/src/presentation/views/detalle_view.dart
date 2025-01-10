import 'package:flutter/material.dart';

class DetalleView extends StatelessWidget {
  const DetalleView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      //color: Colors.pink,
    );
  }
}
