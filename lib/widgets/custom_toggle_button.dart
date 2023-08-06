import 'dart:math';
import 'package:flutter/material.dart';

final _random = Random();

class CustomToggleButton<T> extends StatelessWidget {
  CustomToggleButton({
    required this.options,
    List<bool>? isSelected,
    super.key,
    this.maxSelected = 1,
    this.minSelected = 1,
    this.onTap,
  }) : assert(
          options.length >= minSelected && options.length >= maxSelected,
          'minSelected and maxSelected must be less than or equal'
          ' to the length of options',
        ) {
    if (isSelected != null) {
      assert(
        isSelected.length == options.length,
        'isSelected must have the same length as options',
      );
      assert(
        isSelected.where((element) => element).length <= maxSelected,
        'maxSelected must be less than or equal to the number of'
        ' true values in isSelected',
      );
      assert(
        isSelected.where((element) => element).length >= minSelected,
        'minSelected must be greater than or equal to the number of'
        ' true values in isSelected',
      );
      notifier = ValueNotifier(isSelected);
      return;
    } else {
      final liste = List.generate(options.length, (index) => false);
      while (liste.where((element) => element).length < minSelected) {
        liste[_random.nextInt(options.length)] = true;
      }
      notifier = ValueNotifier(liste);
    }
  }

  late final ValueNotifier<List<bool>> notifier;
  final List<String> options;
  final int maxSelected;
  final int minSelected;
  final void Function(int index, bool isSelected)? onTap;

  void _onPressed(int index) {
    if (notifier.value.elementAt(index) == true) {
      if (notifier.value.where((element) => element).length <= minSelected) {
        return;
      }
      notifier.value = notifier.value..[index] = false;
      onTap?.call(index, false);
      return;
    }
    if (maxSelected == 1) {
      notifier.value = List.generate(options.length, (i) => i == index);
      onTap?.call(index, true);
      return;
    }
    if (notifier.value.where((element) => element).length >= maxSelected) {
      return;
    }
    notifier.value = notifier.value..[index] = true;
    onTap?.call(index, true);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, child) {
        return ToggleButtons(
          isSelected: value,
          onPressed: _onPressed,
          children: options.map(Text.new).toList(),
        );
      },
    );
  }
}
