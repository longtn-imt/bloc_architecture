import "dart:async";

import "package:flutter/widgets.dart";

import "core/utils/log_utils.dart";
import "module/app/app.dart";

void main() async {
  await runZonedGuarded(() async {
    /// Show splash screen
    App.preserveSplash(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

    /// Inital App
    await App.resolveDependencies();
    runApp(const App());
  }, LogUntils.recordError);
}
