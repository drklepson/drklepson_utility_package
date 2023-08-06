import 'package:drklepson_utility_package/formatters/formatter.dart';
import 'package:flutter/material.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
    required TextEditingController phoneController,
    this.labelText,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _phoneController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        CustomFormatters.phone(),
      ],
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText ?? 'Phone Number',
        prefixIcon: const Icon(Icons.phone_android_outlined),
      ),
    );
  }
}
