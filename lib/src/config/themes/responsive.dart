import 'package:flutter/material.dart';

class Responsive {
  static const double mobileBreakpoint = 650;
  static const double tabletBreakpoint = 1100;

  final BuildContext context;
  late double width;
  late double height;

  Responsive(this.context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }

  bool get isMobile => width < mobileBreakpoint;
  bool get isTablet => width >= mobileBreakpoint && width < tabletBreakpoint;
  bool get isDesktop => width >= tabletBreakpoint;

  double wp(double percent) => width * percent / 100;
  double hp(double percent) => height * percent / 100;
} 