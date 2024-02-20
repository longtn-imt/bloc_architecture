import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/login_form.dart';
import '../model/respone/user.dart';

part 'auth_client.g.dart';

/// RestAPI authen
@injectable
@RestApi()
abstract class AuthClient {
  /// Create an AuthClient
  @factoryMethod
  factory AuthClient(Dio dio, {@Named('BaseUrl') String baseUrl}) = _AuthClient;

  /// Api login return user
  @POST('/login')
  Future<User> login(@Body() LoginForm form);

  /// Get auth token request api
  @POST('/token')
  Future<String> token();
}
