import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_state.dart';
part 'status_cubit.freezed.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(const StatusState.inital());

  void loadingEmitted() => emit(const StatusState.loading());

  void exceptionEmitted([Exception? exception]) => emit(StatusState.error(exception));

  void successEmitted() => emit(const StatusState.success());

  void initalEmitted() => emit(const StatusState.inital());
}
