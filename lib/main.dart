import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/utils/log_utils.dart';
import 'module/app/app.dart';

void main() async {
  runZonedGuarded(() async {
    /// Hive
    await Hive.initFlutter();

    /// Inital App
    await App.resolveDependencies();
    runApp(const App());
  }, LogUntils.recordError);
}
