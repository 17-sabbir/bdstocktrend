import 'package:bd_stock_trend/features/companies/domain/entities/companies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'companies_response.freezed.dart';
part 'companies_response.g.dart';

@freezed
class CompaniesResponse with _$CompaniesResponse {
  const factory CompaniesResponse({
    int? page,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
    List<DataCompany>? data,
    String? error,
  }) = _CompaniesResponse;

  const CompaniesResponse._();

  factory CompaniesResponse.fromJson(Map<String, dynamic> json) =>
      _$CompaniesResponseFromJson(json);

  Companies toEntity() {
    final listCompany = data!
        .map<Company>(
          (model) => Company(
            code: model.code ?? "",
            name: model.name ?? "",
            sector: model.sector ?? "",
            website: model.website ?? "",
            logo: model.logo ?? "",
          ),
        )
        .toList();

    return Companies(
      companies: listCompany,
      currentPage: page ?? 1,
      lastPage: totalPages ?? 1,
    );
  }
}

@freezed
class DataCompany with _$DataCompany {
  const factory DataCompany({
    int? id,
    String? code,
    String? name,
    String? sector,
    String? website,
    String? logo,
  }) = _DataCompany;

  factory DataCompany.fromJson(Map<String, dynamic> json) =>
      _$DataCompanyFromJson(json);
}
