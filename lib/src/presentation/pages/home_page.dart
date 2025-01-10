import 'package:flutter/material.dart';
import 'package:geoxus_web/src/presentation/views/view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //backgroundColor: const Color(0xff1A1A1D),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        toolbarHeight: screenHeight * 0.12,
        title: SizedBox(
          height: screenHeight * 0.10,
          width: screenWidth * 0.15,
          child: Image.asset(
            'assets/img/logo/logo_geoxus1.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      endDrawer: DrawerWidget(screenWidth: screenWidth),
      body: LayoutBuilder(builder: (context, contraints) {
        if (contraints.maxWidth > 650) {
          return _DesktopView();
        } else {
          return _MobileView();
        }
      }),
    );
  }
}

///Drawer end.
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0))),
      width: screenWidth * 0.5,
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [InicioView(), DetalleView(), FooterView()],
        ),
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
