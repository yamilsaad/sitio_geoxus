import 'package:flutter/material.dart';
import 'package:geoxus_web/src/config/themes/responsive.dart';

class CuartaMobileView extends StatelessWidget {
  const CuartaMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      width: responsive.width,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      child: Text(
        'Cuarta sección - Servicios (Mobile)',
        style: TextStyle(fontSize: responsive.isMobile ? 18 : 24),
      ),
    );
  }
} 