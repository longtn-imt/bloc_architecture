import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../data/dio/logging_interceptor.dart';
import '../../data/dio/token_interceptor.dart';
import 'config.dart';
import 'injector.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection({String? environment, EnvironmentFilter? environmentFilter}) => getIt.init(
      environment: environment,
      environmentFilter: environmentFilter,
    );

@module
abstract class InjectApiModule {
  @LazySingleton()
  Dio createDio() => Dio()
    ..interceptors.add(LoggingInterceptor())
    ..interceptors.add(TokenInterceptor());

  @prod
  @dev
  @Named('BaseUrl')
  String get baseUrl => Config.baseUrl;

  @test
  @Named('BaseUrl')
  String get testBaseUrl => 'https://mock';
}
