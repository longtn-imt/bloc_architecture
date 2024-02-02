import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DateTimeFormatter {
  const DateTimeFormatter._();

  // Convert
  static final DateFormat dateTimeConvert = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  static final DateFormat dateConvert = DateFormat('yyyy-MM-dd');

  // Format
  static final DateFormat dateTimeFormatSlash = DateFormat('yyyy/MM/dd HH:mm:ss');

  static final DateFormat dateFormatSlash = DateFormat('yyyy/MM/dd');

  static final DateFormat dateTimeFormatHyphen = DateFormat('yyyy-MM-dd HH:mm:ss');

  static final DateFormat dateFormatHyphen = DateFormat('yyyy-MM-dd');

  static final DateFormat dateTimeFormatDot = DateFormat('yyyy.MM.dd HH:mm:ss');

  static final DateFormat dateFormatDot = DateFormat('yyyy.MM.dd');

  static final DateFormat timeFormat = DateFormat('HH:mm:ss');

  static final DateFormat timeNoSecondFormat = DateFormat('HH:mm');
}

class DateTextFormatter extends TextInputFormatter {
  const DateTextFormatter({this.seperator = '-'});

  final String seperator;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = _format(newValue.text, seperator);
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    String newString = '';

    for (int i = 0; i < math.min(value.length, 8); i++) {
      newString += value[i];
      if ((i == 3 || i == 5) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
