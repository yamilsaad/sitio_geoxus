import 'package:flutter/material.dart';
import 'package:geoxus_web/src/presentation/widgets/drawer_widget.dart';
import 'package:get/get.dart';

class GobiernoScreen extends StatelessWidget {
  const GobiernoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false, // Oculta la flecha de regreso
        elevation: 0.0,
        toolbarHeight: screenHeight * 0.12,
        title: GestureDetector(
          onTap: () {
            Get.toNamed('/'); // Navega a la página de inicio
          },
          child: SizedBox(
            height: screenHeight * 0.2,
            width: screenWidth * 0.45,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/img/logo/logo_geoxus1.webp',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: DrawerWidget(screenWidth: screenWidth),
      body: LayoutBuilder(builder: (context, contraints) {
        if (contraints.maxWidth > 650) {
          return _GobiernoDesktop();
        } else {
          return _GobiernoMobile();
        }
      }),
    );
  }
}

class _GobiernoMobile extends StatelessWidget {
  const _GobiernoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
    );
  }
}

class _GobiernoDesktop extends StatelessWidget {
  const _GobiernoDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}
