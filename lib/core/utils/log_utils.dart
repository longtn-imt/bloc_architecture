import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import '../config/config.dart';

class LogUntils {
  const LogUntils._();

  static const bool _enableLog = Config.enableGeneralLog;

  static void d(
    Object? message, {
    String? name,
    DateTime? time,
  }) {
    log('💡 $message', name: name ?? '', time: time);
  }

  static void e(
    Object? errorMessage, {
    String? name,
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    log(
      '💢 $errorMessage',
      name: name ?? '',
      error: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }

  static void recordError(Object error, StackTrace stack) => e('RecordError', errorObject: error, stackTrace: stack);

  static String prettyJson(Object json) {
    if (!Config.isPrettyJson) {
      return json.toString();
    }

    const JsonEncoder encoder = JsonEncoder.withIndent('\t');

    return encoder.convert(json);
  }

  static void log(
    String message, {
    int level = 0,
    String name = '',
    DateTime? time,
    int? sequenceNumber,
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (_enableLog) {
      dev.log(
        message,
        name: name,
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
