import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    required this.nameController,
    super.key,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Ad Soyad',
        prefixIcon: Icon(Icons.abc_outlined),
      ),
    );
  }
}
