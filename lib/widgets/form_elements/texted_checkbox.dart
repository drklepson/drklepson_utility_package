import 'package:flutter/material.dart';

class TextedCheckBox extends StatelessWidget {
  const TextedCheckBox({
    super.key,
    this.value = false,
    this.onChanged,
    this.text,
    this.checkSize = 36,
    this.textStyle,
    this.boxShape,
  });

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? text;
  final double checkSize;
  final TextStyle? textStyle;
  final OutlinedBorder? boxShape;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: checkSize,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            onChanged: onChanged,
            shape: boxShape,
          ),
        ),
        if (text != null)
          Text(
            text!,
            style: textStyle ?? Theme.of(context).textTheme.labelLarge,
          )
      ],
    );
  }
}
