import 'package:flutter/material.dart';

import '../../../core/widget/view/app_split_view.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key, required this.navigator});

  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return AppSplitView(
      secondaryView: navigator,
      primaryView: _buildMenu(context),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu screen')),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(leading: const FlutterLogo(), title: Text('Menu item $index'));
        },
      ),
    );
  }
}
