part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unregistered() = _Unregistered;

  const factory AuthState.loggedIn({required User user}) = _LoggedIn;

  const factory AuthState.sessionExpired({required User user}) = _SessionExpired;

  const AuthState._();

  bool get isAuthenticated => maybeWhen<bool>(loggedIn: (_) => true, orElse: () => false);

  User? get userLogged => whenOrNull<User>(loggedIn: (User user) => user);
}
