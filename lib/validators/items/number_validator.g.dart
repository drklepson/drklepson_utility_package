part of '../validator.dart';

String? _$number(BuildContext context, String? value,
    {int? min, int? max, List<bool Function(num?)>? validators}) {
  if (value == null || value == '') return null;
  final deger = num.tryParse(value.replaceAll(',', '.'));
  if (deger == null) return 'Lütfen geçerli bir sayı giriniz.';
  if (min != null && deger < min) {
    return 'Lütfen $min veya daha büyük bir değer giriniz.';
  }
  if (max != null && deger > max) {
    return 'Lütfen $max veya daha küçük bir değer giriniz.';
  }
  if (validators?.every((element) => element(deger)) ?? false) {
    return 'Lütfen geçerli bir sayı giriniz.';
  }
  return null;
}
