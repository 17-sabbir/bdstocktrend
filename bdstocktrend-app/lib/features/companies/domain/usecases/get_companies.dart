import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/companies/domain/entities/companies.dart';
import 'package:bd_stock_trend/features/companies/domain/repositories/companies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_companies.freezed.dart';
part 'get_companies.g.dart';

class GetCompanies extends UseCase<Companies, UsersParams> {
  final CompaniesRepository _repo;

  GetCompanies(this._repo);

  @override
  Future<Either<Failure, Companies>> call(UsersParams params) =>
      _repo.companies(params);
}

@freezed
class UsersParams with _$UsersParams {
  const factory UsersParams({@Default(1) int page}) = _UsersParams;

  factory UsersParams.fromJson(Map<String, dynamic> json) =>
      _$UsersParamsFromJson(json);
}
