part of '../validator.dart';

String? _$password(BuildContext context, String? value) {
  const pattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{6,}$';
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
