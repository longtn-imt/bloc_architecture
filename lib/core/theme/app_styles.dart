import 'package:flutter/material.dart';

import 'fonts.gen.dart';

class AppStyles {
  const AppStyles._();

  static double? textScaleFactor(BuildContext context, {double maxTextScaleFactor = 1}) {
    final double width = MediaQuery.of(context).size.width;
    if (width > 390) return null;

    return (width / 390).clamp(0.1, maxTextScaleFactor);
  }

  static const TextStyle s14w400Inter = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.inter,
  );
}
