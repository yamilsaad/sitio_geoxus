import 'package:flutter/material.dart';
import 'package:geoxus_web/src/config/themes/responsive.dart';

class FooterWebView extends StatelessWidget {
  const FooterWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      width: responsive.width,
      padding: EdgeInsets.symmetric(
        horizontal: responsive.isMobile ? 16.0 : 32.0,
        vertical: 32.0,
      ),
      color: Colors.black,
      child: Text(
        'Footer (Web)',
        style: TextStyle(
          color: Colors.white,
          fontSize: responsive.isMobile ? 16 : 22,
        ),
      ),
    );
  }
} 