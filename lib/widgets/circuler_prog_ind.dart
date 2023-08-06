import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key, this.size = 30, this.text});
  final double size;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: size,
          child: CircularProgressIndicator(color: context.primaryColor),
        ),
        if (text != null) SizedBox(width: size * 3, child: Text(text!)),
      ],
    );
  }
}
