part of 'company_list_cubit.dart';

@freezed
class CompanyListState with _$CompanyListState {
  const factory CompanyListState.loading() = _Loading;
  const factory CompanyListState.success(Companies data) = _Success;
  const factory CompanyListState.failure(String message) = _Failure;
  const factory CompanyListState.empty() = _Empty;
}
