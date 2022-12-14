import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomFormatters extends MaskTextInputFormatter {
  CustomFormatters({super.filter, super.initialText, super.mask, super.type})
      : super();
  static String get _phoneMask => '0 (5##) ### ## ##';
  static String get _dateMask => 'G#.M#.20Y#';
  static String _codeMask(int length) => '#${'-#' * length}';

  static CustomFormatters get phone => CustomFormatters(
        mask: _phoneMask,
        type: MaskAutoCompletionType.eager,
        filter: {'#': RegExp('[0-9]')},
      );

  static CustomFormatters get time => CustomFormatters(
        mask: _dateMask,
        type: MaskAutoCompletionType.eager,
        filter: {
          '#': RegExp('[0-9]'),
          'G': RegExp('[0-3]'),
          'M': RegExp('[0-1]'),
          'Y': RegExp('[0-2]'),
        },
      );

  static CustomFormatters code(int length) => CustomFormatters(
        mask: _codeMask(length - 1),
        type: MaskAutoCompletionType.eager,
        filter: {'#': RegExp('[0-9]')},
      );
}
