part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  /// Event add user into app
  const factory AuthEvent.login(User user) = _Login;

  /// Event remove user into app
  const factory AuthEvent.logout() = _Logout;
}
