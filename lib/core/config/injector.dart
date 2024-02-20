import 'dart:io' show Directory;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

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

/// Module for Storage
@module
abstract class InjectStorage {
  /// Sentinel directory used to determine that web storage should be used when initializing [HydratedStorage].
  @singleton
  Future<Directory> getStorageDirectory() {
    if (kIsWeb) {
      return Future<Directory>.value(HydratedStorage.webStorageDirectory);
    }
    return getApplicationDocumentsDirectory();
  }

  /// Returns an instance of [HydratedStorage]. [storageDirectory] is required.
  @prod
  @dev
  @singleton
  Future<HydratedStorage> getHydratedStorage(Directory storageDirectory) {
    return HydratedStorage.build(storageDirectory: storageDirectory);
  }

  /// Returns an instance of [HydratedStorage]. [storageDirectory] is required.
  @test
  @singleton
  Future<HydratedStorage> getHydratedStorageForTest(Directory storageDirectory) {
    return HydratedStorage.build(storageDirectory: storageDirectory);
  }
}
