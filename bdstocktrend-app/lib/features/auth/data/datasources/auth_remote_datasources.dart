import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/auth/auth.dart';
import 'package:bd_stock_trend/features/auth/data/models/user_dto.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/change_password_params.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/update_profile_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, RegisterResponse>> register(
    RegisterParams registerParams,
  );

  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams);

  Future<Either<Failure, UserDto>> updateProfile(UpdateProfileParams params);

  Future<Either<Failure, String>> changePassword(ChangePasswordParams params);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, RegisterResponse>> register(
    RegisterParams registerParams,
  ) async {
    final response = await _client.postRequest(
      ListAPI.register,
      data: registerParams.toJson(),
      converter: (response) =>
          RegisterResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(
      ListAPI.login,
      data: loginParams.toJson(),
      converter: (response) =>
          LoginResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, UserDto>> updateProfile(
      UpdateProfileParams params) async {
    final response = await _client.putRequest(
      ListAPI.updateProfile,
      data: params.toJson(),
      converter: (response) =>
          UserDto.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, String>> changePassword(
      ChangePasswordParams params) async {
    final response = await _client.postRequest(
      ListAPI.changePassword,
      data: params.toJson(),
      converter: (response) => response.toString(),
    );

    return response;
  }
}
