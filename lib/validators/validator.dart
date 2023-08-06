import 'package:flutter/material.dart';

part 'items/email_validator.g.dart';
part 'items/name_validator.g.dart';
part 'items/password_validator.g.dart';
part 'items/date_validator.g.dart';
part 'items/number_validator.g.dart';

class CustomValidator {
  factory CustomValidator() => _validator;

  CustomValidator._init();
  static final CustomValidator _validator = CustomValidator._init();

  static String? _regExpReturn({
    required String pattern,
    required String? value,
    required String trWords,
  }) {
    final regex = RegExp(pattern);
    // if (value != null && value.isNotEmpty) {
    if (value != null && value.isNotEmpty) {
      if (regex.hasMatch(value)) {
        return null;
      } else {
        return trWords;
      }
    } else {
      return trWords;
    }
  }

  static String? name(BuildContext context, String? value) =>
      _$name(context, value);

  static String? email(BuildContext context, String? value) =>
      _$email(context, value);

  static String? password(BuildContext context, String? value) =>
      _$password(context, value);

  static String? date(BuildContext context, String? value) =>
      _$date(context, value);

  static String? number(BuildContext context, String? value,
          {int? min, int? max, List<bool Function(num?)>? validators}) =>
      _$number(context, value, min: min, max: max, validators: validators);
}

extension ValidatorExtension on BuildContext {
  String? nameValidation(String? value) => CustomValidator.name(this, value);

  String? emailValidation(String? value) => CustomValidator.email(this, value);

  String? passwordValidation(String? value) =>
      CustomValidator.password(this, value);

  String? dateValidation(String? value) => CustomValidator.date(this, value);

  String? numberValidation(String? value,
          {int? min, int? max, List<bool Function(num?)>? validators}) =>
      CustomValidator.number(this, value,
          min: min, max: max, validators: validators);
}
