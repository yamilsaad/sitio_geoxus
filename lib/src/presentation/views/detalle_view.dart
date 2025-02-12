import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DetalleView extends StatefulWidget {
  const DetalleView({super.key});

  @override
  _DetalleViewState createState() => _DetalleViewState();
}

class _DetalleViewState extends State<DetalleView> {
  bool _isVisible = false; // Para controlar la animación

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return VisibilityDetector(
      key: Key('detalle-view'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          // Detecta si al menos el 20% es visible
          setState(() {
            _isVisible = true; // Activa la animación
          });
        }
      },
      child: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _isVisible
                ? FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      color: Colors.red,
                      height: screenHeight * 0.075,
                      width: screenWidth * 0.075,
                    ),
                  )
                : Container(
                    // Espacio vacío para evitar reacomodos
                    height: screenHeight * 0.075,
                    width: screenWidth * 0.075,
                  ),
          ],
        ),
      ),
    );
  }
}
