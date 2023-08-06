import 'package:flutter/material.dart';

class CustomMaterialProperty<T> extends MaterialStateProperty<T> {
  CustomMaterialProperty({
    required this.main,
    this.pressed,
    this.hovered,
    this.focused,
    this.disabled,
    this.dragged,
    this.error,
    this.selected,
  });

  final T main;
  final T? pressed;
  final T? hovered;
  final T? focused;
  final T? disabled;
  final T? dragged;
  final T? error;
  final T? selected;

  T get _pressed => pressed ?? main;
  T get _hovered => hovered ?? main;
  T get _focused => focused ?? main;
  T get _disabled => disabled ?? main;
  T get _dragged => dragged ?? main;
  T get _error => error ?? main;
  T get _selected => selected ?? main;

  @override
  T resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return _pressed;
    }
    if (states.contains(MaterialState.hovered)) {
      return _hovered;
    }
    if (states.contains(MaterialState.focused)) {
      return _focused;
    }
    if (states.contains(MaterialState.disabled)) {
      return _disabled;
    }
    if (states.contains(MaterialState.dragged)) {
      return _dragged;
    }
    if (states.contains(MaterialState.error)) {
      return _error;
    }
    if (states.contains(MaterialState.selected)) {
      return _selected;
    }
    return _pressed;
  }
}
