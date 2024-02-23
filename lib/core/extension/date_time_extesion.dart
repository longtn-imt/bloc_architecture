import "package:flutter/widgets.dart";

import "../utils/utils.dart";

/// Common extension for DateTime
extension DateTimeExtesion on DateTime {
  /// Format: yyyy.MM.dd
  String get toDateString => DateTimeUtils.convertToDate(this);

  /// Format: HH:mm:ss
  String get toTimeString => DateTimeUtils.convertToTime(this);

  /// Format: yyyy.MM.dd HH:mm:ss
  String get toDateTimeString => DateTimeUtils.convertToDateTime(this);

  /// Format: HH:mm
  String get toTimeNoSecondString => DateTimeUtils.convertToTimeNoSecond(this);

  /// Format: yyyy.MM.dd HH:mm
  String get toDateTimeNoSecondString {
    return "$toDateString $toTimeNoSecondString";
  }

  /// Format: Now, few Seconds Ago, 1 minutes ago, 2 hours ago, 3 days ago,...
  String toRelativeString(BuildContext context) => DateTimeUtils.convertToDateRelative(context, this);
}

/// Common extension for DateTime null
extension DateTimeNullExtesion on DateTime? {
  /// Format: yyyy.MM.dd
  String get toDateString => this?.toDateString ?? "";

  /// Format: HH:mm:ss
  String get toTimeString => this?.toTimeString ?? "";

  /// Format: yyyy.MM.dd HH:mm:ss
  String get toDateTimeString => this?.toDateTimeString ?? "";

  /// Format: HH:mm
  String get toTimeNoSecondString => this?.toTimeNoSecondString ?? "";

  /// Format: yyyy.MM.dd HH:mm
  String get toDateTimeNoSecondString => this?.toDateTimeNoSecondString ?? "";
}
