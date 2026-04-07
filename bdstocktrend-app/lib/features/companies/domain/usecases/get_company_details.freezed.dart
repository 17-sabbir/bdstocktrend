// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_company_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyParams _$CompanyParamsFromJson(Map<String, dynamic> json) {
  return _CompanyParams.fromJson(json);
}

/// @nodoc
mixin _$CompanyParams {
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyParamsCopyWith<CompanyParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyParamsCopyWith<$Res> {
  factory $CompanyParamsCopyWith(
          CompanyParams value, $Res Function(CompanyParams) then) =
      _$CompanyParamsCopyWithImpl<$Res, CompanyParams>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$CompanyParamsCopyWithImpl<$Res, $Val extends CompanyParams>
    implements $CompanyParamsCopyWith<$Res> {
  _$CompanyParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyParamsImplCopyWith<$Res>
    implements $CompanyParamsCopyWith<$Res> {
  factory _$$CompanyParamsImplCopyWith(
          _$CompanyParamsImpl value, $Res Function(_$CompanyParamsImpl) then) =
      __$$CompanyParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$CompanyParamsImplCopyWithImpl<$Res>
    extends _$CompanyParamsCopyWithImpl<$Res, _$CompanyParamsImpl>
    implements _$$CompanyParamsImplCopyWith<$Res> {
  __$$CompanyParamsImplCopyWithImpl(
      _$CompanyParamsImpl _value, $Res Function(_$CompanyParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$CompanyParamsImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyParamsImpl implements _CompanyParams {
  const _$CompanyParamsImpl({required this.code});

  factory _$CompanyParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyParamsImplFromJson(json);

  @override
  final String code;

  @override
  String toString() {
    return 'CompanyParams(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyParamsImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyParamsImplCopyWith<_$CompanyParamsImpl> get copyWith =>
      __$$CompanyParamsImplCopyWithImpl<_$CompanyParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyParamsImplToJson(
      this,
    );
  }
}

abstract class _CompanyParams implements CompanyParams {
  const factory _CompanyParams({required final String code}) =
      _$CompanyParamsImpl;

  factory _CompanyParams.fromJson(Map<String, dynamic> json) =
      _$CompanyParamsImpl.fromJson;

  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$CompanyParamsImplCopyWith<_$CompanyParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
