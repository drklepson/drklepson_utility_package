import 'package:flutter/material.dart';

class CustomOffset extends Offset {
  CustomOffset(super.dx, super.dy);

  static final CustomOffset bottomLeft = CustomOffset(0, 1);
  static final CustomOffset bottomRigth = CustomOffset(1, 1);
  static final CustomOffset topLeft = CustomOffset(0, 0);
  static final CustomOffset topRight = CustomOffset(1, 0);
}
