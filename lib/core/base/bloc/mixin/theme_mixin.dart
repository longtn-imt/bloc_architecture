import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import "../../../extension/extenstion.dart";
import "../../../theme/theme.dart";

/// Common find class theme
mixin ThemeMixin<T extends StatefulWidget> on State<T> {
  /// Callers can lookup localized strings with an instance of AppLocalizations
  late AppLocalizations l10n;

  /// A set of 30 colors based on the Material spec that can be used to configure the color properties of most components.
  late ColorScheme colorScheme;

  /// App design
  late AppThemeData appThemes;

  /// Material design text theme.
  late TextTheme textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    l10n = context.l10n;
    colorScheme = context.colorScheme;
    appThemes = context.appTheme;
    textTheme = context.textTheme;
  }

  @override
  void setState(void Function() fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
