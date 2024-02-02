part of 'status_cubit.dart';

@freezed
class StatusState with _$StatusState {
  const factory StatusState.loading() = _Loading;
  const factory StatusState.success() = _Success;
  const factory StatusState.error([Exception? exception]) = _Error;
  const factory StatusState.inital() = _Inital;

  const StatusState._();

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeWhen(success: () => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  bool get isInital => maybeWhen(inital: () => true, orElse: () => false);

  Exception? get exception => whenOrNull(error: (Exception? exception) => exception);
}
