import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/auth/auth.dart';
import 'package:bd_stock_trend/features/auth/data/models/user_dto.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/change_password_params.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/update_profile_params.dart';
import 'package:bd_stock_trend/utils/services/hive/hive.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    final response = await authRemoteDatasource.login(loginParams);

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) async {
        await mainBoxMixin.addData(
            MainBoxKeys.username, loginResponse.username);
        await mainBoxMixin.addData(MainBoxKeys.roles, loginResponse.roles);
        await mainBoxMixin.addData(MainBoxKeys.email, loginParams.email);
        await mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        await mainBoxMixin.addData(MainBoxKeys.token, loginResponse.token);

        return Right(loginResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, Register>> register(
    RegisterParams registerParams,
  ) async {
    final response = await authRemoteDatasource.register(registerParams);

    return response.fold(
      (failure) => Left(failure),
      (registerResponse) {
        return Right(registerResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, UserDto>> updateProfile(
      UpdateProfileParams params) async {
    final response = await authRemoteDatasource.updateProfile(params);
    return response.fold(
      (failure) => Left(failure),
      (userDto) {
        // Update local storage
        if (userDto.name != null) {
          mainBoxMixin.addData(MainBoxKeys.username, userDto.name);
          // Note: username key stores name based on logic in login?
          // Actually loginResponse.username usually maps to name or username.
          // Let's assume we update relevant fields.
        }
        return Right(userDto);
      },
    );
  }

  @override
  Future<Either<Failure, String>> changePassword(
      ChangePasswordParams params) async {
    return await authRemoteDatasource.changePassword(params);
  }
}
