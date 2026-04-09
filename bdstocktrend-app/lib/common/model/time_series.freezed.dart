// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimeSeries {
  DateTime get time => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeSeriesCopyWith<TimeSeries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSeriesCopyWith<$Res> {
  factory $TimeSeriesCopyWith(
          TimeSeries value, $Res Function(TimeSeries) then) =
      _$TimeSeriesCopyWithImpl<$Res, TimeSeries>;
  @useResult
  $Res call({DateTime time, double value});
}

/// @nodoc
class _$TimeSeriesCopyWithImpl<$Res, $Val extends TimeSeries>
    implements $TimeSeriesCopyWith<$Res> {
  _$TimeSeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSeriesImplCopyWith<$Res>
    implements $TimeSeriesCopyWith<$Res> {
  factory _$$TimeSeriesImplCopyWith(
          _$TimeSeriesImpl value, $Res Function(_$TimeSeriesImpl) then) =
      __$$TimeSeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime time, double value});
}

/// @nodoc
class __$$TimeSeriesImplCopyWithImpl<$Res>
    extends _$TimeSeriesCopyWithImpl<$Res, _$TimeSeriesImpl>
    implements _$$TimeSeriesImplCopyWith<$Res> {
  __$$TimeSeriesImplCopyWithImpl(
      _$TimeSeriesImpl _value, $Res Function(_$TimeSeriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? value = null,
  }) {
    return _then(_$TimeSeriesImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$TimeSeriesImpl implements _TimeSeries {
  const _$TimeSeriesImpl({required this.time, required this.value});

  @override
  final DateTime time;
  @override
  final double value;

  @override
  String toString() {
    return 'TimeSeries(time: $time, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSeriesImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSeriesImplCopyWith<_$TimeSeriesImpl> get copyWith =>
      __$$TimeSeriesImplCopyWithImpl<_$TimeSeriesImpl>(this, _$identity);
}

abstract class _TimeSeries implements TimeSeries {
  const factory _TimeSeries(
      {required final DateTime time,
      required final double value}) = _$TimeSeriesImpl;

  @override
  DateTime get time;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$TimeSeriesImplCopyWith<_$TimeSeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
