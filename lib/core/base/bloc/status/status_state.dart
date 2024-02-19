part of 'status_cubit.dart';

/// State of [StatusCubit]
@freezed
class StatusState with _$StatusState {
  /// Creates a loading state
  const factory StatusState.loading() = _Loading;

  /// Creates a success state
  const factory StatusState.success() = _Success;

  /// Creates a error state
  const factory StatusState.error([Exception? exception]) = _Error;

  /// Creates a inital state
  const factory StatusState.inital() = _Inital;

  const StatusState._();

  /// Check state is loading
  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  /// Check state is success
  bool get isSuccess => maybeWhen(success: () => true, orElse: () => false);

  /// Check state is inital
  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  /// Check state is loading
  bool get isInital => maybeWhen(inital: () => true, orElse: () => false);

  /// Get exception of status
  Exception? get exception => whenOrNull(error: (Exception? exception) => exception);
}
