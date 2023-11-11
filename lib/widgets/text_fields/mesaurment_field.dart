// ignore_for_file: unnecessary_lambdas

import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnitDetail {
  UnitDetail({
    required this.unit,
    required this.ratio,
    this.maxValue,
    this.minValue,
  });

  final String unit;
  final int? maxValue;
  final int? minValue;
  final double ratio;
}

class MesaurmentFormField extends StatelessWidget {
  MesaurmentFormField({
    required TextEditingController mesaurmentController,
    required this.label,
    super.key,
    this.maxValue,
    this.minValue,
    this.validator,
    this.unit,
  }) : _mesaurmentController = mesaurmentController;

  final TextEditingController _mesaurmentController;
  final int? maxValue;
  final int? minValue;
  final List<bool Function(num?)>? validator;

  final List<UnitDetail>? unit;
  final String label;

  final ValueNotifier<int> _unitIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    _unitIndex.addListener(() {
      _mesaurmentController.text = _mesaurmentController.text.isEmpty
          ? ''
          : (double.parse(_mesaurmentController.text) *
                  unit!.elementAt(_unitIndex.value).ratio)
              .toStringAsFixed(2);
    });
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: _unitIndex,
            builder: (context, index, child) => TextFormField(
              controller: _mesaurmentController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                DecimalInputFormatter(),
              ],
              validator: (value) => CustomValidator.number(
                value,
                max: unit != null ? unit!.elementAt(index).maxValue : maxValue,
                min: unit != null ? unit?.elementAt(index).maxValue : minValue,
                validators: validator,
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: label,
                prefixIcon: const Icon(Icons.height),
                suffix: (unit != null && unit!.length == 1)
                    ? Text(unit!.first.unit)
                    : null,
              ),
            ),
          ),
        ),
        if ((unit != null && unit!.length > 1))
          CustomToggleButton<String>(
            options: unit!.map((e) => e.unit).toList(),
            isSelected: List.generate(
              unit!.length,
              (index) => index == 0,
            ),
            onTap: (index, value) {
              if (value) {
                _unitIndex.value = index;
              }
            },
          )
      ],
    );
  }
}

class DecimalInputFormatter extends TextInputFormatter {
  DecimalInputFormatter({this.decimalRange = 2});

  final int decimalRange;
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final regEx = RegExp(r'^\d*\.?\d{0,2}');
    final newString = regEx.stringMatch(newValue.text) ?? oldValue.text;
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}
