import 'dart:async';

import 'package:flutter/material.dart';

import '../../extension/extenstion.dart';
import '../../theme/theme.dart';

extension AppDialogExt on BuildContext {
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

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.alignment = Alignment.center,
    this.dialogWidth = AppDimens.dialogWidth,
    this.padding = AppDimens.dialogPadding,
    this.dialogPadding = AppDimens.dialogPadding,
    this.radius = AppDimens.dialogRadius,
    required this.child,
  });

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
  })  : assert(title != null || content != null),
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
              if (action != null) ...<Widget>[SizedBox(height: gap), action]
            ],
          );
        });

  final Alignment? alignment;
  final double? dialogWidth;
  final EdgeInsets? padding;
  final EdgeInsets? dialogPadding;
  final BorderRadius radius;
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
}
