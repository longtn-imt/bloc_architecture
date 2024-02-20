import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

/// Local key-value database
@singleton
class LocalStorage {
  /// Returns an instance of [LocalStorage]. [storage] is required.
  @factoryMethod
  factory LocalStorage(HydratedStorage storage) {
    return LocalStorage._(storage);
  }

  const LocalStorage._(this._storage);

  /* ------------------ HYDRATED STORAGE ----------------------- */

  final HydratedStorage _storage;

  /// Return the value associated with the given [key]. If the key does not exist, `null` is returned.
  T? getItem<T>(Object key, {T? defaultValue}) {
    try {
      return _storage.read(key.toString()) as T;
    } on Object catch (_) {
      unawaited(_storage.delete(key.toString()));

      return defaultValue;
    }
  }

  /// Return the [List] value associated with the given [key]. If the key does not exist, `null` is returned.
  List<T>? getItems<T>(Object key, {List<T>? defaultValue}) {
    try {
      return (_storage.read(key.toString()) as List<dynamic>?)?.whereType<T>().toList();
    } on Object catch (_) {
      unawaited(_storage.delete(key.toString()));

      return defaultValue;
    }
  }

  /// Set the value for the key to common get storage
  /// Can save String, int, double, Map
  Future<void> saveItem<T>(Object key, T? value) {
    if (value != null) {
      return _storage.write(key.toString(), value);
    } else {
      return _storage.delete(key.toString());
    }
  }

  /// Erases get storage keys
  Future<void> clear() => _storage.clear();
}
