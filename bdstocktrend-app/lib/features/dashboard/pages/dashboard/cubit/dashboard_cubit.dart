import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboard _getDashboard;

  DashboardCubit(this._getDashboard) : super(const _Loading());

  Future<void> refreshDashboardData() async {
    await fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    final data = await _getDashboard.call(NoParams());

    data.fold(
            (l) {
              if (l is ServerFailure) {
                emit(_Failure(l.message ?? ""));
              }
            }, (r) => emit(_Success(r)),
    );
  }

}

