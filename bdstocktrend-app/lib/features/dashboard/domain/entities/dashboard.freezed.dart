// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Dashboard {
  List<TimeSeries> get dseX => throw _privateConstructorUsedError;
  List<TimeSeries> get dseS => throw _privateConstructorUsedError;
  List<TimeSeries> get ds30 => throw _privateConstructorUsedError;
  String get lastUpdateTime => throw _privateConstructorUsedError;
  Stock get topCompaniesByCategory => throw _privateConstructorUsedError;
  DseInfo get dseInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call(
      {List<TimeSeries> dseX,
      List<TimeSeries> dseS,
      List<TimeSeries> ds30,
      String lastUpdateTime,
      Stock topCompaniesByCategory,
      DseInfo dseInfo});

  $StockCopyWith<$Res> get topCompaniesByCategory;
  $DseInfoCopyWith<$Res> get dseInfo;
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dseX = null,
    Object? dseS = null,
    Object? ds30 = null,
    Object? lastUpdateTime = null,
    Object? topCompaniesByCategory = null,
    Object? dseInfo = null,
  }) {
    return _then(_value.copyWith(
      dseX: null == dseX
          ? _value.dseX
          : dseX // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      dseS: null == dseS
          ? _value.dseS
          : dseS // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      ds30: null == ds30
          ? _value.ds30
          : ds30 // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      lastUpdateTime: null == lastUpdateTime
          ? _value.lastUpdateTime
          : lastUpdateTime // ignore: cast_nullable_to_non_nullable
              as String,
      topCompaniesByCategory: null == topCompaniesByCategory
          ? _value.topCompaniesByCategory
          : topCompaniesByCategory // ignore: cast_nullable_to_non_nullable
              as Stock,
      dseInfo: null == dseInfo
          ? _value.dseInfo
          : dseInfo // ignore: cast_nullable_to_non_nullable
              as DseInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StockCopyWith<$Res> get topCompaniesByCategory {
    return $StockCopyWith<$Res>(_value.topCompaniesByCategory, (value) {
      return _then(_value.copyWith(topCompaniesByCategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DseInfoCopyWith<$Res> get dseInfo {
    return $DseInfoCopyWith<$Res>(_value.dseInfo, (value) {
      return _then(_value.copyWith(dseInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardImplCopyWith<$Res>
    implements $DashboardCopyWith<$Res> {
  factory _$$DashboardImplCopyWith(
          _$DashboardImpl value, $Res Function(_$DashboardImpl) then) =
      __$$DashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TimeSeries> dseX,
      List<TimeSeries> dseS,
      List<TimeSeries> ds30,
      String lastUpdateTime,
      Stock topCompaniesByCategory,
      DseInfo dseInfo});

  @override
  $StockCopyWith<$Res> get topCompaniesByCategory;
  @override
  $DseInfoCopyWith<$Res> get dseInfo;
}

/// @nodoc
class __$$DashboardImplCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$DashboardImpl>
    implements _$$DashboardImplCopyWith<$Res> {
  __$$DashboardImplCopyWithImpl(
      _$DashboardImpl _value, $Res Function(_$DashboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dseX = null,
    Object? dseS = null,
    Object? ds30 = null,
    Object? lastUpdateTime = null,
    Object? topCompaniesByCategory = null,
    Object? dseInfo = null,
  }) {
    return _then(_$DashboardImpl(
      dseX: null == dseX
          ? _value._dseX
          : dseX // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      dseS: null == dseS
          ? _value._dseS
          : dseS // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      ds30: null == ds30
          ? _value._ds30
          : ds30 // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      lastUpdateTime: null == lastUpdateTime
          ? _value.lastUpdateTime
          : lastUpdateTime // ignore: cast_nullable_to_non_nullable
              as String,
      topCompaniesByCategory: null == topCompaniesByCategory
          ? _value.topCompaniesByCategory
          : topCompaniesByCategory // ignore: cast_nullable_to_non_nullable
              as Stock,
      dseInfo: null == dseInfo
          ? _value.dseInfo
          : dseInfo // ignore: cast_nullable_to_non_nullable
              as DseInfo,
    ));
  }
}

/// @nodoc

class _$DashboardImpl implements _Dashboard {
  const _$DashboardImpl(
      {required final List<TimeSeries> dseX,
      required final List<TimeSeries> dseS,
      required final List<TimeSeries> ds30,
      required this.lastUpdateTime,
      required this.topCompaniesByCategory,
      required this.dseInfo})
      : _dseX = dseX,
        _dseS = dseS,
        _ds30 = ds30;

  final List<TimeSeries> _dseX;
  @override
  List<TimeSeries> get dseX {
    if (_dseX is EqualUnmodifiableListView) return _dseX;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dseX);
  }

  final List<TimeSeries> _dseS;
  @override
  List<TimeSeries> get dseS {
    if (_dseS is EqualUnmodifiableListView) return _dseS;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dseS);
  }

  final List<TimeSeries> _ds30;
  @override
  List<TimeSeries> get ds30 {
    if (_ds30 is EqualUnmodifiableListView) return _ds30;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ds30);
  }

  @override
  final String lastUpdateTime;
  @override
  final Stock topCompaniesByCategory;
  @override
  final DseInfo dseInfo;

  @override
  String toString() {
    return 'Dashboard(dseX: $dseX, dseS: $dseS, ds30: $ds30, lastUpdateTime: $lastUpdateTime, topCompaniesByCategory: $topCompaniesByCategory, dseInfo: $dseInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardImpl &&
            const DeepCollectionEquality().equals(other._dseX, _dseX) &&
            const DeepCollectionEquality().equals(other._dseS, _dseS) &&
            const DeepCollectionEquality().equals(other._ds30, _ds30) &&
            (identical(other.lastUpdateTime, lastUpdateTime) ||
                other.lastUpdateTime == lastUpdateTime) &&
            (identical(other.topCompaniesByCategory, topCompaniesByCategory) ||
                other.topCompaniesByCategory == topCompaniesByCategory) &&
            (identical(other.dseInfo, dseInfo) || other.dseInfo == dseInfo));
  }

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
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      __$$DashboardImplCopyWithImpl<_$DashboardImpl>(this, _$identity);
}

abstract class _Dashboard implements Dashboard {
  const factory _Dashboard(
      {required final List<TimeSeries> dseX,
      required final List<TimeSeries> dseS,
      required final List<TimeSeries> ds30,
      required final String lastUpdateTime,
      required final Stock topCompaniesByCategory,
      required final DseInfo dseInfo}) = _$DashboardImpl;

  @override
  List<TimeSeries> get dseX;
  @override
  List<TimeSeries> get dseS;
  @override
  List<TimeSeries> get ds30;
  @override
  String get lastUpdateTime;
  @override
  Stock get topCompaniesByCategory;
  @override
  DseInfo get dseInfo;
  @override
  @JsonKey(ignore: true)
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DseInfo {
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

  @JsonKey(ignore: true)
  $DseInfoCopyWith<DseInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DseInfoCopyWith<$Res> {
  factory $DseInfoCopyWith(DseInfo value, $Res Function(DseInfo) then) =
      _$DseInfoCopyWithImpl<$Res, DseInfo>;
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
class _$DseInfoCopyWithImpl<$Res, $Val extends DseInfo>
    implements $DseInfoCopyWith<$Res> {
  _$DseInfoCopyWithImpl(this._value, this._then);

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
abstract class _$$DseInfoImplCopyWith<$Res> implements $DseInfoCopyWith<$Res> {
  factory _$$DseInfoImplCopyWith(
          _$DseInfoImpl value, $Res Function(_$DseInfoImpl) then) =
      __$$DseInfoImplCopyWithImpl<$Res>;
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
class __$$DseInfoImplCopyWithImpl<$Res>
    extends _$DseInfoCopyWithImpl<$Res, _$DseInfoImpl>
    implements _$$DseInfoImplCopyWith<$Res> {
  __$$DseInfoImplCopyWithImpl(
      _$DseInfoImpl _value, $Res Function(_$DseInfoImpl) _then)
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
    return _then(_$DseInfoImpl(
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

class _$DseInfoImpl implements _DseInfo {
  const _$DseInfoImpl(
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
      this.FundamentalUpdateDate});

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
    return 'DseInfo(IndexValue: $IndexValue, Change: $Change, ChangePct: $ChangePct, DsIndex: $DsIndex, DsChange: $DsChange, DsChangePct: $DsChangePct, D30Index: $D30Index, D30Change: $D30Change, D30ChangePct: $D30ChangePct, TotalTrade: $TotalTrade, TotalVolume: $TotalVolume, TotalValue: $TotalValue, Advance: $Advance, Decline: $Decline, Unchange: $Unchange, MarketStatus: $MarketStatus, DseTime: $DseTime, IsTradeDay: $IsTradeDay, FundamentalUpdateDate: $FundamentalUpdateDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DseInfoImpl &&
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
  _$$DseInfoImplCopyWith<_$DseInfoImpl> get copyWith =>
      __$$DseInfoImplCopyWithImpl<_$DseInfoImpl>(this, _$identity);
}

abstract class _DseInfo implements DseInfo {
  const factory _DseInfo(
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
      final String? FundamentalUpdateDate}) = _$DseInfoImpl;

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
  _$$DseInfoImplCopyWith<_$DseInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Stock {
  List<ScripInfo> get value => throw _privateConstructorUsedError;
  List<ScripInfo> get trade => throw _privateConstructorUsedError;
  List<ScripInfo> get volume => throw _privateConstructorUsedError;
  List<ScripInfo> get gainar => throw _privateConstructorUsedError;
  List<ScripInfo> get loser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockCopyWith<Stock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCopyWith<$Res> {
  factory $StockCopyWith(Stock value, $Res Function(Stock) then) =
      _$StockCopyWithImpl<$Res, Stock>;
  @useResult
  $Res call(
      {List<ScripInfo> value,
      List<ScripInfo> trade,
      List<ScripInfo> volume,
      List<ScripInfo> gainar,
      List<ScripInfo> loser});
}

/// @nodoc
class _$StockCopyWithImpl<$Res, $Val extends Stock>
    implements $StockCopyWith<$Res> {
  _$StockCopyWithImpl(this._value, this._then);

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
              as List<ScripInfo>,
      trade: null == trade
          ? _value.trade
          : trade // ignore: cast_nullable_to_non_nullable
              as List<ScripInfo>,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as List<ScripInfo>,
      gainar: null == gainar
          ? _value.gainar
          : gainar // ignore: cast_nullable_to_non_nullable
              as List<ScripInfo>,
      loser: null == loser
          ? _value.loser
          : loser // ignore: cast_nullable_to_non_nullable
              as List<ScripInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockImplCopyWith<$Res> implements $StockCopyWith<$Res> {
  factory _$$StockImplCopyWith(
          _$StockImpl value, $Res Function(_$StockImpl) then) =
      __$$StockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ScripInfo> value,
      List<ScripInfo> trade,
      List<ScripInfo> volume,
      List<ScripInfo> gainar,
      List<ScripInfo> loser});
}

/// @nodoc
class __$$StockImplCopyWithImpl<$Res>
    extends _$StockCopyWithImpl<$Res, _$StockImpl>
    implements _$$StockImplCopyWith<$Res> {
  __$$StockImplCopyWithImpl(
      _$StockImpl _value, $Res Function(_$StockImpl) _then)
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
    return _then(_$StockImpl(
      value: null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<ScripInfo>,
      trade: null == trade
          ? _value._trade
          : trade // ignore: cast_nullable_to_non_nullable
              as List<ScripInfo>,
      volume: null == volume
          ? _value._volume
          : volume // ignore: cast_nullable_to_non_nullable
              as List<ScripInfo>,
      gainar: null == gainar
          ? _value._gainar
          : gainar // ignore: cast_nullable_to_non_nullable
              as List<ScripInfo>,
      loser: null == loser
          ? _value._loser
          : loser // ignore: cast_nullable_to_non_nullable
              as List<ScripInfo>,
    ));
  }
}

/// @nodoc

class _$StockImpl implements _Stock {
  const _$StockImpl(
      {required final List<ScripInfo> value,
      required final List<ScripInfo> trade,
      required final List<ScripInfo> volume,
      required final List<ScripInfo> gainar,
      required final List<ScripInfo> loser})
      : _value = value,
        _trade = trade,
        _volume = volume,
        _gainar = gainar,
        _loser = loser;

  final List<ScripInfo> _value;
  @override
  List<ScripInfo> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  final List<ScripInfo> _trade;
  @override
  List<ScripInfo> get trade {
    if (_trade is EqualUnmodifiableListView) return _trade;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trade);
  }

  final List<ScripInfo> _volume;
  @override
  List<ScripInfo> get volume {
    if (_volume is EqualUnmodifiableListView) return _volume;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_volume);
  }

  final List<ScripInfo> _gainar;
  @override
  List<ScripInfo> get gainar {
    if (_gainar is EqualUnmodifiableListView) return _gainar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gainar);
  }

  final List<ScripInfo> _loser;
  @override
  List<ScripInfo> get loser {
    if (_loser is EqualUnmodifiableListView) return _loser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loser);
  }

  @override
  String toString() {
    return 'Stock(value: $value, trade: $trade, volume: $volume, gainar: $gainar, loser: $loser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockImpl &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            const DeepCollectionEquality().equals(other._trade, _trade) &&
            const DeepCollectionEquality().equals(other._volume, _volume) &&
            const DeepCollectionEquality().equals(other._gainar, _gainar) &&
            const DeepCollectionEquality().equals(other._loser, _loser));
  }

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
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      __$$StockImplCopyWithImpl<_$StockImpl>(this, _$identity);
}

abstract class _Stock implements Stock {
  const factory _Stock(
      {required final List<ScripInfo> value,
      required final List<ScripInfo> trade,
      required final List<ScripInfo> volume,
      required final List<ScripInfo> gainar,
      required final List<ScripInfo> loser}) = _$StockImpl;

  @override
  List<ScripInfo> get value;
  @override
  List<ScripInfo> get trade;
  @override
  List<ScripInfo> get volume;
  @override
  List<ScripInfo> get gainar;
  @override
  List<ScripInfo> get loser;
  @override
  @JsonKey(ignore: true)
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScripInfo {
  String get Scrip => throw _privateConstructorUsedError;
  double get LTP => throw _privateConstructorUsedError;
  double get Change => throw _privateConstructorUsedError;
  double get ChangePer => throw _privateConstructorUsedError;
  double get Value => throw _privateConstructorUsedError;
  int get Volume => throw _privateConstructorUsedError;
  int get Trade => throw _privateConstructorUsedError;
  List<Quote> get Quotes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScripInfoCopyWith<ScripInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScripInfoCopyWith<$Res> {
  factory $ScripInfoCopyWith(ScripInfo value, $Res Function(ScripInfo) then) =
      _$ScripInfoCopyWithImpl<$Res, ScripInfo>;
  @useResult
  $Res call(
      {String Scrip,
      double LTP,
      double Change,
      double ChangePer,
      double Value,
      int Volume,
      int Trade,
      List<Quote> Quotes});
}

/// @nodoc
class _$ScripInfoCopyWithImpl<$Res, $Val extends ScripInfo>
    implements $ScripInfoCopyWith<$Res> {
  _$ScripInfoCopyWithImpl(this._value, this._then);

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
              as List<Quote>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScripInfoImplCopyWith<$Res>
    implements $ScripInfoCopyWith<$Res> {
  factory _$$ScripInfoImplCopyWith(
          _$ScripInfoImpl value, $Res Function(_$ScripInfoImpl) then) =
      __$$ScripInfoImplCopyWithImpl<$Res>;
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
      List<Quote> Quotes});
}

/// @nodoc
class __$$ScripInfoImplCopyWithImpl<$Res>
    extends _$ScripInfoCopyWithImpl<$Res, _$ScripInfoImpl>
    implements _$$ScripInfoImplCopyWith<$Res> {
  __$$ScripInfoImplCopyWithImpl(
      _$ScripInfoImpl _value, $Res Function(_$ScripInfoImpl) _then)
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
    return _then(_$ScripInfoImpl(
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
              as List<Quote>,
    ));
  }
}

/// @nodoc

class _$ScripInfoImpl implements _ScripInfo {
  const _$ScripInfoImpl(
      {required this.Scrip,
      required this.LTP,
      required this.Change,
      required this.ChangePer,
      required this.Value,
      required this.Volume,
      required this.Trade,
      required final List<Quote> Quotes})
      : _Quotes = Quotes;

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
  final List<Quote> _Quotes;
  @override
  List<Quote> get Quotes {
    if (_Quotes is EqualUnmodifiableListView) return _Quotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_Quotes);
  }

  @override
  String toString() {
    return 'ScripInfo(Scrip: $Scrip, LTP: $LTP, Change: $Change, ChangePer: $ChangePer, Value: $Value, Volume: $Volume, Trade: $Trade, Quotes: $Quotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScripInfoImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, Scrip, LTP, Change, ChangePer,
      Value, Volume, Trade, const DeepCollectionEquality().hash(_Quotes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScripInfoImplCopyWith<_$ScripInfoImpl> get copyWith =>
      __$$ScripInfoImplCopyWithImpl<_$ScripInfoImpl>(this, _$identity);
}

abstract class _ScripInfo implements ScripInfo {
  const factory _ScripInfo(
      {required final String Scrip,
      required final double LTP,
      required final double Change,
      required final double ChangePer,
      required final double Value,
      required final int Volume,
      required final int Trade,
      required final List<Quote> Quotes}) = _$ScripInfoImpl;

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
  List<Quote> get Quotes;
  @override
  @JsonKey(ignore: true)
  _$$ScripInfoImplCopyWith<_$ScripInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Quote {
  double get Close => throw _privateConstructorUsedError;
  int get Volume => throw _privateConstructorUsedError;
  String get DateString => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuoteCopyWith<Quote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res, Quote>;
  @useResult
  $Res call({double Close, int Volume, String DateString});
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res, $Val extends Quote>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

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
abstract class _$$QuoteImplCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$$QuoteImplCopyWith(
          _$QuoteImpl value, $Res Function(_$QuoteImpl) then) =
      __$$QuoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double Close, int Volume, String DateString});
}

/// @nodoc
class __$$QuoteImplCopyWithImpl<$Res>
    extends _$QuoteCopyWithImpl<$Res, _$QuoteImpl>
    implements _$$QuoteImplCopyWith<$Res> {
  __$$QuoteImplCopyWithImpl(
      _$QuoteImpl _value, $Res Function(_$QuoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Close = null,
    Object? Volume = null,
    Object? DateString = null,
  }) {
    return _then(_$QuoteImpl(
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

class _$QuoteImpl implements _Quote {
  const _$QuoteImpl(
      {required this.Close, required this.Volume, required this.DateString});

  @override
  final double Close;
  @override
  final int Volume;
  @override
  final String DateString;

  @override
  String toString() {
    return 'Quote(Close: $Close, Volume: $Volume, DateString: $DateString)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteImpl &&
            (identical(other.Close, Close) || other.Close == Close) &&
            (identical(other.Volume, Volume) || other.Volume == Volume) &&
            (identical(other.DateString, DateString) ||
                other.DateString == DateString));
  }

  @override
  int get hashCode => Object.hash(runtimeType, Close, Volume, DateString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteImplCopyWith<_$QuoteImpl> get copyWith =>
      __$$QuoteImplCopyWithImpl<_$QuoteImpl>(this, _$identity);
}

abstract class _Quote implements Quote {
  const factory _Quote(
      {required final double Close,
      required final int Volume,
      required final String DateString}) = _$QuoteImpl;

  @override
  double get Close;
  @override
  int get Volume;
  @override
  String get DateString;
  @override
  @JsonKey(ignore: true)
  _$$QuoteImplCopyWith<_$QuoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
