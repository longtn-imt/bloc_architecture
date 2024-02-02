import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract class Config {
  static const bool enableGeneralLog = kDebugMode;
  static const bool isPrettyJson = kDebugMode;
  static Environment? get environment => switch (const String.fromEnvironment('FLAVOR').toLowerCase()) {
        Environment.dev => dev,
        Environment.test => test,
        Environment.prod => prod,
        String() => null,
      };

  /// network
  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const Duration timeout = Duration(seconds: 10);
  static const int maxRetries = 1;

  /// bloc observer
  static const bool logOnBlocChange = false;
  static const bool logOnBlocCreate = false;
  static const bool logOnBlocClose = false;
  static const bool logOnBlocError = kDebugMode;
  static const bool logOnBlocEvent = kDebugMode;
  static const bool logOnBlocTransition = false;

  /// navigator observer
  static const bool enableErrorPage = kReleaseMode;
  static const bool enableNavigatorObserverLog = kDebugMode;

  /// log interceptor
  static const bool enableLogNetworkException = kDebugMode;
  static const bool enableLogRequestInfo = kDebugMode;

  /// Deep link
  static const String deepLinkUrl = String.fromEnvironment('DEEP_LINK_URL');
}
