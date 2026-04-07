import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'company_list_cubit.freezed.dart';
part 'company_list_state.dart';

class CompanyListCubit extends Cubit<CompanyListState> {
  CompanyListCubit(this._getCompanies) : super(const _Loading());
  final GetCompanies _getCompanies;

  Future<void> fetchCompanies(UsersParams userParams) async {
    /// Only show loading in 1 page
    await _fetchData(userParams);
  }

  Future<void> refreshCompanies(UsersParams usersParams) async {
    await _fetchData(usersParams);
  }

  Future<void> _fetchData(UsersParams usersParams) async {
    final data = await _getCompanies.call(usersParams);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        } else if (l is NoDataFailure) {
          emit(const _Empty());
        }
      },
      (r) => emit(_Success(r)),
    );
  }
}
