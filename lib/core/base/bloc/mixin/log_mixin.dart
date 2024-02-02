import '../../../utils/log_utils.dart';

mixin LogMixin on Object {
  void logD(String message, {DateTime? time}) {
    LogUntils.d(message, name: runtimeType.toString(), time: time);
  }

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
