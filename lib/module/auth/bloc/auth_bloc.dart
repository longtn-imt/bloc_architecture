import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/base/base.dart';
import '../../../data/database/local_storage.dart';
import '../../../data/model/respone/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

/// [AuthBloc] is using to manage states and events of authen
/// Please go to [BaseBloc] to see more information about runBlocCatching
@singleton
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  @factoryMethod
  factory AuthBloc(LocalStorage localStorage) {
    final User? user = localStorage.getItem<User>(_AuthBlocKey.user.toString());

    if (user != null) {
      return AuthBloc._(AuthState.loggedIn(user: user), localStorage);
    } else {
      return AuthBloc._(const AuthState.unregistered(), localStorage);
    }
  }

  AuthBloc._(super.initialState, this._localStorage) {
    on<_Login>(_onLogin);
    on<_Logout>(_onLogout);
  }

  final LocalStorage _localStorage;

  @override
  bool get autoClose => false;

  /// Notifies its listeners when an user in the box changes
  Listenable userRefresh() => _localStorage.listenable(keys: <String>[_AuthBlocKey.user.toString()]);

  /// An act of logging in to app.
  /// * When start change state
  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) => runBlocCatching(
        doOnEventStart: () => emit.call(AuthState.loggedIn(user: event.user)),
        action: () => _localStorage.saveItem(_AuthBlocKey.user.toString(), event.user),
      );

  /// An act of exiting a app.
  /// * When start change state
  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) => runBlocCatching(
        doOnEventStart: () => emit.call(const AuthState.unregistered()),
        action: () => _localStorage.clear(),
      );
}

enum _AuthBlocKey { user }
