import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/auth/auth.dart';
import 'package:bd_stock_trend/features/auth/data/models/user_dto.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/update_profile_params.dart';
import 'package:dartz/dartz.dart';

class UpdateProfile extends UseCase<UserDto, UpdateProfileParams> {
  final AuthRepository _repo;

  UpdateProfile(this._repo);

  @override
  Future<Either<Failure, UserDto>> call(UpdateProfileParams params) =>
      _repo.updateProfile(params);
}
