// ignore_for_file: public_member_api_docs, avoid_multiple_declarations_per_line, diagnostic_describe_all_properties

import "package:flutter/material.dart";

import "../../theme/theme.dart";

class AppCard extends StatelessWidget {
  const AppCard({
    required this.content,
    super.key,
    this.leading,
    this.leadingGap = AppDimens.cardGap,
    this.trailing,
    this.trailingGap = AppDimens.cardGap,
    this.bottom,
    this.bottomGap = AppDimens.cardGap,
    this.height,
    this.width,
    this.padding = AppDimens.cardPadding,
    this.margin,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.decoration,
  });

  final Widget content;
  final Widget? leading, trailing, bottom;
  final double leadingGap, trailingGap, bottomGap;
  final double? height, width;
  final EdgeInsetsGeometry? padding, margin;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: <Widget>[
              if (leading != null) ...<Widget>[
                leading!,
                SizedBox(width: leadingGap),
              ],
              Expanded(child: content),
              if (trailing != null) ...<Widget>[
                SizedBox(width: trailingGap),
                trailing!,
              ],
            ],
          ),
          if (bottom != null) ...<Widget>[
            SizedBox(height: bottomGap),
            bottom!,
          ],
        ],
      ),
    );
  }
}
