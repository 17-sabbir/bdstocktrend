part of 'company_details_cubit.dart';

@freezed
class CompanyDetailsState with _$CompanyDetailsState {
  const factory CompanyDetailsState.loading() = _Loading;
  const factory CompanyDetailsState.success(CompanyDetails data) = _Success;
  const factory CompanyDetailsState.failure(String message) = _Failure;
}