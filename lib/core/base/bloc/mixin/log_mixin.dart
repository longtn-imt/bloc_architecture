import '../../../utils/log_utils.dart';

/// Common function Log
mixin LogMixin on Object {
  /// Log data
  void logD(String message, {DateTime? time}) {
    LogUntils.d(message, name: runtimeType.toString(), time: time);
  }

  /// Log error
  void logE(
    Object? errorMessage, {
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    LogUntils.e(
      errorMessage,
      name: runtimeType.toString(),
      errorObject: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }
}
