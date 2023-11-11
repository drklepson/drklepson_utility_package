part of '../validator.dart';

String? _$email(String? value) {
  const pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  const error = 'Lütfen geçerli bir e posta adresi giriniz.';
  // context.locale?.emailValidatorError ??
  //     'Lütfen geçerli bir e posta adresi giriniz.';
  return CustomValidator._regExpReturn(
    pattern: pattern,
    value: value,
    trWords: error,
  );
}
