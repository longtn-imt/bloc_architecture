import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../extension/extenstion.dart';
import '../../../theme/theme.dart';

mixin ThemeMixin<T extends StatefulWidget> on State<T> {
  late AppLocalizations l10n;
  late ColorScheme colorScheme;
  late AppThemeData appThemes;
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
    if (mounted) super.setState(fn);
  }
}
