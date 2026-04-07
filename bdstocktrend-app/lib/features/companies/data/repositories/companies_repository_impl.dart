import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/companies/data/datasources/company_remote_datasources.dart';
import 'package:bd_stock_trend/features/companies/domain/entities/companies.dart';
import 'package:bd_stock_trend/features/companies/domain/entities/company_details.dart';
import 'package:bd_stock_trend/features/companies/domain/repositories/companies_repository.dart';
import 'package:bd_stock_trend/features/companies/domain/usecases/get_companies.dart';
import 'package:bd_stock_trend/features/companies/domain/usecases/get_company_details.dart';
import 'package:dartz/dartz.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  /// Data Source
  final CompaniesRemoteDatasource usersRemoteDatasource;

  const CompaniesRepositoryImpl(this.usersRemoteDatasource);

  @override
  Future<Either<Failure, Companies>> companies(UsersParams usersParams) async {
    final response = await usersRemoteDatasource.companies(usersParams);

    return response.fold(
      (failure) => Left(failure),
      (companiesResponse) {
        if (companiesResponse.data?.isEmpty ?? true) {
          return Left(NoDataFailure());
        }
        return Right(companiesResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, CompanyDetails>> companyDetails(
      CompanyParams params) async {
    final response = await usersRemoteDatasource.companyDetails(params);

    return response.fold(
      (failure) => Left(failure),
      (res) {
        if (res.info == null) {
          return const Left(ServerFailure('Company info unavailable'));
        }
        try {
          return Right(res.toEntity());
        } catch (_) {
          return const Left(ServerFailure('Invalid company details response'));
        }
      },
    );
  }
}
