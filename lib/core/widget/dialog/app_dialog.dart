import "dart:async";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "../../extension/extenstion.dart";
import "../../theme/theme.dart";

/// Common extension for Dialog
extension AppDialogExt on BuildContext {
  /// Displays a Material dialog above the current contents of the app,
  /// with Material entrance and exit animations, modal barrier color,
  /// and modal barrier behavior (dialog is dismissible with a tap on the barrier).
  Future<T?> showAppDialog<T>(
    AppDialog dialog, {
    bool useRootNavigator = true,
    bool closeOnTapOutside = true,
  }) =>
      showDialog(
        context: this,
        useRootNavigator: useRootNavigator,
        barrierDismissible: closeOnTapOutside,
        builder: (BuildContext context) => dialog,
      );
}

/// Dialog design for App
class AppDialog extends StatelessWidget {
  /// Create an AppDialog
  const AppDialog({
    required this.child,
    super.key,
    this.alignment = Alignment.center,
    this.dialogWidth = AppDimens.dialogWidth,
    this.padding = AppDimens.dialogPadding,
    this.dialogPadding = AppDimens.dialogPadding,
    this.radius = AppDimens.dialogRadius,
  });

  /// Create common an AppDialog with:
  ///
  /// - Title
  /// - Content
  /// - Action
  AppDialog.common({
    super.key,
    this.alignment = Alignment.center,
    this.dialogWidth = AppDimens.dialogWidth,
    this.padding = AppDimens.dialogPadding,
    this.dialogPadding = AppDimens.dialogPadding,
    this.radius = AppDimens.dialogRadius,
    double gap = AppDimens.dialogGap,
    Widget? image,
    Widget? title,
    Widget? content,
    Widget? action,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  })  : assert(title != null || content != null, "a must not be null title or content"),
        child = Builder(builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisAlignment: mainAxisAlignment,
            children: <Widget>[
              if (image != null) ...<Widget>[Center(child: image), SizedBox(height: gap)],
              if (title != null)
                DefaultTextStyle.merge(
                  style: context.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                  child: title,
                ),
              if (title != null && content != null) SizedBox(height: gap),
              if (content != null)
                DefaultTextStyle.merge(
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  child: content,
                ),
              if (action != null) ...<Widget>[SizedBox(height: gap), action],
            ],
          );
        });

  /// How to align the [Dialog].
  ///
  /// If null, then [DialogTheme.alignment] is used. If that is also null, the
  /// default is [Alignment.center].
  final Alignment? alignment;

  /// The amount of padding added to [MediaQueryData.viewInsets] on the outside
  /// of the dialog. This defines the minimum space between the screen's edges
  /// and the dialog.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 15, vertical: 24)`.
  final EdgeInsets? dialogPadding;

  /// Max width the [Dialog].
  final double? dialogWidth;

  /// Radius the [Dialog].
  final BorderRadius radius;

  /// Padding the [Dialog].
  final EdgeInsets? padding;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Dialog(
      elevation: 0,
      alignment: alignment,
      insetPadding: dialogPadding,
      shape: RoundedRectangleBorder(borderRadius: radius),
      backgroundColor: colors.background,
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Container(
          width: dialogWidth,
          padding: padding,
          child: child,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Alignment?>("alignment", alignment))
      ..add(DiagnosticsProperty<EdgeInsets?>("dialogPadding", dialogPadding))
      ..add(DoubleProperty("dialogWidth", dialogWidth))
      ..add(DiagnosticsProperty<EdgeInsets?>("padding", padding))
      ..add(DiagnosticsProperty<BorderRadius>("radius", radius));
  }
}
