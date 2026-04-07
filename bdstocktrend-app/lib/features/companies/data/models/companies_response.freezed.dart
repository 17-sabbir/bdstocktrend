// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'companies_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompaniesResponse _$CompaniesResponseFromJson(Map<String, dynamic> json) {
  return _CompaniesResponse.fromJson(json);
}

/// @nodoc
mixin _$CompaniesResponse {
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  List<DataCompany>? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompaniesResponseCopyWith<CompaniesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompaniesResponseCopyWith<$Res> {
  factory $CompaniesResponseCopyWith(
          CompaniesResponse value, $Res Function(CompaniesResponse) then) =
      _$CompaniesResponseCopyWithImpl<$Res, CompaniesResponse>;
  @useResult
  $Res call(
      {int? page,
      @JsonKey(name: 'per_page') int? perPage,
      int? total,
      @JsonKey(name: 'total_pages') int? totalPages,
      List<DataCompany>? data,
      String? error});
}

/// @nodoc
class _$CompaniesResponseCopyWithImpl<$Res, $Val extends CompaniesResponse>
    implements $CompaniesResponseCopyWith<$Res> {
  _$CompaniesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataCompany>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompaniesResponseImplCopyWith<$Res>
    implements $CompaniesResponseCopyWith<$Res> {
  factory _$$CompaniesResponseImplCopyWith(_$CompaniesResponseImpl value,
          $Res Function(_$CompaniesResponseImpl) then) =
      __$$CompaniesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page,
      @JsonKey(name: 'per_page') int? perPage,
      int? total,
      @JsonKey(name: 'total_pages') int? totalPages,
      List<DataCompany>? data,
      String? error});
}

/// @nodoc
class __$$CompaniesResponseImplCopyWithImpl<$Res>
    extends _$CompaniesResponseCopyWithImpl<$Res, _$CompaniesResponseImpl>
    implements _$$CompaniesResponseImplCopyWith<$Res> {
  __$$CompaniesResponseImplCopyWithImpl(_$CompaniesResponseImpl _value,
      $Res Function(_$CompaniesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$CompaniesResponseImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataCompany>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompaniesResponseImpl extends _CompaniesResponse {
  const _$CompaniesResponseImpl(
      {this.page,
      @JsonKey(name: 'per_page') this.perPage,
      this.total,
      @JsonKey(name: 'total_pages') this.totalPages,
      final List<DataCompany>? data,
      this.error})
      : _data = data,
        super._();

  factory _$CompaniesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompaniesResponseImplFromJson(json);

  @override
  final int? page;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  final int? total;
  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final List<DataCompany>? _data;
  @override
  List<DataCompany>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'CompaniesResponse(page: $page, perPage: $perPage, total: $total, totalPages: $totalPages, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompaniesResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, perPage, total, totalPages,
      const DeepCollectionEquality().hash(_data), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompaniesResponseImplCopyWith<_$CompaniesResponseImpl> get copyWith =>
      __$$CompaniesResponseImplCopyWithImpl<_$CompaniesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompaniesResponseImplToJson(
      this,
    );
  }
}

abstract class _CompaniesResponse extends CompaniesResponse {
  const factory _CompaniesResponse(
      {final int? page,
      @JsonKey(name: 'per_page') final int? perPage,
      final int? total,
      @JsonKey(name: 'total_pages') final int? totalPages,
      final List<DataCompany>? data,
      final String? error}) = _$CompaniesResponseImpl;
  const _CompaniesResponse._() : super._();

  factory _CompaniesResponse.fromJson(Map<String, dynamic> json) =
      _$CompaniesResponseImpl.fromJson;

  @override
  int? get page;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  int? get total;
  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  List<DataCompany>? get data;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$CompaniesResponseImplCopyWith<_$CompaniesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataCompany _$DataCompanyFromJson(Map<String, dynamic> json) {
  return _DataCompany.fromJson(json);
}

/// @nodoc
mixin _$DataCompany {
  int? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get sector => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCompanyCopyWith<DataCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCompanyCopyWith<$Res> {
  factory $DataCompanyCopyWith(
          DataCompany value, $Res Function(DataCompany) then) =
      _$DataCompanyCopyWithImpl<$Res, DataCompany>;
  @useResult
  $Res call(
      {int? id,
      String? code,
      String? name,
      String? sector,
      String? website,
      String? logo});
}

/// @nodoc
class _$DataCompanyCopyWithImpl<$Res, $Val extends DataCompany>
    implements $DataCompanyCopyWith<$Res> {
  _$DataCompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? sector = freezed,
    Object? website = freezed,
    Object? logo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sector: freezed == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataCompanyImplCopyWith<$Res>
    implements $DataCompanyCopyWith<$Res> {
  factory _$$DataCompanyImplCopyWith(
          _$DataCompanyImpl value, $Res Function(_$DataCompanyImpl) then) =
      __$$DataCompanyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? code,
      String? name,
      String? sector,
      String? website,
      String? logo});
}

/// @nodoc
class __$$DataCompanyImplCopyWithImpl<$Res>
    extends _$DataCompanyCopyWithImpl<$Res, _$DataCompanyImpl>
    implements _$$DataCompanyImplCopyWith<$Res> {
  __$$DataCompanyImplCopyWithImpl(
      _$DataCompanyImpl _value, $Res Function(_$DataCompanyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? sector = freezed,
    Object? website = freezed,
    Object? logo = freezed,
  }) {
    return _then(_$DataCompanyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sector: freezed == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataCompanyImpl implements _DataCompany {
  const _$DataCompanyImpl(
      {this.id, this.code, this.name, this.sector, this.website, this.logo});

  factory _$DataCompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataCompanyImplFromJson(json);

  @override
  final int? id;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? sector;
  @override
  final String? website;
  @override
  final String? logo;

  @override
  String toString() {
    return 'DataCompany(id: $id, code: $code, name: $name, sector: $sector, website: $website, logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataCompanyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sector, sector) || other.sector == sector) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, name, sector, website, logo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCompanyImplCopyWith<_$DataCompanyImpl> get copyWith =>
      __$$DataCompanyImplCopyWithImpl<_$DataCompanyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataCompanyImplToJson(
      this,
    );
  }
}

abstract class _DataCompany implements DataCompany {
  const factory _DataCompany(
      {final int? id,
      final String? code,
      final String? name,
      final String? sector,
      final String? website,
      final String? logo}) = _$DataCompanyImpl;

  factory _DataCompany.fromJson(Map<String, dynamic> json) =
      _$DataCompanyImpl.fromJson;

  @override
  int? get id;
  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get sector;
  @override
  String? get website;
  @override
  String? get logo;
  @override
  @JsonKey(ignore: true)
  _$$DataCompanyImplCopyWith<_$DataCompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
