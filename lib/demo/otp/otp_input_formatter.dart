import 'package:flutter/services.dart';

class OTPInputFormatter extends TextInputFormatter {
  OTPInputFormatter(this.max);

  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var newText = newValue.text;
    if (newText.length == (max - 1)) {
      if (oldValue.text.contains('_')) {
        newText = newText.replaceAll(RegExp('_'), '');
        if (newText.isNotEmpty) {
          newText = newText.substring(0, newText.length - 1);
        }
      } else {}
    } else {
      newText = newText.replaceAll(RegExp('_'), '');
    }
    for (var i = newText.length; i < max; i++) {
      newText += '_';
    }
    newText = newText.substring(0, max);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
