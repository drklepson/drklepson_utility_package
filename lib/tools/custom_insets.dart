import 'package:flutter/material.dart';

class CustomInsets extends EdgeInsets {
  const CustomInsets.all(super.value) : super.all();
  const CustomInsets.fromLTBR(super.left, super.top, super.right, super.bottom)
      : super.fromLTRB();
  CustomInsets.forWindowPadding(super.padding, super.devicePixelRatio)
      : super.fromWindowPadding();
  const CustomInsets.only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) : super.only(left: left, right: right, top: top, bottom: bottom);
  const CustomInsets.symmetric(horizontal, vertical)
      : super.symmetric(horizontal: horizontal, vertical: vertical);

  static CustomInsets get bottomFourty => const CustomInsets.only(bottom: 40);
  static CustomInsets get allSixteen => const CustomInsets.all(16);
}
