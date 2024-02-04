import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../data/dio/logging_interceptor.dart';
import '../../data/dio/token_interceptor.dart';
import '../../module/app/bloc/app_bloc.dart';
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

@module
abstract class InjectStorage {
  @prod
  @dev
  @singleton
  @Named('LocalStorageBox')
  Future<Box<dynamic>> get localStorageBox => Hive.openBox(Config.localStorageName);

  @test
  @singleton
  @Named('LocalStorageBox')
  Future<Box<dynamic>> get testlocalStorageBox => Hive.openBox('TestLocalStorage');

  @singleton
  Future<Box<AppState>> get appBox => Hive.openBox('AppBox');
}
