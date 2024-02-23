import "dart:async";

import "package:hydrated_bloc/hydrated_bloc.dart";

import "mixin/event_transformer_mixin.dart";
import "mixin/log_mixin.dart";
import "status/status_cubit.dart";

/// Specialized [BaseBloc] which handles initializing the [BaseBloc] state
/// based on the persisted state. This allows state to be persisted
/// across hot restarts as well as complete app restarts.
abstract class HydratedBaseBloc<Event, State> extends BaseBloc<Event, State> with HydratedMixin<State> {
  /// Creates a BaseBloc
  HydratedBaseBloc(super.initialState) {
    hydrate();
  }

  static Storage? _storage;

  /// Setter for instance of [Storage] which will be used to
  /// manage persisting/restoring the [Bloc] state.
  static set storage(Storage? storage) => _storage = storage;

  /// Instance of [Storage] which will be used to
  /// manage persisting/restoring the [Bloc] state.
  static Storage get storage {
    if (_storage == null) {
      throw const StorageNotFound();
    }
    return _storage!;
  }
}

/// Base config bloc for app
///
/// * support `runBlocCatching` for excute function safe
/// * support loading for page
abstract class BaseBloc<Event, State> extends BaseBlocDelegate<Event, State> with EventTransformerMixin<Event, State> {
  /// Creates a BaseBloc
  BaseBloc(super.initialState);
}

/// Delegate of BaseBloc
abstract class BaseBlocDelegate<E, S> extends Bloc<E, S> with LogMixin {
  /// Creates a BaseBlocDelegate
  BaseBlocDelegate(super.initialState);

  /// Status of bloc
  StatusCubit get statusCubit => _statusCubit ??= StatusCubit();
  StatusCubit? _statusCubit;

  /// Notifies the [Bloc] of a new [event] which triggers all corresponding [EventHandler] instances.
  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      logE("Cannot add new event $event because $runtimeType was closed");
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (error is Exception) {
      addException(error);
    }

    super.onError(error, stackTrace);
  }

  /// Add [Exception] for bloc
  void addException(Exception? exception) => statusCubit.errorEmitted(exception);

  /// Change status page to loading
  void showLoading() => statusCubit.loadingEmitted();

  /// Change status page to success or started
  void hideLoading({bool isSuccess = false}) => isSuccess ? statusCubit.successEmitted() : statusCubit.initalEmitted();

  /// Excute function safe
  Future<void> runBlocCatching<T>({
    required Future<T> Function() action,
    FutureOr<void> Function()? doOnEventStart,
    FutureOr<void> Function(T value)? doOnSuccess,
    FutureOr<void> Function(Exception exception)? doOnException,
    FutureOr<void> Function(Error error)? doOnError,
    FutureOr<void> Function()? doOnEventCompleted,
    bool handleLoading = true,
    bool handleError = true,
  }) async {
    try {
      await doOnEventStart?.call();

      if (handleLoading) {
        showLoading();
      }

      final T value = await action.call();

      if (handleLoading) {
        hideLoading(isSuccess: true);
      }

      await doOnSuccess?.call(value);
    } on Exception catch (e) {
      if (handleLoading) {
        hideLoading();
      }

      await doOnException?.call(e);

      if (handleError) {
        addException(e);
      }
    } on Error catch (e) {
      if (handleLoading) {
        hideLoading();
      }

      await doOnError?.call(e);

      if (handleError) {
        addError(e, e.stackTrace);
      }
    } finally {
      await doOnEventCompleted?.call();
    }
  }
}
