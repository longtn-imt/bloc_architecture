part of "auth_bloc.dart";

/// State authen of Appp
@freezed
class AuthState with _$AuthState {
  /// State not login app
  const factory AuthState.unregistered() = _Unregistered;

  /// State has login user app
  const factory AuthState.loggedIn({required User user}) = _LoggedIn;

  /// State login user expired
  const factory AuthState.sessionExpired({required User user}) = _SessionExpired;

  const AuthState._();

  /// Create state form JSON
  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);

  /// Check has login
  bool get isAuthenticated => maybeWhen<bool>(loggedIn: (_) => true, orElse: () => false);

  /// Get login user
  User? get userLogged => whenOrNull<User>(loggedIn: (User user) => user);
}
