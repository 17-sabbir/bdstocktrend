import 'package:bd_stock_trend/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    int? id,
    String? username,
    String? token,
    String? error,
    String? message,
    List<String>? roles,
  }) = _LoginResponse;

  const LoginResponse._();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Login toEntity() => Login(token: token, username: username);
}
