import 'package:flutter/material.dart';

import '../../../core/base/base.dart';
import '../../../core/theme/theme.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const HomeEvent.started());
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: AppAssets.images.flutter.image()),
          ElevatedButton(
            onPressed: () => bloc.add(const HomeEvent.testApi()),
            child: const Text('Test api'),
          )
        ],
      ),
    );
  }
}
