import 'package:flutter/material.dart';

class CardSelectionWidget extends StatelessWidget {
  const CardSelectionWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                height: screenHeight * 0.25,
                width: screenWidth * 0.25,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(width: screenWidth * 0.05),
            Card(
              child: Container(
                height: screenHeight * 0.25,
                width: screenWidth * 0.25,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(width: screenWidth * 0.05),
            Card(
              child: Container(
                height: screenHeight * 0.25,
                width: screenWidth * 0.25,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
