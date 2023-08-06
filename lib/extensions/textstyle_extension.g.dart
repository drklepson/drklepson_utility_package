import 'package:flutter/material.dart';

extension StyleExtension on TextStyle? {
  TextStyle? get bold => this?.copyWith(fontWeight: FontWeight.bold);

  TextStyle? withColor(Color? color) => this?.copyWith(color: color);

  TextStyle? shadow(int? power) => this?.copyWith(
        shadows: List.generate(
          power ?? 5,
          (index) => const Shadow(color: Colors.white, blurRadius: 5),
        ),
      );
}
