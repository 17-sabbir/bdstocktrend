import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/auth/auth.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/change_password_params.dart';
import 'package:dartz/dartz.dart';

class ChangePassword extends UseCase<String, ChangePasswordParams> {
  final AuthRepository _repo;

  ChangePassword(this._repo);

  @override
  Future<Either<Failure, String>> call(ChangePasswordParams params) =>
      _repo.changePassword(params);
}
