import "package:flutter/widgets.dart";

/// Config default value dimens for Widget
class AppDimens {
  AppDimens._();

  /// Width of dialog (Px)
  static const double dialogWidth = 300;

  /// Gap of dialog (Px)
  static const double dialogGap = 24;

  /// Padding of dialog (Px)
  static const EdgeInsets dialogPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 24);

  /// Radius of dialog (Px)
  static const BorderRadius dialogRadius = BorderRadius.all(Radius.circular(10));

  /// Padding of card (Px)
  static const EdgeInsets cardPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 10);

  /// Gap of card (Px)
  static const double cardGap = 12;
}
