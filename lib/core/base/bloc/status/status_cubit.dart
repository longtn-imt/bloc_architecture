import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "status_state.dart";
part "status_cubit.freezed.dart";

/// Status cubit of BaseBloc
class StatusCubit extends Cubit<StatusState> {
  /// Creates a StatusCubit
  StatusCubit() : super(const StatusState.inital());

  /// Change state to loading
  void loadingEmitted() => emit(const StatusState.loading());

  /// Change state to error
  void errorEmitted([Exception? exception]) => emit(StatusState.error(exception));

  /// Change state to success
  void successEmitted() => emit(const StatusState.success());

  /// Change state to inital
  void initalEmitted() => emit(const StatusState.inital());
}
