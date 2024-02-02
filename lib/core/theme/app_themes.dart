import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'colors.gen.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData themeData = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: XmlColors.primary),
  );

  static ThemeData darkThemeData = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: XmlColors.primary, brightness: Brightness.dark),
  );
}

class AppThemeData extends InheritedWidget {
  const AppThemeData({
    super.key,
    this.locale,
    required this.themeMode,
    required this.appColors,
    required super.child,
  });

  final Locale? locale;
  final ThemeMode themeMode;
  final AppColors appColors;

  static AppThemeData? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppThemeData>();

  static AppThemeData of(BuildContext context) {
    final AppThemeData? result = maybeOf(context);
    assert(result != null, 'No AppThemeData found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(covariant AppThemeData oldWidget) {
    return appColors != oldWidget.appColors || themeMode != oldWidget.themeMode || locale != oldWidget.locale;
  }
}
