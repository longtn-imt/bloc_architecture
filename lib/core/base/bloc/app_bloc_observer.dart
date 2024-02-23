import "package:flutter_bloc/flutter_bloc.dart";

import "../../config/config.dart";
import "../../utils/log_utils.dart";

/// Observing the behavior of [Bloc] instances.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (Config.logOnBlocChange) {
      LogUntils.d("onChange $change", name: bloc.runtimeType.toString());
    }
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    if (Config.logOnBlocCreate) {
      LogUntils.d("created", name: bloc.runtimeType.toString());
    }
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    if (Config.logOnBlocClose) {
      LogUntils.d("closed", name: bloc.runtimeType.toString());
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (Config.logOnBlocError) {
      LogUntils.d("onError $error", name: bloc.runtimeType.toString());
    }
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (Config.logOnBlocEvent) {
      LogUntils.d("onEvent $event", name: bloc.runtimeType.toString());
    }
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    if (Config.logOnBlocTransition) {
      LogUntils.d("onTransition $transition", name: bloc.runtimeType.toString());
    }
  }
}
