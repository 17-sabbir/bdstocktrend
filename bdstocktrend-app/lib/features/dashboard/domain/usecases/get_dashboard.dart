import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:dartz/dartz.dart';

class GetDashboard extends UseCase<Dashboard, NoParams> {
  final DashboardRepository _dashboardRepository;

  GetDashboard(this._dashboardRepository);

  @override
  Future<Either<Failure, Dashboard>> call(NoParams params) {
    return _dashboardRepository.dashboardStatistics();
  }

}
