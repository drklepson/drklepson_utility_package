import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    required this.desktop,
    required this.tablet,
    required this.mobile,
    super.key,
  });

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1280) return desktop;
        if (constraints.maxWidth >= 600) return tablet;
        return mobile;
      },
    );
  }
}
