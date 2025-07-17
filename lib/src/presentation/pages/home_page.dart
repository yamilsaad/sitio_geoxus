import 'package:flutter/material.dart';
import 'package:get/get.dart';
//Importacion de Archivos
import 'package:geoxus_web/src/presentation/widgets/drawer_widget.dart';
import 'package:geoxus_web/src/presentation/mobile/views/mobile_view.dart';
import 'package:geoxus_web/src/config/themes/responsive.dart';

import '../web/views/web_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(builder: (context, contraints) {
        if (contraints.maxWidth > Responsive.mobileBreakpoint) {
          return _DesktopView();
        } else {
          return _MobileView();
        }
      }),
    );
  }
}

///Drawer end.

class _DesktopView extends StatelessWidget {
  const _DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            InicioWebView(),
            SegundaWebView(),
            TerceraWebView(),
            CuartaWebView(),
            FooterWebView(),
          ],
        ),
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          InicioMobileView(),
          SegundaMobileView(),
          TerceraMobileView(),
          CuartaMobileView(),
          FooterMobileView(),
        ],
      ),
    );
  }
}
