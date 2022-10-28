import 'package:flutter/material.dart';

extension StyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle shadow(int? power) => copyWith(
        shadows: List.generate(
          power ?? 5,
          (index) => const Shadow(color: Colors.white, blurRadius: 5),
        ),
      );
}
