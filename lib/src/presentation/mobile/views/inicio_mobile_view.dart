import 'package:flutter/material.dart';
import 'package:geoxus_web/src/config/themes/responsive.dart';

class InicioMobileView extends StatelessWidget {
  const InicioMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      width: responsive.width,
      height: responsive.height * 0.5,
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Inicio - Banner principal (Mobile)',
        style: TextStyle(fontSize: responsive.isMobile ? 20 : 28),
      ),
    );
  }
}
