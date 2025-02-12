import 'package:flutter/material.dart';

class FooterMobileView extends StatelessWidget {
  const FooterMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: _screenWidth,
      height: _screenHeight,
      color: Colors.black,
      child: const Center(
        child: Text('Contacto'),
      ),
    );
  }
}
