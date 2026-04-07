
import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:dartz/dartz.dart';

abstract class DashboardRemoteDatasource {
  Future<Either<Failure, DashboardResponse>> dashboardStatistics();
}

class DashboardRemoteDatasourceImpl implements DashboardRemoteDatasource {
  final DioClient _client;

  DashboardRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, DashboardResponse>> dashboardStatistics() async {
    final response = await _client.getRequest(
      ListAPI.dashboard,
      converter: (response) =>
          DashboardResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

}