part of '../validator.dart';

String? _$date(BuildContext context, String? value) {
  if (value == null || value == '') return null;
  const errorText = 'Lütfen geçerli bir tarih giriniz.';
  // context.locale?.dateValidatorError ?? 'Lütfen geçerli bir tarih giriniz.';

  final newValue = value.split('.').reversed.join('-');
  final sonuc = DateTime.tryParse(newValue);
  return sonuc == null ? errorText : null;
}
