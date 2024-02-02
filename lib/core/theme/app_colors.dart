import 'package:flutter/material.dart';

import 'colors.gen.dart';

class AppColors {
  const AppColors.light({
    this.primary = XmlColors.primary,
    this.error = XmlColors.error,
    this.background = XmlColors.white,
    this.foreground = XmlColors.black,
  });

  factory AppColors.dark() {
    return const AppColors.light(
      background: XmlColors.black,
      foreground: XmlColors.white,
    );
  }

  final Color primary;
  final Color error;
  final Color background;
  final Color foreground;
}
