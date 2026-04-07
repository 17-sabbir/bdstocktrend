// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'companies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Companies {
  List<Company>? get companies => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;
  int? get lastPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompaniesCopyWith<Companies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompaniesCopyWith<$Res> {
  factory $CompaniesCopyWith(Companies value, $Res Function(Companies) then) =
      _$CompaniesCopyWithImpl<$Res, Companies>;
  @useResult
  $Res call({List<Company>? companies, int? currentPage, int? lastPage});
}

/// @nodoc
class _$CompaniesCopyWithImpl<$Res, $Val extends Companies>
    implements $CompaniesCopyWith<$Res> {
  _$CompaniesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companies = freezed,
    Object? currentPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_value.copyWith(
      companies: freezed == companies
          ? _value.companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<Company>?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompaniesImplCopyWith<$Res>
    implements $CompaniesCopyWith<$Res> {
  factory _$$CompaniesImplCopyWith(
          _$CompaniesImpl value, $Res Function(_$CompaniesImpl) then) =
      __$$CompaniesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Company>? companies, int? currentPage, int? lastPage});
}

/// @nodoc
class __$$CompaniesImplCopyWithImpl<$Res>
    extends _$CompaniesCopyWithImpl<$Res, _$CompaniesImpl>
    implements _$$CompaniesImplCopyWith<$Res> {
  __$$CompaniesImplCopyWithImpl(
      _$CompaniesImpl _value, $Res Function(_$CompaniesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companies = freezed,
    Object? currentPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_$CompaniesImpl(
      companies: freezed == companies
          ? _value._companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<Company>?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CompaniesImpl implements _Companies {
  const _$CompaniesImpl(
      {final List<Company>? companies, this.currentPage, this.lastPage})
      : _companies = companies;

  final List<Company>? _companies;
  @override
  List<Company>? get companies {
    final value = _companies;
    if (value == null) return null;
    if (_companies is EqualUnmodifiableListView) return _companies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? currentPage;
  @override
  final int? lastPage;

  @override
  String toString() {
    return 'Companies(companies: $companies, currentPage: $currentPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompaniesImpl &&
            const DeepCollectionEquality()
                .equals(other._companies, _companies) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_companies), currentPage, lastPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompaniesImplCopyWith<_$CompaniesImpl> get copyWith =>
      __$$CompaniesImplCopyWithImpl<_$CompaniesImpl>(this, _$identity);
}

abstract class _Companies implements Companies {
  const factory _Companies(
      {final List<Company>? companies,
      final int? currentPage,
      final int? lastPage}) = _$CompaniesImpl;

  @override
  List<Company>? get companies;
  @override
  int? get currentPage;
  @override
  int? get lastPage;
  @override
  @JsonKey(ignore: true)
  _$$CompaniesImplCopyWith<_$CompaniesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Company {
  int? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get sector => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
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
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

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
abstract class _$$CompanyImplCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$$CompanyImplCopyWith(
          _$CompanyImpl value, $Res Function(_$CompanyImpl) then) =
      __$$CompanyImplCopyWithImpl<$Res>;
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
class __$$CompanyImplCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$CompanyImpl>
    implements _$$CompanyImplCopyWith<$Res> {
  __$$CompanyImplCopyWithImpl(
      _$CompanyImpl _value, $Res Function(_$CompanyImpl) _then)
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
    return _then(_$CompanyImpl(
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

class _$CompanyImpl implements _Company {
  const _$CompanyImpl(
      {this.id, this.code, this.name, this.sector, this.website, this.logo});

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
    return 'Company(id: $id, code: $code, name: $name, sector: $sector, website: $website, logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sector, sector) || other.sector == sector) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, name, sector, website, logo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      __$$CompanyImplCopyWithImpl<_$CompanyImpl>(this, _$identity);
}

abstract class _Company implements Company {
  const factory _Company(
      {final int? id,
      final String? code,
      final String? name,
      final String? sector,
      final String? website,
      final String? logo}) = _$CompanyImpl;

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
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
