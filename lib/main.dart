import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/utils/log_utils.dart';
import 'data/database/hive_type_id.dart';
import 'module/app/app.dart';

void main() async {
  runZonedGuarded(() async {
    /// Show splash screen
    App.preserveSplash(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

    /// Hive
    await Hive.initFlutter();
    HiveTypeId.init();

    /// Inital App
    await App.resolveDependencies();
    runApp(const App());
  }, LogUntils.recordError);
}
