import 'package:flutter/material.dart';

/// Issue: https://github.com/flutter/flutter/issues/99100
/// Adaptive navigation structures depending on the screen real estate
class AppSplitView extends StatefulWidget {
  const AppSplitView({
    super.key,
    this.breakpoint = 720.0,
    this.secondaryView = const SizedBox.shrink(),
    required this.primaryView,
  });

  /// The width threshold at which the secondary view will be shown.
  final double breakpoint;

  /// Widget to show when the secondary view
  final Widget secondaryView;

  /// The root page.
  final Widget primaryView;

  @override
  State<AppSplitView> createState() => AppSplitViewState();
}

class AppSplitViewState extends State<AppSplitView> {
  bool _hasSplitted = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _hasSplitted = constraints.maxWidth >= widget.breakpoint;

        if (_hasSplitted) {
          return Row(
            children: <Widget>[
              SizedBox(width: widget.breakpoint / 2, child: widget.primaryView),
              Expanded(child: widget.secondaryView),
            ],
          );
        }

        return widget.primaryView;
      },
    );
  }
}
