// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompaniesResponseImpl _$$CompaniesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CompaniesResponseImpl(
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$CompaniesResponseImplToJson(
        _$CompaniesResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'error': instance.error,
    };

_$DataCompanyImpl _$$DataCompanyImplFromJson(Map<String, dynamic> json) =>
    _$DataCompanyImpl(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      sector: json['sector'] as String?,
      website: json['website'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$$DataCompanyImplToJson(_$DataCompanyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'sector': instance.sector,
      'website': instance.website,
      'logo': instance.logo,
    };
