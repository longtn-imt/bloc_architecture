import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/base_bloc.dart';
import 'bloc/mixin/log_mixin.dart';
import 'bloc/mixin/theme_mixin.dart';
import 'bloc/status/status_cubit.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc<dynamic, dynamic>>
    extends BasePageStateDelegate<T, B> with LogMixin, ThemeMixin<T> {}

abstract class BasePageStateDelegate<T extends StatefulWidget, B extends BaseBloc<dynamic, dynamic>> extends State<T> {
  late final B bloc = GetIt.instance.get<B>();

  StatusState get status => bloc.statusCubit.state;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        if (bloc.autoClose) BlocProvider<B>(create: (_) => bloc) else BlocProvider<B>.value(value: bloc),
        BlocProvider<StatusCubit>(create: (_) => bloc.statusCubit),
      ],
      child: BlocConsumer<StatusCubit, StatusState>(
        bloc: bloc.statusCubit,
        listenWhen: handleListenWhen,
        listener: handleListener,
        buildWhen: handleBuildWhen,
        builder: handleBuilder,
      ),
    );
  }

  @protected
  bool handleListenWhen(StatusState previous, StatusState current) => current != previous;

  @protected
  bool handleBuildWhen(StatusState previous, StatusState current) => current != previous;

  @protected
  void handleListener(BuildContext context, StatusState state) {}

  @protected
  Widget handleBuilder(BuildContext context, StatusState state) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        buildPage(context),
        Visibility(
          visible: state.isLoading,
          child: const CircularProgressIndicator.adaptive(),
        ),
      ],
    );
  }

  Widget buildPage(BuildContext context);
}
