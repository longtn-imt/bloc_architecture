import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/config.dart';
import '../../utils/log_utils.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver({
    this.logOnChange = Config.logOnBlocChange,
    this.logOnCreate = Config.logOnBlocCreate,
    this.logOnClose = Config.logOnBlocClose,
    this.logOnError = Config.logOnBlocError,
    this.logOnEvent = Config.logOnBlocEvent,
    this.logOnTransition = Config.logOnBlocTransition,
  });

  final bool logOnChange;
  final bool logOnCreate;
  final bool logOnClose;
  final bool logOnError;
  final bool logOnEvent;
  final bool logOnTransition;

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (logOnChange) {
      LogUntils.d('onChange $change', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    if (logOnCreate) {
      LogUntils.d('created', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    if (logOnClose) {
      LogUntils.d('closed', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (logOnError) {
      LogUntils.d('onError $error', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (logOnEvent) {
      LogUntils.d('onEvent $event', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    if (logOnTransition) {
      LogUntils.d('onTransition $transition', name: bloc.runtimeType.toString());
    }
  }
}
