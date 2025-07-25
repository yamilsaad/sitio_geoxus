import 'package:flutter/material.dart';
import 'package:geoxus_web/src/config/themes/responsive.dart';

class FooterMobileView extends StatelessWidget {
  const FooterMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      width: responsive.width,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      color: Colors.black,
      child: Text(
        'Footer (Mobile)',
        style: TextStyle(
          color: Colors.white,
          fontSize: responsive.isMobile ? 16 : 20,
        ),
      ),
    );
  }
}
