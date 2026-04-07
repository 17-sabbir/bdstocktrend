import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/companies/domain/entities/companies.dart';
import 'package:bd_stock_trend/features/companies/domain/entities/company_details.dart';
import 'package:bd_stock_trend/features/companies/domain/usecases/get_companies.dart';
import 'package:bd_stock_trend/features/companies/domain/usecases/get_company_details.dart';
import 'package:dartz/dartz.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, Companies>> companies(UsersParams usersParams);

  Future<Either<Failure, CompanyDetails>> companyDetails(CompanyParams params);
}
