import 'package:freezed_annotation/freezed_annotation.dart';

part 'companies.freezed.dart';

@freezed
class Companies with _$Companies {
  const factory Companies({
    List<Company>? companies,
    int? currentPage,
    int? lastPage,
  }) = _Companies;
}

@freezed
class Company with _$Company {
  const factory Company({
    int? id,
    String? code,
    String? name,
    String? sector,
    String? website,
    String? logo,
  }) = _Company;
}
