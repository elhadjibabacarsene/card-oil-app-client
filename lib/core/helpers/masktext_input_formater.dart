import 'package:flutter/services.dart';

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    this.separator = ' ',
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      var maskedText = _applyMask(newValue.text);
      return maskedText != newValue.text
          ? TextEditingValue(
        text: maskedText,
        selection: TextSelection.collapsed(
          offset: maskedText.length,
        ),
      )
          : newValue;
    } else {
      return newValue;
    }
  }

  String _applyMask(String input) {
    var result = '';
    var maskCharIndex = 0;
    for (var charIndex = 0; charIndex < input.length; charIndex++) {
      var char = input[charIndex];
      if (maskCharIndex >= mask.length) {
        break;
      }
      var maskChar = mask[maskCharIndex];
      if (maskChar == separator) {
        result += separator;
        maskCharIndex++;
        if (maskCharIndex >= mask.length) {
          break;
        }
        maskChar = mask[maskCharIndex];
      }
      if (maskChar == 'X') {
        result += char;
        maskCharIndex++;
      }
    }
    return result;
  }
}
