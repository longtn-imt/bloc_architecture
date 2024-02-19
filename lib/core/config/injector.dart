import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../data/dio/logging_interceptor.dart';
import '../../data/dio/token_interceptor.dart';
import 'config.dart';
import 'injector.config.dart';

/// Object get instance
final GetIt getIt = GetIt.instance;

/// Inita load config from injectable
@injectableInit
void configureInjection({String? environment, EnvironmentFilter? environmentFilter}) => getIt.init(
      environment: environment,
      environmentFilter: environmentFilter,
    );

/// Module for network
@module
abstract class InjectApiModule {
  /// Create the default [Dio] instance with the default implementation based on different platforms.
  @LazySingleton()
  Dio createDio() => Dio()
    ..interceptors.add(LoggingInterceptor())
    ..interceptors.add(TokenInterceptor());

  /// Network base url from environment
  @prod
  @dev
  @Named('BaseUrl')
  String get baseUrl => Config.baseUrl;

  /// Network base url from environment test
  @test
  @Named('BaseUrl')
  String get testBaseUrl => 'https://mock';
}
