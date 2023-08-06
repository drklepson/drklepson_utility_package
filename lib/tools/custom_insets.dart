import 'package:flutter/material.dart';

class CustomInsets extends EdgeInsets {
  const CustomInsets.all(super.value) : super.all();
  const CustomInsets.fromLTBR(super.left, super.top, super.right, super.bottom)
      : super.fromLTRB();
  CustomInsets.forWindowPadding(super.padding, super.devicePixelRatio)
      : super.fromViewPadding();
  const CustomInsets.only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) : super.only(left: left, right: right, top: top, bottom: bottom);
  const CustomInsets.sym(double horizontal, double vertical)
      : super.symmetric(horizontal: horizontal, vertical: vertical);

  static CustomInsets get h16v12 => const CustomInsets.sym(16, 12);
  static CustomInsets get h16v8 => const CustomInsets.sym(16, 8);
  static CustomInsets get h16v4 => const CustomInsets.sym(16, 4);

  static CustomInsets get h12v16 => const CustomInsets.sym(12, 16);
  static CustomInsets get h12v8 => const CustomInsets.sym(12, 8);
  static CustomInsets get h12v4 => const CustomInsets.sym(12, 4);

  static CustomInsets get horizontalSixteen => const CustomInsets.sym(16, 0);
  static CustomInsets get horizontalEight => const CustomInsets.sym(8, 0);
  static CustomInsets get horizontalFour => const CustomInsets.sym(4, 0);

  static CustomInsets get verticalSixteen => const CustomInsets.sym(0, 16);
  static CustomInsets get verticalTwelve => const CustomInsets.sym(0, 12);
  static CustomInsets get verticalEight => const CustomInsets.sym(0, 8);
  static CustomInsets get verticalFour => const CustomInsets.sym(0, 4);

  static CustomInsets get leftSixteen => const CustomInsets.only(left: 16);
  static CustomInsets get leftTwelve => const CustomInsets.only(left: 12);
  static CustomInsets get leftEight => const CustomInsets.only(left: 8);
  static CustomInsets get leftFour => const CustomInsets.only(left: 4);

  static CustomInsets get rightSixteen => const CustomInsets.only(right: 16);
  static CustomInsets get rightTwelve => const CustomInsets.only(right: 12);
  static CustomInsets get rightEight => const CustomInsets.only(right: 8);
  static CustomInsets get rightFour => const CustomInsets.only(right: 4);

  static CustomInsets get topSixteen => const CustomInsets.only(top: 16);
  static CustomInsets get topTwelve => const CustomInsets.only(top: 12);
  static CustomInsets get topEight => const CustomInsets.only(top: 8);
  static CustomInsets get topFour => const CustomInsets.only(top: 4);

  static CustomInsets get bottomSixteen => const CustomInsets.only(bottom: 16);
  static CustomInsets get bottomTwelve => const CustomInsets.only(bottom: 12);
  static CustomInsets get bottomEight => const CustomInsets.only(bottom: 8);
  static CustomInsets get bottomFour => const CustomInsets.only(bottom: 4);

  static CustomInsets get allSixteen => const CustomInsets.all(16);
  static CustomInsets get allTwelve => const CustomInsets.all(12);
  static CustomInsets get allEight => const CustomInsets.all(8);
  static CustomInsets get allFour => const CustomInsets.all(4);
}
