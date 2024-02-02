import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

/// Base error page, show this page if your page get error
class AppErrorPage extends StatelessWidget {
  const AppErrorPage(this.errorDetails, {super.key});

  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.bug_report, size: 50),
          Text(_stringify(errorDetails.exception), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  static String _stringify(Object? exception) {
    try {
      return exception.toString();
    } catch (_) {}
    return 'Error';
  }
}

/// Base error widget, show this widget if your widget go wrong
/// Something likes wrong image path, loading fail......
class AppErrorrWidget extends StatelessWidget {
  const AppErrorrWidget(this.errorDetails, {super.key, this.widget});

  final FlutterErrorDetails errorDetails;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Placeholder(child: Icon(Icons.bug_report, color: context.colorScheme.error, size: 50));
  }
}
