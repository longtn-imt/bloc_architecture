import "package:flutter/widgets.dart";

/// Common extension for TextStyle
extension TextStyleExtension on TextStyle {
  /// Use glyphs that have a more pronounced angle and typically a cursive style ("italic type").
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// A commonly used font weight that is heavier than normal.
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}

/// Common extension for String null
extension StringExtension on String? {
  /// Remove Leading and Trailing Spaces and remove Duplicate Spaces
  String? trimExtra() => this?.trim().replaceAll(RegExp(r"\s+"), " ");

  /// Compare sort ASC
  int compareASC(String? text, {bool caseSensitive = false}) {
    if (caseSensitive) {
      return this?.compareTo(text ?? "") ?? 0;
    }
    return this?.toLowerCase().compareTo(text?.toLowerCase() ?? "") ?? 0;
  }

  /// Compare sort DESC
  int compareDESC(String? text, {bool caseSensitive = false}) {
    return -compareASC(text, caseSensitive: caseSensitive);
  }
}
