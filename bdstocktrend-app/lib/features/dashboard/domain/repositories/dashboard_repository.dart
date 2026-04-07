import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/dashboard/domain/entities/dashboard.dart';
import 'package:dartz/dartz.dart';

abstract class DashboardRepository {

  Future<Either<Failure, Dashboard>> dashboardStatistics();
}
