import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/companies/data/models/companies_response.dart';
import 'package:bd_stock_trend/features/companies/domain/usecases/get_companies.dart';
import 'package:bd_stock_trend/features/companies/domain/usecases/get_company_details.dart';
import 'package:dartz/dartz.dart';

import '../models/company_details_response.dart';

abstract class CompaniesRemoteDatasource {
  Future<Either<Failure, CompaniesResponse>> companies(UsersParams userParams);

  Future<Either<Failure, CompanyDetailsResponse>> companyDetails(
      CompanyParams params);
}

class CompaniesRemoteDatasourceImpl implements CompaniesRemoteDatasource {
  final DioClient _client;

  CompaniesRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, CompaniesResponse>> companies(
      UsersParams userParams) async {
    final response = await _client.getRequest(
      ListAPI.companies,
      queryParameters: userParams.toJson(),
      converter: (response) =>
          CompaniesResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, CompanyDetailsResponse>> companyDetails(
      CompanyParams params) async {
    final response = await _client.getRequest(
      Uri.encodeFull('${ListAPI.companies}/${params.code}'),
      // Parsing this payload is large and (for some companies like BATASHOE)
      // may contain numeric values as strings or nulls. Normalize first.
      // Also parse on the main isolate to avoid UI hanging on isolate errors.
      isIsolate: false,
      converter: (response) {
        final json = response as Map<String, dynamic>;
        return CompanyDetailsResponse.fromJson(
            _normalizeCompanyDetailsJson(json));
      },
    );

    return response;
  }
}

Map<String, dynamic> _normalizeCompanyDetailsJson(Map<String, dynamic> json) {
  final out = Map<String, dynamic>.from(json);
  final info = out['info'];
  if (info is Map) {
    out['info'] = _normalizeScripDetailsInfoJson(info.cast<String, dynamic>());
  }
  return out;
}

Map<String, dynamic> _normalizeScripDetailsInfoJson(Map<String, dynamic> info) {
  final out = Map<String, dynamic>.from(info);

  // Keys that must be non-null strings for `ScripDetailsInfoData`.
  const requiredStringKeys = <String>{
    'Scrip',
    'FullName',
    'Week52Range',
    'LastUpdate',
    'Change',
    'LastAGMHeld',
    'MarketCategory',
    'Electronic',
    'ShareHoldingPercentage',
    'ShareHoldingPercentage1',
    'ShareHoldingPercentage2',
    'PresentOs',
    'PresentLs',
    'Address',
    'Contact',
    'Email',
    'Web',
    'DayRange',
    'YE',
    'news1stdate',
    'news1sttitle',
    'news1stbody',
    'news2stdate',
    'news2sttitle',
    'news2stbody',
    'news3stdate',
    'news3sttitle',
    'news3stbody',
    'news4stdate',
    'news4sttitle',
    'news4stbody',
    'news5stdate',
    'news5sttitle',
    'news5stbody',
    'ma10',
    'ma20',
    'ma50',
    'ma100',
    'ma200',
    'maAVG',
    'ema10',
    'ema20',
    'ema50',
    'ema100',
    'ema200',
    'emaAVG',
    'stockBeta',
  };

  const intKeys = <String>{
    'ListingYear',
    'ShortLoan',
    'LongLoan',
  };

  const doubleKeys = <String>{
    'LastTrade',
    'Volume',
    'ClosePrice',
    'Week1Close',
    'Week52Close',
    'OpenPrice',
    'YCP',
    'MarketCap',
    'DaysValue',
    'TotalTrade',
    'AuthorizedCap',
    'PaidUpCap',
    'TotalSecurities',
    'ReserveSurplus',
    'SponsorDirector',
    'Govt',
    'Institute',
    'Foreign',
    'Public',
    'SponsorDirector1',
    'Govt1',
    'Institute1',
    'Foreign1',
    'Public1',
    'SponsorDirector2',
    'Govt2',
    'Institute2',
    'Foreign2',
    'Public2',
    'ChangePer',
    'EPS',
    'AuditedPE',
    'UnAuditedPE',
    'Q1Eps',
    'Q2Eps',
    'Q3Eps',
    'Q4Eps',
    'NAV',
    'NavPrice',
    'freefloat',
    'DividentYield',
  };

  for (final key in requiredStringKeys) {
    final v = out[key];
    if (v == null) {
      out[key] = '';
    } else if (v is! String) {
      out[key] = v.toString();
    }
  }

  for (final key in intKeys) {
    out[key] = _toInt(out[key]);
  }

  for (final key in doubleKeys) {
    out[key] = _toDouble(out[key]);
  }

  return out;
}

int _toInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) {
    final cleaned = value.trim();
    if (cleaned.isEmpty) return 0;
    final asInt = int.tryParse(cleaned);
    if (asInt != null) return asInt;
    final asDouble = double.tryParse(cleaned);
    if (asDouble != null) return asDouble.toInt();
  }
  return 0;
}

double _toDouble(dynamic value) {
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) {
    final cleaned = value.trim();
    if (cleaned.isEmpty) return 0.0;
    final parsed = double.tryParse(cleaned);
    if (parsed != null) return parsed;
  }
  return 0.0;
}
