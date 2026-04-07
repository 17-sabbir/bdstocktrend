import 'package:dartz/dartz.dart';
import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/auth/auth.dart';
import 'package:bd_stock_trend/features/auth/data/models/user_dto.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/change_password_params.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/update_profile_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams loginParams);

  Future<Either<Failure, Register>> register(RegisterParams registerParams);

  Future<Either<Failure, UserDto>> updateProfile(UpdateProfileParams params);

  Future<Either<Failure, String>> changePassword(ChangePasswordParams params);
}
