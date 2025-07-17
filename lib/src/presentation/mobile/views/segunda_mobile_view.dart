import 'package:flutter/material.dart';
import 'package:geoxus_web/src/config/themes/responsive.dart';

class SegundaMobileView extends StatelessWidget {
  const SegundaMobileView({super.key});

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
        'Segunda sección - Servicios (Mobile)',
        style: TextStyle(fontSize: responsive.isMobile ? 18 : 24),
      ),
    );
  }
} 