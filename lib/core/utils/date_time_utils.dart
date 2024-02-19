import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../extension/extenstion.dart';
import 'formatter_utils.dart';

/// Until handle DateTime
class DateTimeUtils {
  const DateTimeUtils._();

  /// Return a string representing format: yyyy-MM-dd
  static String convertToDate(DateTime dateTime) {
    return DateTimeFormatter.dateFormatHyphen.format(dateTime);
  }

  /// Return a string representing format: HH:mm:ss
  static String convertToTime(DateTime dateTime) {
    return DateTimeFormatter.timeFormat.format(dateTime);
  }

  /// Return a string representing format: HH:mm
  static String convertToTimeNoSecond(DateTime dateTime) {
    return DateTimeFormatter.timeNoSecondFormat.format(dateTime);
  }

  /// Return a string representing format: yyyy-MM-dd HH:mm:ss
  static String convertToDateTime(DateTime dateTime) {
    return DateTimeFormatter.dateTimeFormatHyphen.format(dateTime);
  }

  /// Return a string representing format: Now, few Seconds Ago, 1 minutes ago, 2 hours ago, 3 days ago,...
  static String convertToDateRelative(
    BuildContext context,
    DateTime dateTime, {
    Duration? formatAfter,
    Duration? timeShowNow = const Duration(seconds: 10),
  }) {
    final DateTime now = DateTime.now();
    final AppLocalizations l10n = context.l10n;
    // After now
    if (dateTime.isAfter(now)) {
      return convertToDateTime(dateTime);
    }
    // Before formatAfter
    final Duration difference = dateTime.difference(now).abs();
    if (formatAfter != null && difference >= formatAfter) {
      return convertToDateTime(dateTime);
    }
    // Less timeShowNow
    if (timeShowNow != null && difference < timeShowNow) {
      return l10n.now;
    }
    // Defaut
    if (difference < const Duration(minutes: 1)) {
      return l10n.fewSecondsAgo;
    } else if (difference < const Duration(hours: 1)) {
      return l10n.minutesRelative(difference.inMinutes);
    } else if (difference < const Duration(days: 1)) {
      return l10n.hoursRelative(difference.inHours);
    } else if (difference < const Duration(days: 30)) {
      return l10n.daysRelative(difference.inDays);
    } else if (difference < const Duration(days: 90)) {
      return convertToDate(dateTime);
    } else {
      return convertToDateTime(dateTime);
    }
  }
}
