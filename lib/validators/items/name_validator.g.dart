part of '../validator.dart';

String? _$name(BuildContext context, String? value) {
  const pattern = r'^[a-zA-Z0-9ğüşöçıİĞÜŞÖÇ. ]{2,}$';
  const error = 'Geçerli bir isim giriniz.';
  // context.locale?.nameValidatorError ?? 'Geçerli bir isim giriniz.';
  return CustomValidator._regExpReturn(
    pattern: pattern,
    value: value,
    trWords: error,
  );
}
