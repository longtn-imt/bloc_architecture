import "dart:math" as math;

import "package:flutter/services.dart";
import "package:intl/intl.dart";

/// Style format DateTime
class DateTimeFormatter {
  const DateTimeFormatter._();

  /// Convert: yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
  static final DateFormat dateTimeConvert = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  /// Convert: yyyy-MM-dd
  static final DateFormat dateConvert = DateFormat("yyyy-MM-dd");

  /// Format: yyyy/MM/dd HH:mm:ss
  static final DateFormat dateTimeFormatSlash = DateFormat("yyyy/MM/dd HH:mm:ss");

  /// Format: yyyy/MM/dd
  static final DateFormat dateFormatSlash = DateFormat("yyyy/MM/dd");

  /// Format: yyyy-MM-dd HH:mm:ss
  static final DateFormat dateTimeFormatHyphen = DateFormat("yyyy-MM-dd HH:mm:ss");

  /// Format: yyyy-MM-dd
  static final DateFormat dateFormatHyphen = DateFormat("yyyy-MM-dd");

  /// Format: yyyy.MM.dd HH:mm:ss
  static final DateFormat dateTimeFormatDot = DateFormat("yyyy.MM.dd HH:mm:ss");

  /// Format: yyyy.MM.dd
  static final DateFormat dateFormatDot = DateFormat("yyyy.MM.dd");

  /// Format: HH:mm:ss
  static final DateFormat timeFormat = DateFormat("HH:mm:ss");

  /// Format: HH:mm
  static final DateFormat timeNoSecondFormat = DateFormat("HH:mm");
}

/// TextInputFormatter for Date
class DateTextFormatter extends TextInputFormatter {
  /// Create a DateTextFormatter
  const DateTextFormatter({this.seperator = "-"});

  /// Seperator for Date style
  final String seperator;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = _format(newValue.text, seperator);
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    final String newValue = value.replaceAll(seperator, "");
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < math.min(newValue.length, 8); i++) {
      buffer.write(newValue[i]);
      if ((i == 3 || i == 5) && i != newValue.length - 1) {
        buffer.write(seperator);
      }
    }

    return buffer.toString();
  }

  /// Move curso to end
  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
