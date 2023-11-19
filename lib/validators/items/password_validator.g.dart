part of '../validator.dart';

const _pattern =
    r'^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[@#$%^&+=!()\-_\\|{}\[\]:;<>,.?\/]).*$';

final passwordRegex = RegExp(_pattern);

String? _$password(String? value) {
  const pattern = _pattern;
  const error = '''
 Şifreniz en az 8 haneli olmalı ve
  en az 1 büyük, 1 küçük harf ve 1 sayı bulundurmalıdır.''';

//   context.locale?.passwordValidatorError ??
//       '''
// Şifreniz en az 8 haneli olmalı ve
//  en az 1 büyük, 1 küçük harf ve 1 sayı bulundurmalıdır.''';
  return CustomValidator._regExpReturn(
    pattern: pattern,
    value: value,
    trWords: error,
  );
}
