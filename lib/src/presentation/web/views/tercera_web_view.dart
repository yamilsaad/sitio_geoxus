import 'package:flutter/material.dart';
import 'package:geoxus_web/src/config/themes/responsive.dart';

class TerceraWebView extends StatelessWidget {
  const TerceraWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      width: responsive.width,
      padding: EdgeInsets.symmetric(
        horizontal: responsive.isMobile ? 16.0 : 32.0,
        vertical: 32.0,
      ),
      child: Text(
        'Tercera sección - Servicios (Web)',
        style: TextStyle(fontSize: responsive.isMobile ? 18 : 28),
      ),
    );
  }
} 