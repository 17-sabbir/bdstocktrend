// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) {
  return _DashboardResponse.fromJson(json);
}

/// @nodoc
mixin _$DashboardResponse {
  List<TimeSeriesData>? get dseX => throw _privateConstructorUsedError;
  List<TimeSeriesData>? get dseS => throw _privateConstructorUsedError;
  List<TimeSeriesData>? get ds30 => throw _privateConstructorUsedError;
  String? get lastUpdateTime => throw _privateConstructorUsedError;
  StockData? get topCompaniesByCategory => throw _privateConstructorUsedError;
  DseInfoData? get dseInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardResponseCopyWith<DashboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardResponseCopyWith<$Res> {
  factory $DashboardResponseCopyWith(
          DashboardResponse value, $Res Function(DashboardResponse) then) =
      _$DashboardResponseCopyWithImpl<$Res, DashboardResponse>;
  @useResult
  $Res call(
      {List<TimeSeriesData>? dseX,
      List<TimeSeriesData>? dseS,
      List<TimeSeriesData>? ds30,
      String? lastUpdateTime,
      StockData? topCompaniesByCategory,
      DseInfoData? dseInfo});

  $StockDataCopyWith<$Res>? get topCompaniesByCategory;
  $DseInfoDataCopyWith<$Res>? get dseInfo;
}

/// @nodoc
class _$DashboardResponseCopyWithImpl<$Res, $Val extends DashboardResponse>
    implements $DashboardResponseCopyWith<$Res> {
  _$DashboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dseX = freezed,
    Object? dseS = freezed,
    Object? ds30 = freezed,
    Object? lastUpdateTime = freezed,
    Object? topCompaniesByCategory = freezed,
    Object? dseInfo = freezed,
  }) {
    return _then(_value.copyWith(
      dseX: freezed == dseX
          ? _value.dseX
          : dseX // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
      dseS: freezed == dseS
          ? _value.dseS
          : dseS // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
      ds30: freezed == ds30
          ? _value.ds30
          : ds30 // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
      lastUpdateTime: freezed == lastUpdateTime
          ? _value.lastUpdateTime
          : lastUpdateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      topCompaniesByCategory: freezed == topCompaniesByCategory
          ? _value.topCompaniesByCategory
          : topCompaniesByCategory // ignore: cast_nullable_to_non_nullable
              as StockData?,
      dseInfo: freezed == dseInfo
          ? _value.dseInfo
          : dseInfo // ignore: cast_nullable_to_non_nullable
              as DseInfoData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StockDataCopyWith<$Res>? get topCompaniesByCategory {
    if (_value.topCompaniesByCategory == null) {
      return null;
    }

    return $StockDataCopyWith<$Res>(_value.topCompaniesByCategory!, (value) {
      return _then(_value.copyWith(topCompaniesByCategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DseInfoDataCopyWith<$Res>? get dseInfo {
    if (_value.dseInfo == null) {
      return null;
    }

    return $DseInfoDataCopyWith<$Res>(_value.dseInfo!, (value) {
      return _then(_value.copyWith(dseInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardResponseImplCopyWith<$Res>
    implements $DashboardResponseCopyWith<$Res> {
  factory _$$DashboardResponseImplCopyWith(_$DashboardResponseImpl value,
          $Res Function(_$DashboardResponseImpl) then) =
      __$$DashboardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TimeSeriesData>? dseX,
      List<TimeSeriesData>? dseS,
      List<TimeSeriesData>? ds30,
      String? lastUpdateTime,
      StockData? topCompaniesByCategory,
      DseInfoData? dseInfo});

  @override
  $StockDataCopyWith<$Res>? get topCompaniesByCategory;
  @override
  $DseInfoDataCopyWith<$Res>? get dseInfo;
}

/// @nodoc
class __$$DashboardResponseImplCopyWithImpl<$Res>
    extends _$DashboardResponseCopyWithImpl<$Res, _$DashboardResponseImpl>
    implements _$$DashboardResponseImplCopyWith<$Res> {
  __$$DashboardResponseImplCopyWithImpl(_$DashboardResponseImpl _value,
      $Res Function(_$DashboardResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dseX = freezed,
    Object? dseS = freezed,
    Object? ds30 = freezed,
    Object? lastUpdateTime = freezed,
    Object? topCompaniesByCategory = freezed,
    Object? dseInfo = freezed,
  }) {
    return _then(_$DashboardResponseImpl(
      dseX: freezed == dseX
          ? _value._dseX
          : dseX // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
      dseS: freezed == dseS
          ? _value._dseS
          : dseS // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
      ds30: freezed == ds30
          ? _value._ds30
          : ds30 // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
      lastUpdateTime: freezed == lastUpdateTime
          ? _value.lastUpdateTime
          : lastUpdateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      topCompaniesByCategory: freezed == topCompaniesByCategory
          ? _value.topCompaniesByCategory
          : topCompaniesByCategory // ignore: cast_nullable_to_non_nullable
              as StockData?,
      dseInfo: freezed == dseInfo
          ? _value.dseInfo
          : dseInfo // ignore: cast_nullable_to_non_nullable
              as DseInfoData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardResponseImpl extends _DashboardResponse {
  const _$DashboardResponseImpl(
      {final List<TimeSeriesData>? dseX,
      final List<TimeSeriesData>? dseS,
      final List<TimeSeriesData>? ds30,
      this.lastUpdateTime,
      this.topCompaniesByCategory,
      this.dseInfo})
      : _dseX = dseX,
        _dseS = dseS,
        _ds30 = ds30,
        super._();

  factory _$DashboardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardResponseImplFromJson(json);

  final List<TimeSeriesData>? _dseX;
  @override
  List<TimeSeriesData>? get dseX {
    final value = _dseX;
    if (value == null) return null;
    if (_dseX is EqualUnmodifiableListView) return _dseX;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TimeSeriesData>? _dseS;
  @override
  List<TimeSeriesData>? get dseS {
    final value = _dseS;
    if (value == null) return null;
    if (_dseS is EqualUnmodifiableListView) return _dseS;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TimeSeriesData>? _ds30;
  @override
  List<TimeSeriesData>? get ds30 {
    final value = _ds30;
    if (value == null) return null;
    if (_ds30 is EqualUnmodifiableListView) return _ds30;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? lastUpdateTime;
  @override
  final StockData? topCompaniesByCategory;
  @override
  final DseInfoData? dseInfo;

  @override
  String toString() {
    return 'DashboardResponse(dseX: $dseX, dseS: $dseS, ds30: $ds30, lastUpdateTime: $lastUpdateTime, topCompaniesByCategory: $topCompaniesByCategory, dseInfo: $dseInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardResponseImpl &&
            const DeepCollectionEquality().equals(other._dseX, _dseX) &&
            const DeepCollectionEquality().equals(other._dseS, _dseS) &&
            const DeepCollectionEquality().equals(other._ds30, _ds30) &&
            (identical(other.lastUpdateTime, lastUpdateTime) ||
                other.lastUpdateTime == lastUpdateTime) &&
            (identical(other.topCompaniesByCategory, topCompaniesByCategory) ||
                other.topCompaniesByCategory == topCompaniesByCategory) &&
            (identical(other.dseInfo, dseInfo) || other.dseInfo == dseInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dseX),
      const DeepCollectionEquality().hash(_dseS),
      const DeepCollectionEquality().hash(_ds30),
      lastUpdateTime,
      topCompaniesByCategory,
      dseInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardResponseImplCopyWith<_$DashboardResponseImpl> get copyWith =>
      __$$DashboardResponseImplCopyWithImpl<_$DashboardResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardResponseImplToJson(
      this,
    );
  }
}

abstract class _DashboardResponse extends DashboardResponse {
  const factory _DashboardResponse(
      {final List<TimeSeriesData>? dseX,
      final List<TimeSeriesData>? dseS,
      final List<TimeSeriesData>? ds30,
      final String? lastUpdateTime,
      final StockData? topCompaniesByCategory,
      final DseInfoData? dseInfo}) = _$DashboardResponseImpl;
  const _DashboardResponse._() : super._();

  factory _DashboardResponse.fromJson(Map<String, dynamic> json) =
      _$DashboardResponseImpl.fromJson;

  @override
  List<TimeSeriesData>? get dseX;
  @override
  List<TimeSeriesData>? get dseS;
  @override
  List<TimeSeriesData>? get ds30;
  @override
  String? get lastUpdateTime;
  @override
  StockData? get topCompaniesByCategory;
  @override
  DseInfoData? get dseInfo;
  @override
  @JsonKey(ignore: true)
  _$$DashboardResponseImplCopyWith<_$DashboardResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSeriesData _$TimeSeriesDataFromJson(Map<String, dynamic> json) {
  return _TimeSeriesData.fromJson(json);
}

/// @nodoc
mixin _$TimeSeriesData {
  DateTime? get time => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeSeriesDataCopyWith<TimeSeriesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSeriesDataCopyWith<$Res> {
  factory $TimeSeriesDataCopyWith(
          TimeSeriesData value, $Res Function(TimeSeriesData) then) =
      _$TimeSeriesDataCopyWithImpl<$Res, TimeSeriesData>;
  @useResult
  $Res call({DateTime? time, double? value});
}

/// @nodoc
class _$TimeSeriesDataCopyWithImpl<$Res, $Val extends TimeSeriesData>
    implements $TimeSeriesDataCopyWith<$Res> {
  _$TimeSeriesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSeriesDataImplCopyWith<$Res>
    implements $TimeSeriesDataCopyWith<$Res> {
  factory _$$TimeSeriesDataImplCopyWith(_$TimeSeriesDataImpl value,
          $Res Function(_$TimeSeriesDataImpl) then) =
      __$$TimeSeriesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? time, double? value});
}

/// @nodoc
class __$$TimeSeriesDataImplCopyWithImpl<$Res>
    extends _$TimeSeriesDataCopyWithImpl<$Res, _$TimeSeriesDataImpl>
    implements _$$TimeSeriesDataImplCopyWith<$Res> {
  __$$TimeSeriesDataImplCopyWithImpl(
      _$TimeSeriesDataImpl _value, $Res Function(_$TimeSeriesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? value = freezed,
  }) {
    return _then(_$TimeSeriesDataImpl(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSeriesDataImpl implements _TimeSeriesData {
  const _$TimeSeriesDataImpl({this.time, this.value});

  factory _$TimeSeriesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSeriesDataImplFromJson(json);

  @override
  final DateTime? time;
  @override
  final double? value;

  @override
  String toString() {
    return 'TimeSeriesData(time: $time, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSeriesDataImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSeriesDataImplCopyWith<_$TimeSeriesDataImpl> get copyWith =>
      __$$TimeSeriesDataImplCopyWithImpl<_$TimeSeriesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSeriesDataImplToJson(
      this,
    );
  }
}

abstract class _TimeSeriesData implements TimeSeriesData {
  const factory _TimeSeriesData({final DateTime? time, final double? value}) =
      _$TimeSeriesDataImpl;

  factory _TimeSeriesData.fromJson(Map<String, dynamic> json) =
      _$TimeSeriesDataImpl.fromJson;

  @override
  DateTime? get time;
  @override
  double? get value;
  @override
  @JsonKey(ignore: true)
  _$$TimeSeriesDataImplCopyWith<_$TimeSeriesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DseInfoData _$DseInfoDataFromJson(Map<String, dynamic> json) {
  return _DseInfoData.fromJson(json);
}

/// @nodoc
mixin _$DseInfoData {
  double? get IndexValue => throw _privateConstructorUsedError;
  double? get Change => throw _privateConstructorUsedError;
  double? get ChangePct => throw _privateConstructorUsedError;
  double? get DsIndex => throw _privateConstructorUsedError;
  double? get DsChange => throw _privateConstructorUsedError;
  double? get DsChangePct => throw _privateConstructorUsedError;
  double? get D30Index => throw _privateConstructorUsedError;
  double? get D30Change => throw _privateConstructorUsedError;
  double? get D30ChangePct => throw _privateConstructorUsedError;
  int? get TotalTrade => throw _privateConstructorUsedError;
  int? get TotalVolume => throw _privateConstructorUsedError;
  double? get TotalValue => throw _privateConstructorUsedError;
  int? get Advance => throw _privateConstructorUsedError;
  int? get Decline => throw _privateConstructorUsedError;
  int? get Unchange => throw _privateConstructorUsedError;
  String? get MarketStatus => throw _privateConstructorUsedError;
  String? get DseTime => throw _privateConstructorUsedError;
  bool? get IsTradeDay => throw _privateConstructorUsedError;
  String? get FundamentalUpdateDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DseInfoDataCopyWith<DseInfoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DseInfoDataCopyWith<$Res> {
  factory $DseInfoDataCopyWith(
          DseInfoData value, $Res Function(DseInfoData) then) =
      _$DseInfoDataCopyWithImpl<$Res, DseInfoData>;
  @useResult
  $Res call(
      {double? IndexValue,
      double? Change,
      double? ChangePct,
      double? DsIndex,
      double? DsChange,
      double? DsChangePct,
      double? D30Index,
      double? D30Change,
      double? D30ChangePct,
      int? TotalTrade,
      int? TotalVolume,
      double? TotalValue,
      int? Advance,
      int? Decline,
      int? Unchange,
      String? MarketStatus,
      String? DseTime,
      bool? IsTradeDay,
      String? FundamentalUpdateDate});
}

/// @nodoc
class _$DseInfoDataCopyWithImpl<$Res, $Val extends DseInfoData>
    implements $DseInfoDataCopyWith<$Res> {
  _$DseInfoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IndexValue = freezed,
    Object? Change = freezed,
    Object? ChangePct = freezed,
    Object? DsIndex = freezed,
    Object? DsChange = freezed,
    Object? DsChangePct = freezed,
    Object? D30Index = freezed,
    Object? D30Change = freezed,
    Object? D30ChangePct = freezed,
    Object? TotalTrade = freezed,
    Object? TotalVolume = freezed,
    Object? TotalValue = freezed,
    Object? Advance = freezed,
    Object? Decline = freezed,
    Object? Unchange = freezed,
    Object? MarketStatus = freezed,
    Object? DseTime = freezed,
    Object? IsTradeDay = freezed,
    Object? FundamentalUpdateDate = freezed,
  }) {
    return _then(_value.copyWith(
      IndexValue: freezed == IndexValue
          ? _value.IndexValue
          : IndexValue // ignore: cast_nullable_to_non_nullable
              as double?,
      Change: freezed == Change
          ? _value.Change
          : Change // ignore: cast_nullable_to_non_nullable
              as double?,
      ChangePct: freezed == ChangePct
          ? _value.ChangePct
          : ChangePct // ignore: cast_nullable_to_non_nullable
              as double?,
      DsIndex: freezed == DsIndex
          ? _value.DsIndex
          : DsIndex // ignore: cast_nullable_to_non_nullable
              as double?,
      DsChange: freezed == DsChange
          ? _value.DsChange
          : DsChange // ignore: cast_nullable_to_non_nullable
              as double?,
      DsChangePct: freezed == DsChangePct
          ? _value.DsChangePct
          : DsChangePct // ignore: cast_nullable_to_non_nullable
              as double?,
      D30Index: freezed == D30Index
          ? _value.D30Index
          : D30Index // ignore: cast_nullable_to_non_nullable
              as double?,
      D30Change: freezed == D30Change
          ? _value.D30Change
          : D30Change // ignore: cast_nullable_to_non_nullable
              as double?,
      D30ChangePct: freezed == D30ChangePct
          ? _value.D30ChangePct
          : D30ChangePct // ignore: cast_nullable_to_non_nullable
              as double?,
      TotalTrade: freezed == TotalTrade
          ? _value.TotalTrade
          : TotalTrade // ignore: cast_nullable_to_non_nullable
              as int?,
      TotalVolume: freezed == TotalVolume
          ? _value.TotalVolume
          : TotalVolume // ignore: cast_nullable_to_non_nullable
              as int?,
      TotalValue: freezed == TotalValue
          ? _value.TotalValue
          : TotalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      Advance: freezed == Advance
          ? _value.Advance
          : Advance // ignore: cast_nullable_to_non_nullable
              as int?,
      Decline: freezed == Decline
          ? _value.Decline
          : Decline // ignore: cast_nullable_to_non_nullable
              as int?,
      Unchange: freezed == Unchange
          ? _value.Unchange
          : Unchange // ignore: cast_nullable_to_non_nullable
              as int?,
      MarketStatus: freezed == MarketStatus
          ? _value.MarketStatus
          : MarketStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      DseTime: freezed == DseTime
          ? _value.DseTime
          : DseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      IsTradeDay: freezed == IsTradeDay
          ? _value.IsTradeDay
          : IsTradeDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      FundamentalUpdateDate: freezed == FundamentalUpdateDate
          ? _value.FundamentalUpdateDate
          : FundamentalUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DseInfoDataImplCopyWith<$Res>
    implements $DseInfoDataCopyWith<$Res> {
  factory _$$DseInfoDataImplCopyWith(
          _$DseInfoDataImpl value, $Res Function(_$DseInfoDataImpl) then) =
      __$$DseInfoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? IndexValue,
      double? Change,
      double? ChangePct,
      double? DsIndex,
      double? DsChange,
      double? DsChangePct,
      double? D30Index,
      double? D30Change,
      double? D30ChangePct,
      int? TotalTrade,
      int? TotalVolume,
      double? TotalValue,
      int? Advance,
      int? Decline,
      int? Unchange,
      String? MarketStatus,
      String? DseTime,
      bool? IsTradeDay,
      String? FundamentalUpdateDate});
}

/// @nodoc
class __$$DseInfoDataImplCopyWithImpl<$Res>
    extends _$DseInfoDataCopyWithImpl<$Res, _$DseInfoDataImpl>
    implements _$$DseInfoDataImplCopyWith<$Res> {
  __$$DseInfoDataImplCopyWithImpl(
      _$DseInfoDataImpl _value, $Res Function(_$DseInfoDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IndexValue = freezed,
    Object? Change = freezed,
    Object? ChangePct = freezed,
    Object? DsIndex = freezed,
    Object? DsChange = freezed,
    Object? DsChangePct = freezed,
    Object? D30Index = freezed,
    Object? D30Change = freezed,
    Object? D30ChangePct = freezed,
    Object? TotalTrade = freezed,
    Object? TotalVolume = freezed,
    Object? TotalValue = freezed,
    Object? Advance = freezed,
    Object? Decline = freezed,
    Object? Unchange = freezed,
    Object? MarketStatus = freezed,
    Object? DseTime = freezed,
    Object? IsTradeDay = freezed,
    Object? FundamentalUpdateDate = freezed,
  }) {
    return _then(_$DseInfoDataImpl(
      IndexValue: freezed == IndexValue
          ? _value.IndexValue
          : IndexValue // ignore: cast_nullable_to_non_nullable
              as double?,
      Change: freezed == Change
          ? _value.Change
          : Change // ignore: cast_nullable_to_non_nullable
              as double?,
      ChangePct: freezed == ChangePct
          ? _value.ChangePct
          : ChangePct // ignore: cast_nullable_to_non_nullable
              as double?,
      DsIndex: freezed == DsIndex
          ? _value.DsIndex
          : DsIndex // ignore: cast_nullable_to_non_nullable
              as double?,
      DsChange: freezed == DsChange
          ? _value.DsChange
          : DsChange // ignore: cast_nullable_to_non_nullable
              as double?,
      DsChangePct: freezed == DsChangePct
          ? _value.DsChangePct
          : DsChangePct // ignore: cast_nullable_to_non_nullable
              as double?,
      D30Index: freezed == D30Index
          ? _value.D30Index
          : D30Index // ignore: cast_nullable_to_non_nullable
              as double?,
      D30Change: freezed == D30Change
          ? _value.D30Change
          : D30Change // ignore: cast_nullable_to_non_nullable
              as double?,
      D30ChangePct: freezed == D30ChangePct
          ? _value.D30ChangePct
          : D30ChangePct // ignore: cast_nullable_to_non_nullable
              as double?,
      TotalTrade: freezed == TotalTrade
          ? _value.TotalTrade
          : TotalTrade // ignore: cast_nullable_to_non_nullable
              as int?,
      TotalVolume: freezed == TotalVolume
          ? _value.TotalVolume
          : TotalVolume // ignore: cast_nullable_to_non_nullable
              as int?,
      TotalValue: freezed == TotalValue
          ? _value.TotalValue
          : TotalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      Advance: freezed == Advance
          ? _value.Advance
          : Advance // ignore: cast_nullable_to_non_nullable
              as int?,
      Decline: freezed == Decline
          ? _value.Decline
          : Decline // ignore: cast_nullable_to_non_nullable
              as int?,
      Unchange: freezed == Unchange
          ? _value.Unchange
          : Unchange // ignore: cast_nullable_to_non_nullable
              as int?,
      MarketStatus: freezed == MarketStatus
          ? _value.MarketStatus
          : MarketStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      DseTime: freezed == DseTime
          ? _value.DseTime
          : DseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      IsTradeDay: freezed == IsTradeDay
          ? _value.IsTradeDay
          : IsTradeDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      FundamentalUpdateDate: freezed == FundamentalUpdateDate
          ? _value.FundamentalUpdateDate
          : FundamentalUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DseInfoDataImpl extends _DseInfoData {
  const _$DseInfoDataImpl(
      {this.IndexValue,
      this.Change,
      this.ChangePct,
      this.DsIndex,
      this.DsChange,
      this.DsChangePct,
      this.D30Index,
      this.D30Change,
      this.D30ChangePct,
      this.TotalTrade,
      this.TotalVolume,
      this.TotalValue,
      this.Advance,
      this.Decline,
      this.Unchange,
      this.MarketStatus,
      this.DseTime,
      this.IsTradeDay,
      this.FundamentalUpdateDate})
      : super._();

  factory _$DseInfoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DseInfoDataImplFromJson(json);

  @override
  final double? IndexValue;
  @override
  final double? Change;
  @override
  final double? ChangePct;
  @override
  final double? DsIndex;
  @override
  final double? DsChange;
  @override
  final double? DsChangePct;
  @override
  final double? D30Index;
  @override
  final double? D30Change;
  @override
  final double? D30ChangePct;
  @override
  final int? TotalTrade;
  @override
  final int? TotalVolume;
  @override
  final double? TotalValue;
  @override
  final int? Advance;
  @override
  final int? Decline;
  @override
  final int? Unchange;
  @override
  final String? MarketStatus;
  @override
  final String? DseTime;
  @override
  final bool? IsTradeDay;
  @override
  final String? FundamentalUpdateDate;

  @override
  String toString() {
    return 'DseInfoData(IndexValue: $IndexValue, Change: $Change, ChangePct: $ChangePct, DsIndex: $DsIndex, DsChange: $DsChange, DsChangePct: $DsChangePct, D30Index: $D30Index, D30Change: $D30Change, D30ChangePct: $D30ChangePct, TotalTrade: $TotalTrade, TotalVolume: $TotalVolume, TotalValue: $TotalValue, Advance: $Advance, Decline: $Decline, Unchange: $Unchange, MarketStatus: $MarketStatus, DseTime: $DseTime, IsTradeDay: $IsTradeDay, FundamentalUpdateDate: $FundamentalUpdateDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DseInfoDataImpl &&
            (identical(other.IndexValue, IndexValue) ||
                other.IndexValue == IndexValue) &&
            (identical(other.Change, Change) || other.Change == Change) &&
            (identical(other.ChangePct, ChangePct) ||
                other.ChangePct == ChangePct) &&
            (identical(other.DsIndex, DsIndex) || other.DsIndex == DsIndex) &&
            (identical(other.DsChange, DsChange) ||
                other.DsChange == DsChange) &&
            (identical(other.DsChangePct, DsChangePct) ||
                other.DsChangePct == DsChangePct) &&
            (identical(other.D30Index, D30Index) ||
                other.D30Index == D30Index) &&
            (identical(other.D30Change, D30Change) ||
                other.D30Change == D30Change) &&
            (identical(other.D30ChangePct, D30ChangePct) ||
                other.D30ChangePct == D30ChangePct) &&
            (identical(other.TotalTrade, TotalTrade) ||
                other.TotalTrade == TotalTrade) &&
            (identical(other.TotalVolume, TotalVolume) ||
                other.TotalVolume == TotalVolume) &&
            (identical(other.TotalValue, TotalValue) ||
                other.TotalValue == TotalValue) &&
            (identical(other.Advance, Advance) || other.Advance == Advance) &&
            (identical(other.Decline, Decline) || other.Decline == Decline) &&
            (identical(other.Unchange, Unchange) ||
                other.Unchange == Unchange) &&
            (identical(other.MarketStatus, MarketStatus) ||
                other.MarketStatus == MarketStatus) &&
            (identical(other.DseTime, DseTime) || other.DseTime == DseTime) &&
            (identical(other.IsTradeDay, IsTradeDay) ||
                other.IsTradeDay == IsTradeDay) &&
            (identical(other.FundamentalUpdateDate, FundamentalUpdateDate) ||
                other.FundamentalUpdateDate == FundamentalUpdateDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        IndexValue,
        Change,
        ChangePct,
        DsIndex,
        DsChange,
        DsChangePct,
        D30Index,
        D30Change,
        D30ChangePct,
        TotalTrade,
        TotalVolume,
        TotalValue,
        Advance,
        Decline,
        Unchange,
        MarketStatus,
        DseTime,
        IsTradeDay,
        FundamentalUpdateDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DseInfoDataImplCopyWith<_$DseInfoDataImpl> get copyWith =>
      __$$DseInfoDataImplCopyWithImpl<_$DseInfoDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DseInfoDataImplToJson(
      this,
    );
  }
}

abstract class _DseInfoData extends DseInfoData {
  const factory _DseInfoData(
      {final double? IndexValue,
      final double? Change,
      final double? ChangePct,
      final double? DsIndex,
      final double? DsChange,
      final double? DsChangePct,
      final double? D30Index,
      final double? D30Change,
      final double? D30ChangePct,
      final int? TotalTrade,
      final int? TotalVolume,
      final double? TotalValue,
      final int? Advance,
      final int? Decline,
      final int? Unchange,
      final String? MarketStatus,
      final String? DseTime,
      final bool? IsTradeDay,
      final String? FundamentalUpdateDate}) = _$DseInfoDataImpl;
  const _DseInfoData._() : super._();

  factory _DseInfoData.fromJson(Map<String, dynamic> json) =
      _$DseInfoDataImpl.fromJson;

  @override
  double? get IndexValue;
  @override
  double? get Change;
  @override
  double? get ChangePct;
  @override
  double? get DsIndex;
  @override
  double? get DsChange;
  @override
  double? get DsChangePct;
  @override
  double? get D30Index;
  @override
  double? get D30Change;
  @override
  double? get D30ChangePct;
  @override
  int? get TotalTrade;
  @override
  int? get TotalVolume;
  @override
  double? get TotalValue;
  @override
  int? get Advance;
  @override
  int? get Decline;
  @override
  int? get Unchange;
  @override
  String? get MarketStatus;
  @override
  String? get DseTime;
  @override
  bool? get IsTradeDay;
  @override
  String? get FundamentalUpdateDate;
  @override
  @JsonKey(ignore: true)
  _$$DseInfoDataImplCopyWith<_$DseInfoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockData _$StockDataFromJson(Map<String, dynamic> json) {
  return _StockData.fromJson(json);
}

/// @nodoc
mixin _$StockData {
  List<ScripData> get value => throw _privateConstructorUsedError;
  List<ScripData> get trade => throw _privateConstructorUsedError;
  List<ScripData> get volume => throw _privateConstructorUsedError;
  List<ScripData> get gainar => throw _privateConstructorUsedError;
  List<ScripData> get loser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockDataCopyWith<StockData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockDataCopyWith<$Res> {
  factory $StockDataCopyWith(StockData value, $Res Function(StockData) then) =
      _$StockDataCopyWithImpl<$Res, StockData>;
  @useResult
  $Res call(
      {List<ScripData> value,
      List<ScripData> trade,
      List<ScripData> volume,
      List<ScripData> gainar,
      List<ScripData> loser});
}

/// @nodoc
class _$StockDataCopyWithImpl<$Res, $Val extends StockData>
    implements $StockDataCopyWith<$Res> {
  _$StockDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? trade = null,
    Object? volume = null,
    Object? gainar = null,
    Object? loser = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
      trade: null == trade
          ? _value.trade
          : trade // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
      gainar: null == gainar
          ? _value.gainar
          : gainar // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
      loser: null == loser
          ? _value.loser
          : loser // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockDataImplCopyWith<$Res>
    implements $StockDataCopyWith<$Res> {
  factory _$$StockDataImplCopyWith(
          _$StockDataImpl value, $Res Function(_$StockDataImpl) then) =
      __$$StockDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ScripData> value,
      List<ScripData> trade,
      List<ScripData> volume,
      List<ScripData> gainar,
      List<ScripData> loser});
}

/// @nodoc
class __$$StockDataImplCopyWithImpl<$Res>
    extends _$StockDataCopyWithImpl<$Res, _$StockDataImpl>
    implements _$$StockDataImplCopyWith<$Res> {
  __$$StockDataImplCopyWithImpl(
      _$StockDataImpl _value, $Res Function(_$StockDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? trade = null,
    Object? volume = null,
    Object? gainar = null,
    Object? loser = null,
  }) {
    return _then(_$StockDataImpl(
      value: null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
      trade: null == trade
          ? _value._trade
          : trade // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
      volume: null == volume
          ? _value._volume
          : volume // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
      gainar: null == gainar
          ? _value._gainar
          : gainar // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
      loser: null == loser
          ? _value._loser
          : loser // ignore: cast_nullable_to_non_nullable
              as List<ScripData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockDataImpl extends _StockData {
  const _$StockDataImpl(
      {required final List<ScripData> value,
      required final List<ScripData> trade,
      required final List<ScripData> volume,
      required final List<ScripData> gainar,
      required final List<ScripData> loser})
      : _value = value,
        _trade = trade,
        _volume = volume,
        _gainar = gainar,
        _loser = loser,
        super._();

  factory _$StockDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockDataImplFromJson(json);

  final List<ScripData> _value;
  @override
  List<ScripData> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  final List<ScripData> _trade;
  @override
  List<ScripData> get trade {
    if (_trade is EqualUnmodifiableListView) return _trade;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trade);
  }

  final List<ScripData> _volume;
  @override
  List<ScripData> get volume {
    if (_volume is EqualUnmodifiableListView) return _volume;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_volume);
  }

  final List<ScripData> _gainar;
  @override
  List<ScripData> get gainar {
    if (_gainar is EqualUnmodifiableListView) return _gainar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gainar);
  }

  final List<ScripData> _loser;
  @override
  List<ScripData> get loser {
    if (_loser is EqualUnmodifiableListView) return _loser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loser);
  }

  @override
  String toString() {
    return 'StockData(value: $value, trade: $trade, volume: $volume, gainar: $gainar, loser: $loser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDataImpl &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            const DeepCollectionEquality().equals(other._trade, _trade) &&
            const DeepCollectionEquality().equals(other._volume, _volume) &&
            const DeepCollectionEquality().equals(other._gainar, _gainar) &&
            const DeepCollectionEquality().equals(other._loser, _loser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_value),
      const DeepCollectionEquality().hash(_trade),
      const DeepCollectionEquality().hash(_volume),
      const DeepCollectionEquality().hash(_gainar),
      const DeepCollectionEquality().hash(_loser));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDataImplCopyWith<_$StockDataImpl> get copyWith =>
      __$$StockDataImplCopyWithImpl<_$StockDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockDataImplToJson(
      this,
    );
  }
}

abstract class _StockData extends StockData {
  const factory _StockData(
      {required final List<ScripData> value,
      required final List<ScripData> trade,
      required final List<ScripData> volume,
      required final List<ScripData> gainar,
      required final List<ScripData> loser}) = _$StockDataImpl;
  const _StockData._() : super._();

  factory _StockData.fromJson(Map<String, dynamic> json) =
      _$StockDataImpl.fromJson;

  @override
  List<ScripData> get value;
  @override
  List<ScripData> get trade;
  @override
  List<ScripData> get volume;
  @override
  List<ScripData> get gainar;
  @override
  List<ScripData> get loser;
  @override
  @JsonKey(ignore: true)
  _$$StockDataImplCopyWith<_$StockDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScripData _$ScripDataFromJson(Map<String, dynamic> json) {
  return _ScripData.fromJson(json);
}

/// @nodoc
mixin _$ScripData {
  String get Scrip => throw _privateConstructorUsedError;
  double get LTP => throw _privateConstructorUsedError;
  double get Change => throw _privateConstructorUsedError;
  double get ChangePer => throw _privateConstructorUsedError;
  double get Value => throw _privateConstructorUsedError;
  int get Volume => throw _privateConstructorUsedError;
  int get Trade => throw _privateConstructorUsedError;
  List<QuoteData> get Quotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScripDataCopyWith<ScripData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScripDataCopyWith<$Res> {
  factory $ScripDataCopyWith(ScripData value, $Res Function(ScripData) then) =
      _$ScripDataCopyWithImpl<$Res, ScripData>;
  @useResult
  $Res call(
      {String Scrip,
      double LTP,
      double Change,
      double ChangePer,
      double Value,
      int Volume,
      int Trade,
      List<QuoteData> Quotes});
}

/// @nodoc
class _$ScripDataCopyWithImpl<$Res, $Val extends ScripData>
    implements $ScripDataCopyWith<$Res> {
  _$ScripDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Scrip = null,
    Object? LTP = null,
    Object? Change = null,
    Object? ChangePer = null,
    Object? Value = null,
    Object? Volume = null,
    Object? Trade = null,
    Object? Quotes = null,
  }) {
    return _then(_value.copyWith(
      Scrip: null == Scrip
          ? _value.Scrip
          : Scrip // ignore: cast_nullable_to_non_nullable
              as String,
      LTP: null == LTP
          ? _value.LTP
          : LTP // ignore: cast_nullable_to_non_nullable
              as double,
      Change: null == Change
          ? _value.Change
          : Change // ignore: cast_nullable_to_non_nullable
              as double,
      ChangePer: null == ChangePer
          ? _value.ChangePer
          : ChangePer // ignore: cast_nullable_to_non_nullable
              as double,
      Value: null == Value
          ? _value.Value
          : Value // ignore: cast_nullable_to_non_nullable
              as double,
      Volume: null == Volume
          ? _value.Volume
          : Volume // ignore: cast_nullable_to_non_nullable
              as int,
      Trade: null == Trade
          ? _value.Trade
          : Trade // ignore: cast_nullable_to_non_nullable
              as int,
      Quotes: null == Quotes
          ? _value.Quotes
          : Quotes // ignore: cast_nullable_to_non_nullable
              as List<QuoteData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScripDataImplCopyWith<$Res>
    implements $ScripDataCopyWith<$Res> {
  factory _$$ScripDataImplCopyWith(
          _$ScripDataImpl value, $Res Function(_$ScripDataImpl) then) =
      __$$ScripDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Scrip,
      double LTP,
      double Change,
      double ChangePer,
      double Value,
      int Volume,
      int Trade,
      List<QuoteData> Quotes});
}

/// @nodoc
class __$$ScripDataImplCopyWithImpl<$Res>
    extends _$ScripDataCopyWithImpl<$Res, _$ScripDataImpl>
    implements _$$ScripDataImplCopyWith<$Res> {
  __$$ScripDataImplCopyWithImpl(
      _$ScripDataImpl _value, $Res Function(_$ScripDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Scrip = null,
    Object? LTP = null,
    Object? Change = null,
    Object? ChangePer = null,
    Object? Value = null,
    Object? Volume = null,
    Object? Trade = null,
    Object? Quotes = null,
  }) {
    return _then(_$ScripDataImpl(
      Scrip: null == Scrip
          ? _value.Scrip
          : Scrip // ignore: cast_nullable_to_non_nullable
              as String,
      LTP: null == LTP
          ? _value.LTP
          : LTP // ignore: cast_nullable_to_non_nullable
              as double,
      Change: null == Change
          ? _value.Change
          : Change // ignore: cast_nullable_to_non_nullable
              as double,
      ChangePer: null == ChangePer
          ? _value.ChangePer
          : ChangePer // ignore: cast_nullable_to_non_nullable
              as double,
      Value: null == Value
          ? _value.Value
          : Value // ignore: cast_nullable_to_non_nullable
              as double,
      Volume: null == Volume
          ? _value.Volume
          : Volume // ignore: cast_nullable_to_non_nullable
              as int,
      Trade: null == Trade
          ? _value.Trade
          : Trade // ignore: cast_nullable_to_non_nullable
              as int,
      Quotes: null == Quotes
          ? _value._Quotes
          : Quotes // ignore: cast_nullable_to_non_nullable
              as List<QuoteData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScripDataImpl extends _ScripData {
  const _$ScripDataImpl(
      {required this.Scrip,
      required this.LTP,
      required this.Change,
      required this.ChangePer,
      required this.Value,
      required this.Volume,
      required this.Trade,
      required final List<QuoteData> Quotes})
      : _Quotes = Quotes,
        super._();

  factory _$ScripDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScripDataImplFromJson(json);

  @override
  final String Scrip;
  @override
  final double LTP;
  @override
  final double Change;
  @override
  final double ChangePer;
  @override
  final double Value;
  @override
  final int Volume;
  @override
  final int Trade;
  final List<QuoteData> _Quotes;
  @override
  List<QuoteData> get Quotes {
    if (_Quotes is EqualUnmodifiableListView) return _Quotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_Quotes);
  }

  @override
  String toString() {
    return 'ScripData(Scrip: $Scrip, LTP: $LTP, Change: $Change, ChangePer: $ChangePer, Value: $Value, Volume: $Volume, Trade: $Trade, Quotes: $Quotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScripDataImpl &&
            (identical(other.Scrip, Scrip) || other.Scrip == Scrip) &&
            (identical(other.LTP, LTP) || other.LTP == LTP) &&
            (identical(other.Change, Change) || other.Change == Change) &&
            (identical(other.ChangePer, ChangePer) ||
                other.ChangePer == ChangePer) &&
            (identical(other.Value, Value) || other.Value == Value) &&
            (identical(other.Volume, Volume) || other.Volume == Volume) &&
            (identical(other.Trade, Trade) || other.Trade == Trade) &&
            const DeepCollectionEquality().equals(other._Quotes, _Quotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, Scrip, LTP, Change, ChangePer,
      Value, Volume, Trade, const DeepCollectionEquality().hash(_Quotes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScripDataImplCopyWith<_$ScripDataImpl> get copyWith =>
      __$$ScripDataImplCopyWithImpl<_$ScripDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScripDataImplToJson(
      this,
    );
  }
}

abstract class _ScripData extends ScripData {
  const factory _ScripData(
      {required final String Scrip,
      required final double LTP,
      required final double Change,
      required final double ChangePer,
      required final double Value,
      required final int Volume,
      required final int Trade,
      required final List<QuoteData> Quotes}) = _$ScripDataImpl;
  const _ScripData._() : super._();

  factory _ScripData.fromJson(Map<String, dynamic> json) =
      _$ScripDataImpl.fromJson;

  @override
  String get Scrip;
  @override
  double get LTP;
  @override
  double get Change;
  @override
  double get ChangePer;
  @override
  double get Value;
  @override
  int get Volume;
  @override
  int get Trade;
  @override
  List<QuoteData> get Quotes;
  @override
  @JsonKey(ignore: true)
  _$$ScripDataImplCopyWith<_$ScripDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuoteData _$QuoteDataFromJson(Map<String, dynamic> json) {
  return _QuoteData.fromJson(json);
}

/// @nodoc
mixin _$QuoteData {
  double get Close => throw _privateConstructorUsedError;
  int get Volume => throw _privateConstructorUsedError;
  String get DateString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteDataCopyWith<QuoteData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteDataCopyWith<$Res> {
  factory $QuoteDataCopyWith(QuoteData value, $Res Function(QuoteData) then) =
      _$QuoteDataCopyWithImpl<$Res, QuoteData>;
  @useResult
  $Res call({double Close, int Volume, String DateString});
}

/// @nodoc
class _$QuoteDataCopyWithImpl<$Res, $Val extends QuoteData>
    implements $QuoteDataCopyWith<$Res> {
  _$QuoteDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Close = null,
    Object? Volume = null,
    Object? DateString = null,
  }) {
    return _then(_value.copyWith(
      Close: null == Close
          ? _value.Close
          : Close // ignore: cast_nullable_to_non_nullable
              as double,
      Volume: null == Volume
          ? _value.Volume
          : Volume // ignore: cast_nullable_to_non_nullable
              as int,
      DateString: null == DateString
          ? _value.DateString
          : DateString // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuoteDataImplCopyWith<$Res>
    implements $QuoteDataCopyWith<$Res> {
  factory _$$QuoteDataImplCopyWith(
          _$QuoteDataImpl value, $Res Function(_$QuoteDataImpl) then) =
      __$$QuoteDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double Close, int Volume, String DateString});
}

/// @nodoc
class __$$QuoteDataImplCopyWithImpl<$Res>
    extends _$QuoteDataCopyWithImpl<$Res, _$QuoteDataImpl>
    implements _$$QuoteDataImplCopyWith<$Res> {
  __$$QuoteDataImplCopyWithImpl(
      _$QuoteDataImpl _value, $Res Function(_$QuoteDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Close = null,
    Object? Volume = null,
    Object? DateString = null,
  }) {
    return _then(_$QuoteDataImpl(
      Close: null == Close
          ? _value.Close
          : Close // ignore: cast_nullable_to_non_nullable
              as double,
      Volume: null == Volume
          ? _value.Volume
          : Volume // ignore: cast_nullable_to_non_nullable
              as int,
      DateString: null == DateString
          ? _value.DateString
          : DateString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuoteDataImpl extends _QuoteData {
  const _$QuoteDataImpl(
      {required this.Close, required this.Volume, required this.DateString})
      : super._();

  factory _$QuoteDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteDataImplFromJson(json);

  @override
  final double Close;
  @override
  final int Volume;
  @override
  final String DateString;

  @override
  String toString() {
    return 'QuoteData(Close: $Close, Volume: $Volume, DateString: $DateString)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteDataImpl &&
            (identical(other.Close, Close) || other.Close == Close) &&
            (identical(other.Volume, Volume) || other.Volume == Volume) &&
            (identical(other.DateString, DateString) ||
                other.DateString == DateString));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, Close, Volume, DateString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteDataImplCopyWith<_$QuoteDataImpl> get copyWith =>
      __$$QuoteDataImplCopyWithImpl<_$QuoteDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteDataImplToJson(
      this,
    );
  }
}

abstract class _QuoteData extends QuoteData {
  const factory _QuoteData(
      {required final double Close,
      required final int Volume,
      required final String DateString}) = _$QuoteDataImpl;
  const _QuoteData._() : super._();

  factory _QuoteData.fromJson(Map<String, dynamic> json) =
      _$QuoteDataImpl.fromJson;

  @override
  double get Close;
  @override
  int get Volume;
  @override
  String get DateString;
  @override
  @JsonKey(ignore: true)
  _$$QuoteDataImplCopyWith<_$QuoteDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
