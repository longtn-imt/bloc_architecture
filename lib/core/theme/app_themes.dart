import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "app_colors.dart";
import "colors.gen.dart";

/// Config theme for App
class AppThemes {
  const AppThemes._();

  /// Theme light
  static ThemeData themeData = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AssetColors.primary,
      accentColor: AssetColors.secondary,
      backgroundColor: AssetColors.white,
      errorColor: AssetColors.error,
    ),
  );

  /// Theme dark
  static ThemeData darkThemeData = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: AssetColors.primary,
      accentColor: AssetColors.secondary,
      backgroundColor: AssetColors.black,
      errorColor: AssetColors.error,
    ),
  );
}

/// App design [AppColors], [ThemeMode], [Locale].
class AppThemeData extends InheritedWidget {
  /// Create an AppThemeData
  const AppThemeData({
    required this.themeMode,
    required this.appColors,
    required super.child,
    super.key,
    this.locale,
  });

  /// An identifier used to select a user's language and formatting preferences.
  final Locale? locale;

  /// Describes which theme will be used by [MaterialApp].
  final ThemeMode themeMode;

  /// Custom color for app
  final AppColors appColors;

  /// Returns the nearest widget of the given AppThemeData
  static AppThemeData? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppThemeData>();

  /// Returns the nearest widget of the given AppThemeData
  static AppThemeData of(BuildContext context) {
    final AppThemeData? result = maybeOf(context);
    assert(result != null, "No AppThemeData found in context");

    return result!;
  }

  @override
  bool updateShouldNotify(covariant AppThemeData oldWidget) {
    return appColors != oldWidget.appColors || themeMode != oldWidget.themeMode || locale != oldWidget.locale;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<ThemeMode>("themeMode", themeMode))
      ..add(DiagnosticsProperty<Locale?>("locale", locale))
      ..add(DiagnosticsProperty<AppColors>("appColors", appColors));
  }
}
