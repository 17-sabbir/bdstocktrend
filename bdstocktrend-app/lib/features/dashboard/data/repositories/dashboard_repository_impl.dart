import 'package:bd_stock_trend/core/error/failure.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:dartz/dartz.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  const DashboardRepositoryImpl(this.dashboardRemoteDatasource);

  @override
  Future<Either<Failure, Dashboard>> dashboardStatistics() async {
    final response = await dashboardRemoteDatasource.dashboardStatistics();

    return response.fold(
      (failure) => Left(failure),
      (dashboardResponse) => Right(dashboardResponse.toEntity()),
    );
  }
}
