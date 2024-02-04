import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

/// Local key-value database
@singleton
class LocalStorage {
  @factoryMethod
  factory LocalStorage(@Named('LocalStorageBox') Box<dynamic> box) {
    return LocalStorage._(box);
  }

  const LocalStorage._(this._box);

  /* ------------------ HIVE STORAGE ----------------------- */

  final Box<dynamic>? _box;

  /// Generates a secure encryption key using the fortuna random algorithm.
  String generateSecureKey() => base64UrlEncode(Hive.generateSecureKey());

  /// Returns a [ValueListenable] which notifies its listeners when an entry in the box changes.
  ValueListenable<Box<dynamic>> listenable({List<dynamic>? keys}) => _box!.listenable(keys: keys);

  /// Return the value associated with the given [key]. If the key does not exist, `null` is returned.
  T? getItem<T>(Object key, {T? defaultValue}) {
    try {
      return _box!.get(key, defaultValue: defaultValue);
    } catch (_) {
      _box?.delete(key);

      return null;
    }
  }

  /// Return the [List] value associated with the given [key]. If the key does not exist, `null` is returned.
  List<T>? getItems<T>(Object key, {List<T>? defaultValue}) {
    try {
      return (_box!.get(key, defaultValue: defaultValue) as List<dynamic>?)?.whereType<T>().toList();
    } catch (_) {
      _box?.delete(key);

      return null;
    }
  }

  /// Set the value for the key to common get storage
  /// Can save String, int, double, Map
  Future<void> saveItem<T>(Object key, T? value) {
    if (value != null) {
      return _box!.put(key, value);
    } else {
      return _box!.delete(key);
    }
  }

  /// Erases get storage keys
  Future<void> clear() => _box!.clear();
}
