import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";

import "../../../core/base/base.dart";
import "../../../data/model/respone/user.dart";

part "auth_bloc.freezed.dart";
part "auth_bloc.g.dart";
part "auth_event.dart";
part "auth_state.dart";

/// [AuthBloc] is using to manage states and events of authen
/// Please go to [BaseBloc] to see more information about runBlocCatching
@singleton
class AuthBloc extends HydratedBaseBloc<AuthEvent, AuthState> {
  /// Create an AuthBloc
  AuthBloc() : super(const AuthState.unregistered()) {
    on<_Login>((_Login event, Emitter<AuthState> emit) => emit.call(AuthState.loggedIn(user: event.user)));
    on<_Logout>((_Logout event, Emitter<AuthState> emit) => emit.call(const AuthState.unregistered()));
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) => AuthState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();
}
