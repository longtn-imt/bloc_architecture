import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form.freezed.dart';
part 'login_form.g.dart';

@freezed
class LoginForm with _$LoginForm {
  const factory LoginForm({
    String? phone,
    String? email,
    String? password,
  }) = _LoginForm;

  const LoginForm._();

  factory LoginForm.fromJson(Map<String, dynamic> json) => _$LoginFormFromJson(json);
}
