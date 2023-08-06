import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';

class VerificationCodeField extends StatelessWidget {
  const VerificationCodeField({
    required this.codeController,
    required this.inputFormatter,
    required this.length,
    super.key,
  });

  final TextEditingController codeController;
  final CustomFormatters inputFormatter;
  final int length;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: codeController,
      keyboardType: TextInputType.number,
      inputFormatters: [inputFormatter],
      textInputAction: TextInputAction.done,
      validator: (value) => inputFormatter.getUnmaskedText().length == length
          ? null
          : 'resetCodeError',
      textAlign: TextAlign.center,
      decoration: InputDecoration(hintText: inputFormatter.getMask()),
    );
  }
}
