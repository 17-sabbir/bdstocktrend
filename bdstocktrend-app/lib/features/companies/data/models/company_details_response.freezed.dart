// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyDetailsResponse _$CompanyDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _CompanyDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$CompanyDetailsResponse {
  ScripDetailsInfoData? get info => throw _privateConstructorUsedError;
  List<TimeSeriesData>? get last30Days => throw _privateConstructorUsedError;
  List<TimeSeriesData>? get next30Days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyDetailsResponseCopyWith<CompanyDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyDetailsResponseCopyWith<$Res> {
  factory $CompanyDetailsResponseCopyWith(CompanyDetailsResponse value,
          $Res Function(CompanyDetailsResponse) then) =
      _$CompanyDetailsResponseCopyWithImpl<$Res, CompanyDetailsResponse>;
  @useResult
  $Res call(
      {ScripDetailsInfoData? info,
      List<TimeSeriesData>? last30Days,
      List<TimeSeriesData>? next30Days});

  $ScripDetailsInfoDataCopyWith<$Res>? get info;
}

/// @nodoc
class _$CompanyDetailsResponseCopyWithImpl<$Res,
        $Val extends CompanyDetailsResponse>
    implements $CompanyDetailsResponseCopyWith<$Res> {
  _$CompanyDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = freezed,
    Object? last30Days = freezed,
    Object? next30Days = freezed,
  }) {
    return _then(_value.copyWith(
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ScripDetailsInfoData?,
      last30Days: freezed == last30Days
          ? _value.last30Days
          : last30Days // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
      next30Days: freezed == next30Days
          ? _value.next30Days
          : next30Days // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScripDetailsInfoDataCopyWith<$Res>? get info {
    if (_value.info == null) {
      return null;
    }

    return $ScripDetailsInfoDataCopyWith<$Res>(_value.info!, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompanyDetailsResponseImplCopyWith<$Res>
    implements $CompanyDetailsResponseCopyWith<$Res> {
  factory _$$CompanyDetailsResponseImplCopyWith(
          _$CompanyDetailsResponseImpl value,
          $Res Function(_$CompanyDetailsResponseImpl) then) =
      __$$CompanyDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScripDetailsInfoData? info,
      List<TimeSeriesData>? last30Days,
      List<TimeSeriesData>? next30Days});

  @override
  $ScripDetailsInfoDataCopyWith<$Res>? get info;
}

/// @nodoc
class __$$CompanyDetailsResponseImplCopyWithImpl<$Res>
    extends _$CompanyDetailsResponseCopyWithImpl<$Res,
        _$CompanyDetailsResponseImpl>
    implements _$$CompanyDetailsResponseImplCopyWith<$Res> {
  __$$CompanyDetailsResponseImplCopyWithImpl(
      _$CompanyDetailsResponseImpl _value,
      $Res Function(_$CompanyDetailsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = freezed,
    Object? last30Days = freezed,
    Object? next30Days = freezed,
  }) {
    return _then(_$CompanyDetailsResponseImpl(
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ScripDetailsInfoData?,
      last30Days: freezed == last30Days
          ? _value._last30Days
          : last30Days // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
      next30Days: freezed == next30Days
          ? _value._next30Days
          : next30Days // ignore: cast_nullable_to_non_nullable
              as List<TimeSeriesData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyDetailsResponseImpl extends _CompanyDetailsResponse {
  const _$CompanyDetailsResponseImpl(
      {this.info,
      final List<TimeSeriesData>? last30Days,
      final List<TimeSeriesData>? next30Days})
      : _last30Days = last30Days,
        _next30Days = next30Days,
        super._();

  factory _$CompanyDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyDetailsResponseImplFromJson(json);

  @override
  final ScripDetailsInfoData? info;
  final List<TimeSeriesData>? _last30Days;
  @override
  List<TimeSeriesData>? get last30Days {
    final value = _last30Days;
    if (value == null) return null;
    if (_last30Days is EqualUnmodifiableListView) return _last30Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TimeSeriesData>? _next30Days;
  @override
  List<TimeSeriesData>? get next30Days {
    final value = _next30Days;
    if (value == null) return null;
    if (_next30Days is EqualUnmodifiableListView) return _next30Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CompanyDetailsResponse(info: $info, last30Days: $last30Days, next30Days: $next30Days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyDetailsResponseImpl &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality()
                .equals(other._last30Days, _last30Days) &&
            const DeepCollectionEquality()
                .equals(other._next30Days, _next30Days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      info,
      const DeepCollectionEquality().hash(_last30Days),
      const DeepCollectionEquality().hash(_next30Days));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyDetailsResponseImplCopyWith<_$CompanyDetailsResponseImpl>
      get copyWith => __$$CompanyDetailsResponseImplCopyWithImpl<
          _$CompanyDetailsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyDetailsResponseImplToJson(
      this,
    );
  }
}

abstract class _CompanyDetailsResponse extends CompanyDetailsResponse {
  const factory _CompanyDetailsResponse(
      {final ScripDetailsInfoData? info,
      final List<TimeSeriesData>? last30Days,
      final List<TimeSeriesData>? next30Days}) = _$CompanyDetailsResponseImpl;
  const _CompanyDetailsResponse._() : super._();

  factory _CompanyDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$CompanyDetailsResponseImpl.fromJson;

  @override
  ScripDetailsInfoData? get info;
  @override
  List<TimeSeriesData>? get last30Days;
  @override
  List<TimeSeriesData>? get next30Days;
  @override
  @JsonKey(ignore: true)
  _$$CompanyDetailsResponseImplCopyWith<_$CompanyDetailsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
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

ScripDetailsInfoData _$ScripDetailsInfoDataFromJson(Map<String, dynamic> json) {
  return _ScripDetailsInfoData.fromJson(json);
}

/// @nodoc
mixin _$ScripDetailsInfoData {
  String get Scrip => throw _privateConstructorUsedError;
  String get FullName => throw _privateConstructorUsedError;
  double get LastTrade => throw _privateConstructorUsedError;
  double get Volume => throw _privateConstructorUsedError;
  double get ClosePrice => throw _privateConstructorUsedError;
  double get Week1Close => throw _privateConstructorUsedError;
  double get Week52Close => throw _privateConstructorUsedError;
  String get Week52Range => throw _privateConstructorUsedError;
  double get OpenPrice => throw _privateConstructorUsedError;
  double get YCP => throw _privateConstructorUsedError;
  double get MarketCap => throw _privateConstructorUsedError;
  double get DaysValue => throw _privateConstructorUsedError;
  String get LastUpdate => throw _privateConstructorUsedError;
  String get Change => throw _privateConstructorUsedError;
  double get TotalTrade => throw _privateConstructorUsedError;
  double get AuthorizedCap => throw _privateConstructorUsedError;
  double get PaidUpCap => throw _privateConstructorUsedError;
  double get TotalSecurities => throw _privateConstructorUsedError;
  String get LastAGMHeld => throw _privateConstructorUsedError;
  double get ReserveSurplus => throw _privateConstructorUsedError;
  int get ListingYear => throw _privateConstructorUsedError;
  String get MarketCategory => throw _privateConstructorUsedError;
  String get Electronic => throw _privateConstructorUsedError;
  String get ShareHoldingPercentage => throw _privateConstructorUsedError;
  double get SponsorDirector => throw _privateConstructorUsedError;
  double get Govt => throw _privateConstructorUsedError;
  double get Institute => throw _privateConstructorUsedError;
  double get Foreign => throw _privateConstructorUsedError;
  double get Public => throw _privateConstructorUsedError;
  String get ShareHoldingPercentage1 => throw _privateConstructorUsedError;
  double get SponsorDirector1 => throw _privateConstructorUsedError;
  double get Govt1 => throw _privateConstructorUsedError;
  double get Institute1 => throw _privateConstructorUsedError;
  double get Foreign1 => throw _privateConstructorUsedError;
  double get Public1 => throw _privateConstructorUsedError;
  String get ShareHoldingPercentage2 => throw _privateConstructorUsedError;
  double get SponsorDirector2 => throw _privateConstructorUsedError;
  double get Govt2 => throw _privateConstructorUsedError;
  double get Institute2 => throw _privateConstructorUsedError;
  double get Foreign2 => throw _privateConstructorUsedError;
  double get Public2 => throw _privateConstructorUsedError;
  String get PresentOs => throw _privateConstructorUsedError;
  String get PresentLs => throw _privateConstructorUsedError;
  int get ShortLoan => throw _privateConstructorUsedError;
  int get LongLoan => throw _privateConstructorUsedError;
  String? get LatestDividendStatus => throw _privateConstructorUsedError;
  String get Address => throw _privateConstructorUsedError;
  String get Contact => throw _privateConstructorUsedError;
  String get Email => throw _privateConstructorUsedError;
  String get Web => throw _privateConstructorUsedError;
  String? get Rating => throw _privateConstructorUsedError;
  double get ChangePer => throw _privateConstructorUsedError;
  String get DayRange => throw _privateConstructorUsedError;
  double get EPS => throw _privateConstructorUsedError;
  double get AuditedPE => throw _privateConstructorUsedError;
  double get UnAuditedPE => throw _privateConstructorUsedError;
  double get Q1Eps => throw _privateConstructorUsedError;
  double get Q2Eps => throw _privateConstructorUsedError;
  double get Q3Eps => throw _privateConstructorUsedError;
  double get Q4Eps => throw _privateConstructorUsedError;
  double get NAV => throw _privateConstructorUsedError;
  double get NavPrice => throw _privateConstructorUsedError;
  double get freefloat => throw _privateConstructorUsedError;
  String get YE => throw _privateConstructorUsedError;
  double get DividentYield => throw _privateConstructorUsedError;
  String get news1stdate => throw _privateConstructorUsedError;
  String get news1sttitle => throw _privateConstructorUsedError;
  String get news1stbody => throw _privateConstructorUsedError;
  String get news2stdate => throw _privateConstructorUsedError;
  String get news2sttitle => throw _privateConstructorUsedError;
  String get news2stbody => throw _privateConstructorUsedError;
  String get news3stdate => throw _privateConstructorUsedError;
  String get news3sttitle => throw _privateConstructorUsedError;
  String get news3stbody => throw _privateConstructorUsedError;
  String get news4stdate => throw _privateConstructorUsedError;
  String get news4sttitle => throw _privateConstructorUsedError;
  String get news4stbody => throw _privateConstructorUsedError;
  String get news5stdate => throw _privateConstructorUsedError;
  String get news5sttitle => throw _privateConstructorUsedError;
  String get news5stbody => throw _privateConstructorUsedError;
  String get ma10 => throw _privateConstructorUsedError;
  String get ma20 => throw _privateConstructorUsedError;
  String get ma50 => throw _privateConstructorUsedError;
  String get ma100 => throw _privateConstructorUsedError;
  String get ma200 => throw _privateConstructorUsedError;
  String get maAVG => throw _privateConstructorUsedError;
  String get ema10 => throw _privateConstructorUsedError;
  String get ema20 => throw _privateConstructorUsedError;
  String get ema50 => throw _privateConstructorUsedError;
  String get ema100 => throw _privateConstructorUsedError;
  String get ema200 => throw _privateConstructorUsedError;
  String get emaAVG => throw _privateConstructorUsedError;
  String get stockBeta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScripDetailsInfoDataCopyWith<ScripDetailsInfoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScripDetailsInfoDataCopyWith<$Res> {
  factory $ScripDetailsInfoDataCopyWith(ScripDetailsInfoData value,
          $Res Function(ScripDetailsInfoData) then) =
      _$ScripDetailsInfoDataCopyWithImpl<$Res, ScripDetailsInfoData>;
  @useResult
  $Res call(
      {String Scrip,
      String FullName,
      double LastTrade,
      double Volume,
      double ClosePrice,
      double Week1Close,
      double Week52Close,
      String Week52Range,
      double OpenPrice,
      double YCP,
      double MarketCap,
      double DaysValue,
      String LastUpdate,
      String Change,
      double TotalTrade,
      double AuthorizedCap,
      double PaidUpCap,
      double TotalSecurities,
      String LastAGMHeld,
      double ReserveSurplus,
      int ListingYear,
      String MarketCategory,
      String Electronic,
      String ShareHoldingPercentage,
      double SponsorDirector,
      double Govt,
      double Institute,
      double Foreign,
      double Public,
      String ShareHoldingPercentage1,
      double SponsorDirector1,
      double Govt1,
      double Institute1,
      double Foreign1,
      double Public1,
      String ShareHoldingPercentage2,
      double SponsorDirector2,
      double Govt2,
      double Institute2,
      double Foreign2,
      double Public2,
      String PresentOs,
      String PresentLs,
      int ShortLoan,
      int LongLoan,
      String? LatestDividendStatus,
      String Address,
      String Contact,
      String Email,
      String Web,
      String? Rating,
      double ChangePer,
      String DayRange,
      double EPS,
      double AuditedPE,
      double UnAuditedPE,
      double Q1Eps,
      double Q2Eps,
      double Q3Eps,
      double Q4Eps,
      double NAV,
      double NavPrice,
      double freefloat,
      String YE,
      double DividentYield,
      String news1stdate,
      String news1sttitle,
      String news1stbody,
      String news2stdate,
      String news2sttitle,
      String news2stbody,
      String news3stdate,
      String news3sttitle,
      String news3stbody,
      String news4stdate,
      String news4sttitle,
      String news4stbody,
      String news5stdate,
      String news5sttitle,
      String news5stbody,
      String ma10,
      String ma20,
      String ma50,
      String ma100,
      String ma200,
      String maAVG,
      String ema10,
      String ema20,
      String ema50,
      String ema100,
      String ema200,
      String emaAVG,
      String stockBeta});
}

/// @nodoc
class _$ScripDetailsInfoDataCopyWithImpl<$Res,
        $Val extends ScripDetailsInfoData>
    implements $ScripDetailsInfoDataCopyWith<$Res> {
  _$ScripDetailsInfoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Scrip = null,
    Object? FullName = null,
    Object? LastTrade = null,
    Object? Volume = null,
    Object? ClosePrice = null,
    Object? Week1Close = null,
    Object? Week52Close = null,
    Object? Week52Range = null,
    Object? OpenPrice = null,
    Object? YCP = null,
    Object? MarketCap = null,
    Object? DaysValue = null,
    Object? LastUpdate = null,
    Object? Change = null,
    Object? TotalTrade = null,
    Object? AuthorizedCap = null,
    Object? PaidUpCap = null,
    Object? TotalSecurities = null,
    Object? LastAGMHeld = null,
    Object? ReserveSurplus = null,
    Object? ListingYear = null,
    Object? MarketCategory = null,
    Object? Electronic = null,
    Object? ShareHoldingPercentage = null,
    Object? SponsorDirector = null,
    Object? Govt = null,
    Object? Institute = null,
    Object? Foreign = null,
    Object? Public = null,
    Object? ShareHoldingPercentage1 = null,
    Object? SponsorDirector1 = null,
    Object? Govt1 = null,
    Object? Institute1 = null,
    Object? Foreign1 = null,
    Object? Public1 = null,
    Object? ShareHoldingPercentage2 = null,
    Object? SponsorDirector2 = null,
    Object? Govt2 = null,
    Object? Institute2 = null,
    Object? Foreign2 = null,
    Object? Public2 = null,
    Object? PresentOs = null,
    Object? PresentLs = null,
    Object? ShortLoan = null,
    Object? LongLoan = null,
    Object? LatestDividendStatus = freezed,
    Object? Address = null,
    Object? Contact = null,
    Object? Email = null,
    Object? Web = null,
    Object? Rating = freezed,
    Object? ChangePer = null,
    Object? DayRange = null,
    Object? EPS = null,
    Object? AuditedPE = null,
    Object? UnAuditedPE = null,
    Object? Q1Eps = null,
    Object? Q2Eps = null,
    Object? Q3Eps = null,
    Object? Q4Eps = null,
    Object? NAV = null,
    Object? NavPrice = null,
    Object? freefloat = null,
    Object? YE = null,
    Object? DividentYield = null,
    Object? news1stdate = null,
    Object? news1sttitle = null,
    Object? news1stbody = null,
    Object? news2stdate = null,
    Object? news2sttitle = null,
    Object? news2stbody = null,
    Object? news3stdate = null,
    Object? news3sttitle = null,
    Object? news3stbody = null,
    Object? news4stdate = null,
    Object? news4sttitle = null,
    Object? news4stbody = null,
    Object? news5stdate = null,
    Object? news5sttitle = null,
    Object? news5stbody = null,
    Object? ma10 = null,
    Object? ma20 = null,
    Object? ma50 = null,
    Object? ma100 = null,
    Object? ma200 = null,
    Object? maAVG = null,
    Object? ema10 = null,
    Object? ema20 = null,
    Object? ema50 = null,
    Object? ema100 = null,
    Object? ema200 = null,
    Object? emaAVG = null,
    Object? stockBeta = null,
  }) {
    return _then(_value.copyWith(
      Scrip: null == Scrip
          ? _value.Scrip
          : Scrip // ignore: cast_nullable_to_non_nullable
              as String,
      FullName: null == FullName
          ? _value.FullName
          : FullName // ignore: cast_nullable_to_non_nullable
              as String,
      LastTrade: null == LastTrade
          ? _value.LastTrade
          : LastTrade // ignore: cast_nullable_to_non_nullable
              as double,
      Volume: null == Volume
          ? _value.Volume
          : Volume // ignore: cast_nullable_to_non_nullable
              as double,
      ClosePrice: null == ClosePrice
          ? _value.ClosePrice
          : ClosePrice // ignore: cast_nullable_to_non_nullable
              as double,
      Week1Close: null == Week1Close
          ? _value.Week1Close
          : Week1Close // ignore: cast_nullable_to_non_nullable
              as double,
      Week52Close: null == Week52Close
          ? _value.Week52Close
          : Week52Close // ignore: cast_nullable_to_non_nullable
              as double,
      Week52Range: null == Week52Range
          ? _value.Week52Range
          : Week52Range // ignore: cast_nullable_to_non_nullable
              as String,
      OpenPrice: null == OpenPrice
          ? _value.OpenPrice
          : OpenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      YCP: null == YCP
          ? _value.YCP
          : YCP // ignore: cast_nullable_to_non_nullable
              as double,
      MarketCap: null == MarketCap
          ? _value.MarketCap
          : MarketCap // ignore: cast_nullable_to_non_nullable
              as double,
      DaysValue: null == DaysValue
          ? _value.DaysValue
          : DaysValue // ignore: cast_nullable_to_non_nullable
              as double,
      LastUpdate: null == LastUpdate
          ? _value.LastUpdate
          : LastUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      Change: null == Change
          ? _value.Change
          : Change // ignore: cast_nullable_to_non_nullable
              as String,
      TotalTrade: null == TotalTrade
          ? _value.TotalTrade
          : TotalTrade // ignore: cast_nullable_to_non_nullable
              as double,
      AuthorizedCap: null == AuthorizedCap
          ? _value.AuthorizedCap
          : AuthorizedCap // ignore: cast_nullable_to_non_nullable
              as double,
      PaidUpCap: null == PaidUpCap
          ? _value.PaidUpCap
          : PaidUpCap // ignore: cast_nullable_to_non_nullable
              as double,
      TotalSecurities: null == TotalSecurities
          ? _value.TotalSecurities
          : TotalSecurities // ignore: cast_nullable_to_non_nullable
              as double,
      LastAGMHeld: null == LastAGMHeld
          ? _value.LastAGMHeld
          : LastAGMHeld // ignore: cast_nullable_to_non_nullable
              as String,
      ReserveSurplus: null == ReserveSurplus
          ? _value.ReserveSurplus
          : ReserveSurplus // ignore: cast_nullable_to_non_nullable
              as double,
      ListingYear: null == ListingYear
          ? _value.ListingYear
          : ListingYear // ignore: cast_nullable_to_non_nullable
              as int,
      MarketCategory: null == MarketCategory
          ? _value.MarketCategory
          : MarketCategory // ignore: cast_nullable_to_non_nullable
              as String,
      Electronic: null == Electronic
          ? _value.Electronic
          : Electronic // ignore: cast_nullable_to_non_nullable
              as String,
      ShareHoldingPercentage: null == ShareHoldingPercentage
          ? _value.ShareHoldingPercentage
          : ShareHoldingPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      SponsorDirector: null == SponsorDirector
          ? _value.SponsorDirector
          : SponsorDirector // ignore: cast_nullable_to_non_nullable
              as double,
      Govt: null == Govt
          ? _value.Govt
          : Govt // ignore: cast_nullable_to_non_nullable
              as double,
      Institute: null == Institute
          ? _value.Institute
          : Institute // ignore: cast_nullable_to_non_nullable
              as double,
      Foreign: null == Foreign
          ? _value.Foreign
          : Foreign // ignore: cast_nullable_to_non_nullable
              as double,
      Public: null == Public
          ? _value.Public
          : Public // ignore: cast_nullable_to_non_nullable
              as double,
      ShareHoldingPercentage1: null == ShareHoldingPercentage1
          ? _value.ShareHoldingPercentage1
          : ShareHoldingPercentage1 // ignore: cast_nullable_to_non_nullable
              as String,
      SponsorDirector1: null == SponsorDirector1
          ? _value.SponsorDirector1
          : SponsorDirector1 // ignore: cast_nullable_to_non_nullable
              as double,
      Govt1: null == Govt1
          ? _value.Govt1
          : Govt1 // ignore: cast_nullable_to_non_nullable
              as double,
      Institute1: null == Institute1
          ? _value.Institute1
          : Institute1 // ignore: cast_nullable_to_non_nullable
              as double,
      Foreign1: null == Foreign1
          ? _value.Foreign1
          : Foreign1 // ignore: cast_nullable_to_non_nullable
              as double,
      Public1: null == Public1
          ? _value.Public1
          : Public1 // ignore: cast_nullable_to_non_nullable
              as double,
      ShareHoldingPercentage2: null == ShareHoldingPercentage2
          ? _value.ShareHoldingPercentage2
          : ShareHoldingPercentage2 // ignore: cast_nullable_to_non_nullable
              as String,
      SponsorDirector2: null == SponsorDirector2
          ? _value.SponsorDirector2
          : SponsorDirector2 // ignore: cast_nullable_to_non_nullable
              as double,
      Govt2: null == Govt2
          ? _value.Govt2
          : Govt2 // ignore: cast_nullable_to_non_nullable
              as double,
      Institute2: null == Institute2
          ? _value.Institute2
          : Institute2 // ignore: cast_nullable_to_non_nullable
              as double,
      Foreign2: null == Foreign2
          ? _value.Foreign2
          : Foreign2 // ignore: cast_nullable_to_non_nullable
              as double,
      Public2: null == Public2
          ? _value.Public2
          : Public2 // ignore: cast_nullable_to_non_nullable
              as double,
      PresentOs: null == PresentOs
          ? _value.PresentOs
          : PresentOs // ignore: cast_nullable_to_non_nullable
              as String,
      PresentLs: null == PresentLs
          ? _value.PresentLs
          : PresentLs // ignore: cast_nullable_to_non_nullable
              as String,
      ShortLoan: null == ShortLoan
          ? _value.ShortLoan
          : ShortLoan // ignore: cast_nullable_to_non_nullable
              as int,
      LongLoan: null == LongLoan
          ? _value.LongLoan
          : LongLoan // ignore: cast_nullable_to_non_nullable
              as int,
      LatestDividendStatus: freezed == LatestDividendStatus
          ? _value.LatestDividendStatus
          : LatestDividendStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      Address: null == Address
          ? _value.Address
          : Address // ignore: cast_nullable_to_non_nullable
              as String,
      Contact: null == Contact
          ? _value.Contact
          : Contact // ignore: cast_nullable_to_non_nullable
              as String,
      Email: null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      Web: null == Web
          ? _value.Web
          : Web // ignore: cast_nullable_to_non_nullable
              as String,
      Rating: freezed == Rating
          ? _value.Rating
          : Rating // ignore: cast_nullable_to_non_nullable
              as String?,
      ChangePer: null == ChangePer
          ? _value.ChangePer
          : ChangePer // ignore: cast_nullable_to_non_nullable
              as double,
      DayRange: null == DayRange
          ? _value.DayRange
          : DayRange // ignore: cast_nullable_to_non_nullable
              as String,
      EPS: null == EPS
          ? _value.EPS
          : EPS // ignore: cast_nullable_to_non_nullable
              as double,
      AuditedPE: null == AuditedPE
          ? _value.AuditedPE
          : AuditedPE // ignore: cast_nullable_to_non_nullable
              as double,
      UnAuditedPE: null == UnAuditedPE
          ? _value.UnAuditedPE
          : UnAuditedPE // ignore: cast_nullable_to_non_nullable
              as double,
      Q1Eps: null == Q1Eps
          ? _value.Q1Eps
          : Q1Eps // ignore: cast_nullable_to_non_nullable
              as double,
      Q2Eps: null == Q2Eps
          ? _value.Q2Eps
          : Q2Eps // ignore: cast_nullable_to_non_nullable
              as double,
      Q3Eps: null == Q3Eps
          ? _value.Q3Eps
          : Q3Eps // ignore: cast_nullable_to_non_nullable
              as double,
      Q4Eps: null == Q4Eps
          ? _value.Q4Eps
          : Q4Eps // ignore: cast_nullable_to_non_nullable
              as double,
      NAV: null == NAV
          ? _value.NAV
          : NAV // ignore: cast_nullable_to_non_nullable
              as double,
      NavPrice: null == NavPrice
          ? _value.NavPrice
          : NavPrice // ignore: cast_nullable_to_non_nullable
              as double,
      freefloat: null == freefloat
          ? _value.freefloat
          : freefloat // ignore: cast_nullable_to_non_nullable
              as double,
      YE: null == YE
          ? _value.YE
          : YE // ignore: cast_nullable_to_non_nullable
              as String,
      DividentYield: null == DividentYield
          ? _value.DividentYield
          : DividentYield // ignore: cast_nullable_to_non_nullable
              as double,
      news1stdate: null == news1stdate
          ? _value.news1stdate
          : news1stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news1sttitle: null == news1sttitle
          ? _value.news1sttitle
          : news1sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news1stbody: null == news1stbody
          ? _value.news1stbody
          : news1stbody // ignore: cast_nullable_to_non_nullable
              as String,
      news2stdate: null == news2stdate
          ? _value.news2stdate
          : news2stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news2sttitle: null == news2sttitle
          ? _value.news2sttitle
          : news2sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news2stbody: null == news2stbody
          ? _value.news2stbody
          : news2stbody // ignore: cast_nullable_to_non_nullable
              as String,
      news3stdate: null == news3stdate
          ? _value.news3stdate
          : news3stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news3sttitle: null == news3sttitle
          ? _value.news3sttitle
          : news3sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news3stbody: null == news3stbody
          ? _value.news3stbody
          : news3stbody // ignore: cast_nullable_to_non_nullable
              as String,
      news4stdate: null == news4stdate
          ? _value.news4stdate
          : news4stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news4sttitle: null == news4sttitle
          ? _value.news4sttitle
          : news4sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news4stbody: null == news4stbody
          ? _value.news4stbody
          : news4stbody // ignore: cast_nullable_to_non_nullable
              as String,
      news5stdate: null == news5stdate
          ? _value.news5stdate
          : news5stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news5sttitle: null == news5sttitle
          ? _value.news5sttitle
          : news5sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news5stbody: null == news5stbody
          ? _value.news5stbody
          : news5stbody // ignore: cast_nullable_to_non_nullable
              as String,
      ma10: null == ma10
          ? _value.ma10
          : ma10 // ignore: cast_nullable_to_non_nullable
              as String,
      ma20: null == ma20
          ? _value.ma20
          : ma20 // ignore: cast_nullable_to_non_nullable
              as String,
      ma50: null == ma50
          ? _value.ma50
          : ma50 // ignore: cast_nullable_to_non_nullable
              as String,
      ma100: null == ma100
          ? _value.ma100
          : ma100 // ignore: cast_nullable_to_non_nullable
              as String,
      ma200: null == ma200
          ? _value.ma200
          : ma200 // ignore: cast_nullable_to_non_nullable
              as String,
      maAVG: null == maAVG
          ? _value.maAVG
          : maAVG // ignore: cast_nullable_to_non_nullable
              as String,
      ema10: null == ema10
          ? _value.ema10
          : ema10 // ignore: cast_nullable_to_non_nullable
              as String,
      ema20: null == ema20
          ? _value.ema20
          : ema20 // ignore: cast_nullable_to_non_nullable
              as String,
      ema50: null == ema50
          ? _value.ema50
          : ema50 // ignore: cast_nullable_to_non_nullable
              as String,
      ema100: null == ema100
          ? _value.ema100
          : ema100 // ignore: cast_nullable_to_non_nullable
              as String,
      ema200: null == ema200
          ? _value.ema200
          : ema200 // ignore: cast_nullable_to_non_nullable
              as String,
      emaAVG: null == emaAVG
          ? _value.emaAVG
          : emaAVG // ignore: cast_nullable_to_non_nullable
              as String,
      stockBeta: null == stockBeta
          ? _value.stockBeta
          : stockBeta // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScripDetailsInfoDataImplCopyWith<$Res>
    implements $ScripDetailsInfoDataCopyWith<$Res> {
  factory _$$ScripDetailsInfoDataImplCopyWith(_$ScripDetailsInfoDataImpl value,
          $Res Function(_$ScripDetailsInfoDataImpl) then) =
      __$$ScripDetailsInfoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Scrip,
      String FullName,
      double LastTrade,
      double Volume,
      double ClosePrice,
      double Week1Close,
      double Week52Close,
      String Week52Range,
      double OpenPrice,
      double YCP,
      double MarketCap,
      double DaysValue,
      String LastUpdate,
      String Change,
      double TotalTrade,
      double AuthorizedCap,
      double PaidUpCap,
      double TotalSecurities,
      String LastAGMHeld,
      double ReserveSurplus,
      int ListingYear,
      String MarketCategory,
      String Electronic,
      String ShareHoldingPercentage,
      double SponsorDirector,
      double Govt,
      double Institute,
      double Foreign,
      double Public,
      String ShareHoldingPercentage1,
      double SponsorDirector1,
      double Govt1,
      double Institute1,
      double Foreign1,
      double Public1,
      String ShareHoldingPercentage2,
      double SponsorDirector2,
      double Govt2,
      double Institute2,
      double Foreign2,
      double Public2,
      String PresentOs,
      String PresentLs,
      int ShortLoan,
      int LongLoan,
      String? LatestDividendStatus,
      String Address,
      String Contact,
      String Email,
      String Web,
      String? Rating,
      double ChangePer,
      String DayRange,
      double EPS,
      double AuditedPE,
      double UnAuditedPE,
      double Q1Eps,
      double Q2Eps,
      double Q3Eps,
      double Q4Eps,
      double NAV,
      double NavPrice,
      double freefloat,
      String YE,
      double DividentYield,
      String news1stdate,
      String news1sttitle,
      String news1stbody,
      String news2stdate,
      String news2sttitle,
      String news2stbody,
      String news3stdate,
      String news3sttitle,
      String news3stbody,
      String news4stdate,
      String news4sttitle,
      String news4stbody,
      String news5stdate,
      String news5sttitle,
      String news5stbody,
      String ma10,
      String ma20,
      String ma50,
      String ma100,
      String ma200,
      String maAVG,
      String ema10,
      String ema20,
      String ema50,
      String ema100,
      String ema200,
      String emaAVG,
      String stockBeta});
}

/// @nodoc
class __$$ScripDetailsInfoDataImplCopyWithImpl<$Res>
    extends _$ScripDetailsInfoDataCopyWithImpl<$Res, _$ScripDetailsInfoDataImpl>
    implements _$$ScripDetailsInfoDataImplCopyWith<$Res> {
  __$$ScripDetailsInfoDataImplCopyWithImpl(_$ScripDetailsInfoDataImpl _value,
      $Res Function(_$ScripDetailsInfoDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Scrip = null,
    Object? FullName = null,
    Object? LastTrade = null,
    Object? Volume = null,
    Object? ClosePrice = null,
    Object? Week1Close = null,
    Object? Week52Close = null,
    Object? Week52Range = null,
    Object? OpenPrice = null,
    Object? YCP = null,
    Object? MarketCap = null,
    Object? DaysValue = null,
    Object? LastUpdate = null,
    Object? Change = null,
    Object? TotalTrade = null,
    Object? AuthorizedCap = null,
    Object? PaidUpCap = null,
    Object? TotalSecurities = null,
    Object? LastAGMHeld = null,
    Object? ReserveSurplus = null,
    Object? ListingYear = null,
    Object? MarketCategory = null,
    Object? Electronic = null,
    Object? ShareHoldingPercentage = null,
    Object? SponsorDirector = null,
    Object? Govt = null,
    Object? Institute = null,
    Object? Foreign = null,
    Object? Public = null,
    Object? ShareHoldingPercentage1 = null,
    Object? SponsorDirector1 = null,
    Object? Govt1 = null,
    Object? Institute1 = null,
    Object? Foreign1 = null,
    Object? Public1 = null,
    Object? ShareHoldingPercentage2 = null,
    Object? SponsorDirector2 = null,
    Object? Govt2 = null,
    Object? Institute2 = null,
    Object? Foreign2 = null,
    Object? Public2 = null,
    Object? PresentOs = null,
    Object? PresentLs = null,
    Object? ShortLoan = null,
    Object? LongLoan = null,
    Object? LatestDividendStatus = freezed,
    Object? Address = null,
    Object? Contact = null,
    Object? Email = null,
    Object? Web = null,
    Object? Rating = freezed,
    Object? ChangePer = null,
    Object? DayRange = null,
    Object? EPS = null,
    Object? AuditedPE = null,
    Object? UnAuditedPE = null,
    Object? Q1Eps = null,
    Object? Q2Eps = null,
    Object? Q3Eps = null,
    Object? Q4Eps = null,
    Object? NAV = null,
    Object? NavPrice = null,
    Object? freefloat = null,
    Object? YE = null,
    Object? DividentYield = null,
    Object? news1stdate = null,
    Object? news1sttitle = null,
    Object? news1stbody = null,
    Object? news2stdate = null,
    Object? news2sttitle = null,
    Object? news2stbody = null,
    Object? news3stdate = null,
    Object? news3sttitle = null,
    Object? news3stbody = null,
    Object? news4stdate = null,
    Object? news4sttitle = null,
    Object? news4stbody = null,
    Object? news5stdate = null,
    Object? news5sttitle = null,
    Object? news5stbody = null,
    Object? ma10 = null,
    Object? ma20 = null,
    Object? ma50 = null,
    Object? ma100 = null,
    Object? ma200 = null,
    Object? maAVG = null,
    Object? ema10 = null,
    Object? ema20 = null,
    Object? ema50 = null,
    Object? ema100 = null,
    Object? ema200 = null,
    Object? emaAVG = null,
    Object? stockBeta = null,
  }) {
    return _then(_$ScripDetailsInfoDataImpl(
      Scrip: null == Scrip
          ? _value.Scrip
          : Scrip // ignore: cast_nullable_to_non_nullable
              as String,
      FullName: null == FullName
          ? _value.FullName
          : FullName // ignore: cast_nullable_to_non_nullable
              as String,
      LastTrade: null == LastTrade
          ? _value.LastTrade
          : LastTrade // ignore: cast_nullable_to_non_nullable
              as double,
      Volume: null == Volume
          ? _value.Volume
          : Volume // ignore: cast_nullable_to_non_nullable
              as double,
      ClosePrice: null == ClosePrice
          ? _value.ClosePrice
          : ClosePrice // ignore: cast_nullable_to_non_nullable
              as double,
      Week1Close: null == Week1Close
          ? _value.Week1Close
          : Week1Close // ignore: cast_nullable_to_non_nullable
              as double,
      Week52Close: null == Week52Close
          ? _value.Week52Close
          : Week52Close // ignore: cast_nullable_to_non_nullable
              as double,
      Week52Range: null == Week52Range
          ? _value.Week52Range
          : Week52Range // ignore: cast_nullable_to_non_nullable
              as String,
      OpenPrice: null == OpenPrice
          ? _value.OpenPrice
          : OpenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      YCP: null == YCP
          ? _value.YCP
          : YCP // ignore: cast_nullable_to_non_nullable
              as double,
      MarketCap: null == MarketCap
          ? _value.MarketCap
          : MarketCap // ignore: cast_nullable_to_non_nullable
              as double,
      DaysValue: null == DaysValue
          ? _value.DaysValue
          : DaysValue // ignore: cast_nullable_to_non_nullable
              as double,
      LastUpdate: null == LastUpdate
          ? _value.LastUpdate
          : LastUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      Change: null == Change
          ? _value.Change
          : Change // ignore: cast_nullable_to_non_nullable
              as String,
      TotalTrade: null == TotalTrade
          ? _value.TotalTrade
          : TotalTrade // ignore: cast_nullable_to_non_nullable
              as double,
      AuthorizedCap: null == AuthorizedCap
          ? _value.AuthorizedCap
          : AuthorizedCap // ignore: cast_nullable_to_non_nullable
              as double,
      PaidUpCap: null == PaidUpCap
          ? _value.PaidUpCap
          : PaidUpCap // ignore: cast_nullable_to_non_nullable
              as double,
      TotalSecurities: null == TotalSecurities
          ? _value.TotalSecurities
          : TotalSecurities // ignore: cast_nullable_to_non_nullable
              as double,
      LastAGMHeld: null == LastAGMHeld
          ? _value.LastAGMHeld
          : LastAGMHeld // ignore: cast_nullable_to_non_nullable
              as String,
      ReserveSurplus: null == ReserveSurplus
          ? _value.ReserveSurplus
          : ReserveSurplus // ignore: cast_nullable_to_non_nullable
              as double,
      ListingYear: null == ListingYear
          ? _value.ListingYear
          : ListingYear // ignore: cast_nullable_to_non_nullable
              as int,
      MarketCategory: null == MarketCategory
          ? _value.MarketCategory
          : MarketCategory // ignore: cast_nullable_to_non_nullable
              as String,
      Electronic: null == Electronic
          ? _value.Electronic
          : Electronic // ignore: cast_nullable_to_non_nullable
              as String,
      ShareHoldingPercentage: null == ShareHoldingPercentage
          ? _value.ShareHoldingPercentage
          : ShareHoldingPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      SponsorDirector: null == SponsorDirector
          ? _value.SponsorDirector
          : SponsorDirector // ignore: cast_nullable_to_non_nullable
              as double,
      Govt: null == Govt
          ? _value.Govt
          : Govt // ignore: cast_nullable_to_non_nullable
              as double,
      Institute: null == Institute
          ? _value.Institute
          : Institute // ignore: cast_nullable_to_non_nullable
              as double,
      Foreign: null == Foreign
          ? _value.Foreign
          : Foreign // ignore: cast_nullable_to_non_nullable
              as double,
      Public: null == Public
          ? _value.Public
          : Public // ignore: cast_nullable_to_non_nullable
              as double,
      ShareHoldingPercentage1: null == ShareHoldingPercentage1
          ? _value.ShareHoldingPercentage1
          : ShareHoldingPercentage1 // ignore: cast_nullable_to_non_nullable
              as String,
      SponsorDirector1: null == SponsorDirector1
          ? _value.SponsorDirector1
          : SponsorDirector1 // ignore: cast_nullable_to_non_nullable
              as double,
      Govt1: null == Govt1
          ? _value.Govt1
          : Govt1 // ignore: cast_nullable_to_non_nullable
              as double,
      Institute1: null == Institute1
          ? _value.Institute1
          : Institute1 // ignore: cast_nullable_to_non_nullable
              as double,
      Foreign1: null == Foreign1
          ? _value.Foreign1
          : Foreign1 // ignore: cast_nullable_to_non_nullable
              as double,
      Public1: null == Public1
          ? _value.Public1
          : Public1 // ignore: cast_nullable_to_non_nullable
              as double,
      ShareHoldingPercentage2: null == ShareHoldingPercentage2
          ? _value.ShareHoldingPercentage2
          : ShareHoldingPercentage2 // ignore: cast_nullable_to_non_nullable
              as String,
      SponsorDirector2: null == SponsorDirector2
          ? _value.SponsorDirector2
          : SponsorDirector2 // ignore: cast_nullable_to_non_nullable
              as double,
      Govt2: null == Govt2
          ? _value.Govt2
          : Govt2 // ignore: cast_nullable_to_non_nullable
              as double,
      Institute2: null == Institute2
          ? _value.Institute2
          : Institute2 // ignore: cast_nullable_to_non_nullable
              as double,
      Foreign2: null == Foreign2
          ? _value.Foreign2
          : Foreign2 // ignore: cast_nullable_to_non_nullable
              as double,
      Public2: null == Public2
          ? _value.Public2
          : Public2 // ignore: cast_nullable_to_non_nullable
              as double,
      PresentOs: null == PresentOs
          ? _value.PresentOs
          : PresentOs // ignore: cast_nullable_to_non_nullable
              as String,
      PresentLs: null == PresentLs
          ? _value.PresentLs
          : PresentLs // ignore: cast_nullable_to_non_nullable
              as String,
      ShortLoan: null == ShortLoan
          ? _value.ShortLoan
          : ShortLoan // ignore: cast_nullable_to_non_nullable
              as int,
      LongLoan: null == LongLoan
          ? _value.LongLoan
          : LongLoan // ignore: cast_nullable_to_non_nullable
              as int,
      LatestDividendStatus: freezed == LatestDividendStatus
          ? _value.LatestDividendStatus
          : LatestDividendStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      Address: null == Address
          ? _value.Address
          : Address // ignore: cast_nullable_to_non_nullable
              as String,
      Contact: null == Contact
          ? _value.Contact
          : Contact // ignore: cast_nullable_to_non_nullable
              as String,
      Email: null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      Web: null == Web
          ? _value.Web
          : Web // ignore: cast_nullable_to_non_nullable
              as String,
      Rating: freezed == Rating
          ? _value.Rating
          : Rating // ignore: cast_nullable_to_non_nullable
              as String?,
      ChangePer: null == ChangePer
          ? _value.ChangePer
          : ChangePer // ignore: cast_nullable_to_non_nullable
              as double,
      DayRange: null == DayRange
          ? _value.DayRange
          : DayRange // ignore: cast_nullable_to_non_nullable
              as String,
      EPS: null == EPS
          ? _value.EPS
          : EPS // ignore: cast_nullable_to_non_nullable
              as double,
      AuditedPE: null == AuditedPE
          ? _value.AuditedPE
          : AuditedPE // ignore: cast_nullable_to_non_nullable
              as double,
      UnAuditedPE: null == UnAuditedPE
          ? _value.UnAuditedPE
          : UnAuditedPE // ignore: cast_nullable_to_non_nullable
              as double,
      Q1Eps: null == Q1Eps
          ? _value.Q1Eps
          : Q1Eps // ignore: cast_nullable_to_non_nullable
              as double,
      Q2Eps: null == Q2Eps
          ? _value.Q2Eps
          : Q2Eps // ignore: cast_nullable_to_non_nullable
              as double,
      Q3Eps: null == Q3Eps
          ? _value.Q3Eps
          : Q3Eps // ignore: cast_nullable_to_non_nullable
              as double,
      Q4Eps: null == Q4Eps
          ? _value.Q4Eps
          : Q4Eps // ignore: cast_nullable_to_non_nullable
              as double,
      NAV: null == NAV
          ? _value.NAV
          : NAV // ignore: cast_nullable_to_non_nullable
              as double,
      NavPrice: null == NavPrice
          ? _value.NavPrice
          : NavPrice // ignore: cast_nullable_to_non_nullable
              as double,
      freefloat: null == freefloat
          ? _value.freefloat
          : freefloat // ignore: cast_nullable_to_non_nullable
              as double,
      YE: null == YE
          ? _value.YE
          : YE // ignore: cast_nullable_to_non_nullable
              as String,
      DividentYield: null == DividentYield
          ? _value.DividentYield
          : DividentYield // ignore: cast_nullable_to_non_nullable
              as double,
      news1stdate: null == news1stdate
          ? _value.news1stdate
          : news1stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news1sttitle: null == news1sttitle
          ? _value.news1sttitle
          : news1sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news1stbody: null == news1stbody
          ? _value.news1stbody
          : news1stbody // ignore: cast_nullable_to_non_nullable
              as String,
      news2stdate: null == news2stdate
          ? _value.news2stdate
          : news2stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news2sttitle: null == news2sttitle
          ? _value.news2sttitle
          : news2sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news2stbody: null == news2stbody
          ? _value.news2stbody
          : news2stbody // ignore: cast_nullable_to_non_nullable
              as String,
      news3stdate: null == news3stdate
          ? _value.news3stdate
          : news3stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news3sttitle: null == news3sttitle
          ? _value.news3sttitle
          : news3sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news3stbody: null == news3stbody
          ? _value.news3stbody
          : news3stbody // ignore: cast_nullable_to_non_nullable
              as String,
      news4stdate: null == news4stdate
          ? _value.news4stdate
          : news4stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news4sttitle: null == news4sttitle
          ? _value.news4sttitle
          : news4sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news4stbody: null == news4stbody
          ? _value.news4stbody
          : news4stbody // ignore: cast_nullable_to_non_nullable
              as String,
      news5stdate: null == news5stdate
          ? _value.news5stdate
          : news5stdate // ignore: cast_nullable_to_non_nullable
              as String,
      news5sttitle: null == news5sttitle
          ? _value.news5sttitle
          : news5sttitle // ignore: cast_nullable_to_non_nullable
              as String,
      news5stbody: null == news5stbody
          ? _value.news5stbody
          : news5stbody // ignore: cast_nullable_to_non_nullable
              as String,
      ma10: null == ma10
          ? _value.ma10
          : ma10 // ignore: cast_nullable_to_non_nullable
              as String,
      ma20: null == ma20
          ? _value.ma20
          : ma20 // ignore: cast_nullable_to_non_nullable
              as String,
      ma50: null == ma50
          ? _value.ma50
          : ma50 // ignore: cast_nullable_to_non_nullable
              as String,
      ma100: null == ma100
          ? _value.ma100
          : ma100 // ignore: cast_nullable_to_non_nullable
              as String,
      ma200: null == ma200
          ? _value.ma200
          : ma200 // ignore: cast_nullable_to_non_nullable
              as String,
      maAVG: null == maAVG
          ? _value.maAVG
          : maAVG // ignore: cast_nullable_to_non_nullable
              as String,
      ema10: null == ema10
          ? _value.ema10
          : ema10 // ignore: cast_nullable_to_non_nullable
              as String,
      ema20: null == ema20
          ? _value.ema20
          : ema20 // ignore: cast_nullable_to_non_nullable
              as String,
      ema50: null == ema50
          ? _value.ema50
          : ema50 // ignore: cast_nullable_to_non_nullable
              as String,
      ema100: null == ema100
          ? _value.ema100
          : ema100 // ignore: cast_nullable_to_non_nullable
              as String,
      ema200: null == ema200
          ? _value.ema200
          : ema200 // ignore: cast_nullable_to_non_nullable
              as String,
      emaAVG: null == emaAVG
          ? _value.emaAVG
          : emaAVG // ignore: cast_nullable_to_non_nullable
              as String,
      stockBeta: null == stockBeta
          ? _value.stockBeta
          : stockBeta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScripDetailsInfoDataImpl extends _ScripDetailsInfoData {
  const _$ScripDetailsInfoDataImpl(
      {required this.Scrip,
      required this.FullName,
      required this.LastTrade,
      required this.Volume,
      required this.ClosePrice,
      required this.Week1Close,
      required this.Week52Close,
      required this.Week52Range,
      required this.OpenPrice,
      required this.YCP,
      required this.MarketCap,
      required this.DaysValue,
      required this.LastUpdate,
      required this.Change,
      required this.TotalTrade,
      required this.AuthorizedCap,
      required this.PaidUpCap,
      required this.TotalSecurities,
      required this.LastAGMHeld,
      required this.ReserveSurplus,
      required this.ListingYear,
      required this.MarketCategory,
      required this.Electronic,
      required this.ShareHoldingPercentage,
      required this.SponsorDirector,
      required this.Govt,
      required this.Institute,
      required this.Foreign,
      required this.Public,
      required this.ShareHoldingPercentage1,
      required this.SponsorDirector1,
      required this.Govt1,
      required this.Institute1,
      required this.Foreign1,
      required this.Public1,
      required this.ShareHoldingPercentage2,
      required this.SponsorDirector2,
      required this.Govt2,
      required this.Institute2,
      required this.Foreign2,
      required this.Public2,
      required this.PresentOs,
      required this.PresentLs,
      required this.ShortLoan,
      required this.LongLoan,
      this.LatestDividendStatus,
      required this.Address,
      required this.Contact,
      required this.Email,
      required this.Web,
      this.Rating,
      required this.ChangePer,
      required this.DayRange,
      required this.EPS,
      required this.AuditedPE,
      required this.UnAuditedPE,
      required this.Q1Eps,
      required this.Q2Eps,
      required this.Q3Eps,
      required this.Q4Eps,
      required this.NAV,
      required this.NavPrice,
      required this.freefloat,
      required this.YE,
      required this.DividentYield,
      required this.news1stdate,
      required this.news1sttitle,
      required this.news1stbody,
      required this.news2stdate,
      required this.news2sttitle,
      required this.news2stbody,
      required this.news3stdate,
      required this.news3sttitle,
      required this.news3stbody,
      required this.news4stdate,
      required this.news4sttitle,
      required this.news4stbody,
      required this.news5stdate,
      required this.news5sttitle,
      required this.news5stbody,
      required this.ma10,
      required this.ma20,
      required this.ma50,
      required this.ma100,
      required this.ma200,
      required this.maAVG,
      required this.ema10,
      required this.ema20,
      required this.ema50,
      required this.ema100,
      required this.ema200,
      required this.emaAVG,
      required this.stockBeta})
      : super._();

  factory _$ScripDetailsInfoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScripDetailsInfoDataImplFromJson(json);

  @override
  final String Scrip;
  @override
  final String FullName;
  @override
  final double LastTrade;
  @override
  final double Volume;
  @override
  final double ClosePrice;
  @override
  final double Week1Close;
  @override
  final double Week52Close;
  @override
  final String Week52Range;
  @override
  final double OpenPrice;
  @override
  final double YCP;
  @override
  final double MarketCap;
  @override
  final double DaysValue;
  @override
  final String LastUpdate;
  @override
  final String Change;
  @override
  final double TotalTrade;
  @override
  final double AuthorizedCap;
  @override
  final double PaidUpCap;
  @override
  final double TotalSecurities;
  @override
  final String LastAGMHeld;
  @override
  final double ReserveSurplus;
  @override
  final int ListingYear;
  @override
  final String MarketCategory;
  @override
  final String Electronic;
  @override
  final String ShareHoldingPercentage;
  @override
  final double SponsorDirector;
  @override
  final double Govt;
  @override
  final double Institute;
  @override
  final double Foreign;
  @override
  final double Public;
  @override
  final String ShareHoldingPercentage1;
  @override
  final double SponsorDirector1;
  @override
  final double Govt1;
  @override
  final double Institute1;
  @override
  final double Foreign1;
  @override
  final double Public1;
  @override
  final String ShareHoldingPercentage2;
  @override
  final double SponsorDirector2;
  @override
  final double Govt2;
  @override
  final double Institute2;
  @override
  final double Foreign2;
  @override
  final double Public2;
  @override
  final String PresentOs;
  @override
  final String PresentLs;
  @override
  final int ShortLoan;
  @override
  final int LongLoan;
  @override
  final String? LatestDividendStatus;
  @override
  final String Address;
  @override
  final String Contact;
  @override
  final String Email;
  @override
  final String Web;
  @override
  final String? Rating;
  @override
  final double ChangePer;
  @override
  final String DayRange;
  @override
  final double EPS;
  @override
  final double AuditedPE;
  @override
  final double UnAuditedPE;
  @override
  final double Q1Eps;
  @override
  final double Q2Eps;
  @override
  final double Q3Eps;
  @override
  final double Q4Eps;
  @override
  final double NAV;
  @override
  final double NavPrice;
  @override
  final double freefloat;
  @override
  final String YE;
  @override
  final double DividentYield;
  @override
  final String news1stdate;
  @override
  final String news1sttitle;
  @override
  final String news1stbody;
  @override
  final String news2stdate;
  @override
  final String news2sttitle;
  @override
  final String news2stbody;
  @override
  final String news3stdate;
  @override
  final String news3sttitle;
  @override
  final String news3stbody;
  @override
  final String news4stdate;
  @override
  final String news4sttitle;
  @override
  final String news4stbody;
  @override
  final String news5stdate;
  @override
  final String news5sttitle;
  @override
  final String news5stbody;
  @override
  final String ma10;
  @override
  final String ma20;
  @override
  final String ma50;
  @override
  final String ma100;
  @override
  final String ma200;
  @override
  final String maAVG;
  @override
  final String ema10;
  @override
  final String ema20;
  @override
  final String ema50;
  @override
  final String ema100;
  @override
  final String ema200;
  @override
  final String emaAVG;
  @override
  final String stockBeta;

  @override
  String toString() {
    return 'ScripDetailsInfoData(Scrip: $Scrip, FullName: $FullName, LastTrade: $LastTrade, Volume: $Volume, ClosePrice: $ClosePrice, Week1Close: $Week1Close, Week52Close: $Week52Close, Week52Range: $Week52Range, OpenPrice: $OpenPrice, YCP: $YCP, MarketCap: $MarketCap, DaysValue: $DaysValue, LastUpdate: $LastUpdate, Change: $Change, TotalTrade: $TotalTrade, AuthorizedCap: $AuthorizedCap, PaidUpCap: $PaidUpCap, TotalSecurities: $TotalSecurities, LastAGMHeld: $LastAGMHeld, ReserveSurplus: $ReserveSurplus, ListingYear: $ListingYear, MarketCategory: $MarketCategory, Electronic: $Electronic, ShareHoldingPercentage: $ShareHoldingPercentage, SponsorDirector: $SponsorDirector, Govt: $Govt, Institute: $Institute, Foreign: $Foreign, Public: $Public, ShareHoldingPercentage1: $ShareHoldingPercentage1, SponsorDirector1: $SponsorDirector1, Govt1: $Govt1, Institute1: $Institute1, Foreign1: $Foreign1, Public1: $Public1, ShareHoldingPercentage2: $ShareHoldingPercentage2, SponsorDirector2: $SponsorDirector2, Govt2: $Govt2, Institute2: $Institute2, Foreign2: $Foreign2, Public2: $Public2, PresentOs: $PresentOs, PresentLs: $PresentLs, ShortLoan: $ShortLoan, LongLoan: $LongLoan, LatestDividendStatus: $LatestDividendStatus, Address: $Address, Contact: $Contact, Email: $Email, Web: $Web, Rating: $Rating, ChangePer: $ChangePer, DayRange: $DayRange, EPS: $EPS, AuditedPE: $AuditedPE, UnAuditedPE: $UnAuditedPE, Q1Eps: $Q1Eps, Q2Eps: $Q2Eps, Q3Eps: $Q3Eps, Q4Eps: $Q4Eps, NAV: $NAV, NavPrice: $NavPrice, freefloat: $freefloat, YE: $YE, DividentYield: $DividentYield, news1stdate: $news1stdate, news1sttitle: $news1sttitle, news1stbody: $news1stbody, news2stdate: $news2stdate, news2sttitle: $news2sttitle, news2stbody: $news2stbody, news3stdate: $news3stdate, news3sttitle: $news3sttitle, news3stbody: $news3stbody, news4stdate: $news4stdate, news4sttitle: $news4sttitle, news4stbody: $news4stbody, news5stdate: $news5stdate, news5sttitle: $news5sttitle, news5stbody: $news5stbody, ma10: $ma10, ma20: $ma20, ma50: $ma50, ma100: $ma100, ma200: $ma200, maAVG: $maAVG, ema10: $ema10, ema20: $ema20, ema50: $ema50, ema100: $ema100, ema200: $ema200, emaAVG: $emaAVG, stockBeta: $stockBeta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScripDetailsInfoDataImpl &&
            (identical(other.Scrip, Scrip) || other.Scrip == Scrip) &&
            (identical(other.FullName, FullName) ||
                other.FullName == FullName) &&
            (identical(other.LastTrade, LastTrade) ||
                other.LastTrade == LastTrade) &&
            (identical(other.Volume, Volume) || other.Volume == Volume) &&
            (identical(other.ClosePrice, ClosePrice) ||
                other.ClosePrice == ClosePrice) &&
            (identical(other.Week1Close, Week1Close) ||
                other.Week1Close == Week1Close) &&
            (identical(other.Week52Close, Week52Close) ||
                other.Week52Close == Week52Close) &&
            (identical(other.Week52Range, Week52Range) ||
                other.Week52Range == Week52Range) &&
            (identical(other.OpenPrice, OpenPrice) ||
                other.OpenPrice == OpenPrice) &&
            (identical(other.YCP, YCP) || other.YCP == YCP) &&
            (identical(other.MarketCap, MarketCap) ||
                other.MarketCap == MarketCap) &&
            (identical(other.DaysValue, DaysValue) ||
                other.DaysValue == DaysValue) &&
            (identical(other.LastUpdate, LastUpdate) ||
                other.LastUpdate == LastUpdate) &&
            (identical(other.Change, Change) || other.Change == Change) &&
            (identical(other.TotalTrade, TotalTrade) ||
                other.TotalTrade == TotalTrade) &&
            (identical(other.AuthorizedCap, AuthorizedCap) ||
                other.AuthorizedCap == AuthorizedCap) &&
            (identical(other.PaidUpCap, PaidUpCap) ||
                other.PaidUpCap == PaidUpCap) &&
            (identical(other.TotalSecurities, TotalSecurities) ||
                other.TotalSecurities == TotalSecurities) &&
            (identical(other.LastAGMHeld, LastAGMHeld) ||
                other.LastAGMHeld == LastAGMHeld) &&
            (identical(other.ReserveSurplus, ReserveSurplus) ||
                other.ReserveSurplus == ReserveSurplus) &&
            (identical(other.ListingYear, ListingYear) ||
                other.ListingYear == ListingYear) &&
            (identical(other.MarketCategory, MarketCategory) ||
                other.MarketCategory == MarketCategory) &&
            (identical(other.Electronic, Electronic) ||
                other.Electronic == Electronic) &&
            (identical(other.ShareHoldingPercentage, ShareHoldingPercentage) ||
                other.ShareHoldingPercentage == ShareHoldingPercentage) &&
            (identical(other.SponsorDirector, SponsorDirector) ||
                other.SponsorDirector == SponsorDirector) &&
            (identical(other.Govt, Govt) || other.Govt == Govt) &&
            (identical(other.Institute, Institute) ||
                other.Institute == Institute) &&
            (identical(other.Foreign, Foreign) || other.Foreign == Foreign) &&
            (identical(other.Public, Public) || other.Public == Public) &&
            (identical(other.ShareHoldingPercentage1, ShareHoldingPercentage1) ||
                other.ShareHoldingPercentage1 == ShareHoldingPercentage1) &&
            (identical(other.SponsorDirector1, SponsorDirector1) ||
                other.SponsorDirector1 == SponsorDirector1) &&
            (identical(other.Govt1, Govt1) || other.Govt1 == Govt1) &&
            (identical(other.Institute1, Institute1) ||
                other.Institute1 == Institute1) &&
            (identical(other.Foreign1, Foreign1) ||
                other.Foreign1 == Foreign1) &&
            (identical(other.Public1, Public1) || other.Public1 == Public1) &&
            (identical(other.ShareHoldingPercentage2, ShareHoldingPercentage2) ||
                other.ShareHoldingPercentage2 == ShareHoldingPercentage2) &&
            (identical(other.SponsorDirector2, SponsorDirector2) ||
                other.SponsorDirector2 == SponsorDirector2) &&
            (identical(other.Govt2, Govt2) || other.Govt2 == Govt2) &&
            (identical(other.Institute2, Institute2) ||
                other.Institute2 == Institute2) &&
            (identical(other.Foreign2, Foreign2) ||
                other.Foreign2 == Foreign2) &&
            (identical(other.Public2, Public2) || other.Public2 == Public2) &&
            (identical(other.PresentOs, PresentOs) ||
                other.PresentOs == PresentOs) &&
            (identical(other.PresentLs, PresentLs) ||
                other.PresentLs == PresentLs) &&
            (identical(other.ShortLoan, ShortLoan) ||
                other.ShortLoan == ShortLoan) &&
            (identical(other.LongLoan, LongLoan) ||
                other.LongLoan == LongLoan) &&
            (identical(other.LatestDividendStatus, LatestDividendStatus) ||
                other.LatestDividendStatus == LatestDividendStatus) &&
            (identical(other.Address, Address) || other.Address == Address) &&
            (identical(other.Contact, Contact) || other.Contact == Contact) &&
            (identical(other.Email, Email) || other.Email == Email) &&
            (identical(other.Web, Web) || other.Web == Web) &&
            (identical(other.Rating, Rating) || other.Rating == Rating) &&
            (identical(other.ChangePer, ChangePer) ||
                other.ChangePer == ChangePer) &&
            (identical(other.DayRange, DayRange) ||
                other.DayRange == DayRange) &&
            (identical(other.EPS, EPS) || other.EPS == EPS) &&
            (identical(other.AuditedPE, AuditedPE) ||
                other.AuditedPE == AuditedPE) &&
            (identical(other.UnAuditedPE, UnAuditedPE) ||
                other.UnAuditedPE == UnAuditedPE) &&
            (identical(other.Q1Eps, Q1Eps) || other.Q1Eps == Q1Eps) &&
            (identical(other.Q2Eps, Q2Eps) || other.Q2Eps == Q2Eps) &&
            (identical(other.Q3Eps, Q3Eps) || other.Q3Eps == Q3Eps) &&
            (identical(other.Q4Eps, Q4Eps) || other.Q4Eps == Q4Eps) &&
            (identical(other.NAV, NAV) || other.NAV == NAV) &&
            (identical(other.NavPrice, NavPrice) || other.NavPrice == NavPrice) &&
            (identical(other.freefloat, freefloat) || other.freefloat == freefloat) &&
            (identical(other.YE, YE) || other.YE == YE) &&
            (identical(other.DividentYield, DividentYield) || other.DividentYield == DividentYield) &&
            (identical(other.news1stdate, news1stdate) || other.news1stdate == news1stdate) &&
            (identical(other.news1sttitle, news1sttitle) || other.news1sttitle == news1sttitle) &&
            (identical(other.news1stbody, news1stbody) || other.news1stbody == news1stbody) &&
            (identical(other.news2stdate, news2stdate) || other.news2stdate == news2stdate) &&
            (identical(other.news2sttitle, news2sttitle) || other.news2sttitle == news2sttitle) &&
            (identical(other.news2stbody, news2stbody) || other.news2stbody == news2stbody) &&
            (identical(other.news3stdate, news3stdate) || other.news3stdate == news3stdate) &&
            (identical(other.news3sttitle, news3sttitle) || other.news3sttitle == news3sttitle) &&
            (identical(other.news3stbody, news3stbody) || other.news3stbody == news3stbody) &&
            (identical(other.news4stdate, news4stdate) || other.news4stdate == news4stdate) &&
            (identical(other.news4sttitle, news4sttitle) || other.news4sttitle == news4sttitle) &&
            (identical(other.news4stbody, news4stbody) || other.news4stbody == news4stbody) &&
            (identical(other.news5stdate, news5stdate) || other.news5stdate == news5stdate) &&
            (identical(other.news5sttitle, news5sttitle) || other.news5sttitle == news5sttitle) &&
            (identical(other.news5stbody, news5stbody) || other.news5stbody == news5stbody) &&
            (identical(other.ma10, ma10) || other.ma10 == ma10) &&
            (identical(other.ma20, ma20) || other.ma20 == ma20) &&
            (identical(other.ma50, ma50) || other.ma50 == ma50) &&
            (identical(other.ma100, ma100) || other.ma100 == ma100) &&
            (identical(other.ma200, ma200) || other.ma200 == ma200) &&
            (identical(other.maAVG, maAVG) || other.maAVG == maAVG) &&
            (identical(other.ema10, ema10) || other.ema10 == ema10) &&
            (identical(other.ema20, ema20) || other.ema20 == ema20) &&
            (identical(other.ema50, ema50) || other.ema50 == ema50) &&
            (identical(other.ema100, ema100) || other.ema100 == ema100) &&
            (identical(other.ema200, ema200) || other.ema200 == ema200) &&
            (identical(other.emaAVG, emaAVG) || other.emaAVG == emaAVG) &&
            (identical(other.stockBeta, stockBeta) || other.stockBeta == stockBeta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        Scrip,
        FullName,
        LastTrade,
        Volume,
        ClosePrice,
        Week1Close,
        Week52Close,
        Week52Range,
        OpenPrice,
        YCP,
        MarketCap,
        DaysValue,
        LastUpdate,
        Change,
        TotalTrade,
        AuthorizedCap,
        PaidUpCap,
        TotalSecurities,
        LastAGMHeld,
        ReserveSurplus,
        ListingYear,
        MarketCategory,
        Electronic,
        ShareHoldingPercentage,
        SponsorDirector,
        Govt,
        Institute,
        Foreign,
        Public,
        ShareHoldingPercentage1,
        SponsorDirector1,
        Govt1,
        Institute1,
        Foreign1,
        Public1,
        ShareHoldingPercentage2,
        SponsorDirector2,
        Govt2,
        Institute2,
        Foreign2,
        Public2,
        PresentOs,
        PresentLs,
        ShortLoan,
        LongLoan,
        LatestDividendStatus,
        Address,
        Contact,
        Email,
        Web,
        Rating,
        ChangePer,
        DayRange,
        EPS,
        AuditedPE,
        UnAuditedPE,
        Q1Eps,
        Q2Eps,
        Q3Eps,
        Q4Eps,
        NAV,
        NavPrice,
        freefloat,
        YE,
        DividentYield,
        news1stdate,
        news1sttitle,
        news1stbody,
        news2stdate,
        news2sttitle,
        news2stbody,
        news3stdate,
        news3sttitle,
        news3stbody,
        news4stdate,
        news4sttitle,
        news4stbody,
        news5stdate,
        news5sttitle,
        news5stbody,
        ma10,
        ma20,
        ma50,
        ma100,
        ma200,
        maAVG,
        ema10,
        ema20,
        ema50,
        ema100,
        ema200,
        emaAVG,
        stockBeta
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScripDetailsInfoDataImplCopyWith<_$ScripDetailsInfoDataImpl>
      get copyWith =>
          __$$ScripDetailsInfoDataImplCopyWithImpl<_$ScripDetailsInfoDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScripDetailsInfoDataImplToJson(
      this,
    );
  }
}

abstract class _ScripDetailsInfoData extends ScripDetailsInfoData {
  const factory _ScripDetailsInfoData(
      {required final String Scrip,
      required final String FullName,
      required final double LastTrade,
      required final double Volume,
      required final double ClosePrice,
      required final double Week1Close,
      required final double Week52Close,
      required final String Week52Range,
      required final double OpenPrice,
      required final double YCP,
      required final double MarketCap,
      required final double DaysValue,
      required final String LastUpdate,
      required final String Change,
      required final double TotalTrade,
      required final double AuthorizedCap,
      required final double PaidUpCap,
      required final double TotalSecurities,
      required final String LastAGMHeld,
      required final double ReserveSurplus,
      required final int ListingYear,
      required final String MarketCategory,
      required final String Electronic,
      required final String ShareHoldingPercentage,
      required final double SponsorDirector,
      required final double Govt,
      required final double Institute,
      required final double Foreign,
      required final double Public,
      required final String ShareHoldingPercentage1,
      required final double SponsorDirector1,
      required final double Govt1,
      required final double Institute1,
      required final double Foreign1,
      required final double Public1,
      required final String ShareHoldingPercentage2,
      required final double SponsorDirector2,
      required final double Govt2,
      required final double Institute2,
      required final double Foreign2,
      required final double Public2,
      required final String PresentOs,
      required final String PresentLs,
      required final int ShortLoan,
      required final int LongLoan,
      final String? LatestDividendStatus,
      required final String Address,
      required final String Contact,
      required final String Email,
      required final String Web,
      final String? Rating,
      required final double ChangePer,
      required final String DayRange,
      required final double EPS,
      required final double AuditedPE,
      required final double UnAuditedPE,
      required final double Q1Eps,
      required final double Q2Eps,
      required final double Q3Eps,
      required final double Q4Eps,
      required final double NAV,
      required final double NavPrice,
      required final double freefloat,
      required final String YE,
      required final double DividentYield,
      required final String news1stdate,
      required final String news1sttitle,
      required final String news1stbody,
      required final String news2stdate,
      required final String news2sttitle,
      required final String news2stbody,
      required final String news3stdate,
      required final String news3sttitle,
      required final String news3stbody,
      required final String news4stdate,
      required final String news4sttitle,
      required final String news4stbody,
      required final String news5stdate,
      required final String news5sttitle,
      required final String news5stbody,
      required final String ma10,
      required final String ma20,
      required final String ma50,
      required final String ma100,
      required final String ma200,
      required final String maAVG,
      required final String ema10,
      required final String ema20,
      required final String ema50,
      required final String ema100,
      required final String ema200,
      required final String emaAVG,
      required final String stockBeta}) = _$ScripDetailsInfoDataImpl;
  const _ScripDetailsInfoData._() : super._();

  factory _ScripDetailsInfoData.fromJson(Map<String, dynamic> json) =
      _$ScripDetailsInfoDataImpl.fromJson;

  @override
  String get Scrip;
  @override
  String get FullName;
  @override
  double get LastTrade;
  @override
  double get Volume;
  @override
  double get ClosePrice;
  @override
  double get Week1Close;
  @override
  double get Week52Close;
  @override
  String get Week52Range;
  @override
  double get OpenPrice;
  @override
  double get YCP;
  @override
  double get MarketCap;
  @override
  double get DaysValue;
  @override
  String get LastUpdate;
  @override
  String get Change;
  @override
  double get TotalTrade;
  @override
  double get AuthorizedCap;
  @override
  double get PaidUpCap;
  @override
  double get TotalSecurities;
  @override
  String get LastAGMHeld;
  @override
  double get ReserveSurplus;
  @override
  int get ListingYear;
  @override
  String get MarketCategory;
  @override
  String get Electronic;
  @override
  String get ShareHoldingPercentage;
  @override
  double get SponsorDirector;
  @override
  double get Govt;
  @override
  double get Institute;
  @override
  double get Foreign;
  @override
  double get Public;
  @override
  String get ShareHoldingPercentage1;
  @override
  double get SponsorDirector1;
  @override
  double get Govt1;
  @override
  double get Institute1;
  @override
  double get Foreign1;
  @override
  double get Public1;
  @override
  String get ShareHoldingPercentage2;
  @override
  double get SponsorDirector2;
  @override
  double get Govt2;
  @override
  double get Institute2;
  @override
  double get Foreign2;
  @override
  double get Public2;
  @override
  String get PresentOs;
  @override
  String get PresentLs;
  @override
  int get ShortLoan;
  @override
  int get LongLoan;
  @override
  String? get LatestDividendStatus;
  @override
  String get Address;
  @override
  String get Contact;
  @override
  String get Email;
  @override
  String get Web;
  @override
  String? get Rating;
  @override
  double get ChangePer;
  @override
  String get DayRange;
  @override
  double get EPS;
  @override
  double get AuditedPE;
  @override
  double get UnAuditedPE;
  @override
  double get Q1Eps;
  @override
  double get Q2Eps;
  @override
  double get Q3Eps;
  @override
  double get Q4Eps;
  @override
  double get NAV;
  @override
  double get NavPrice;
  @override
  double get freefloat;
  @override
  String get YE;
  @override
  double get DividentYield;
  @override
  String get news1stdate;
  @override
  String get news1sttitle;
  @override
  String get news1stbody;
  @override
  String get news2stdate;
  @override
  String get news2sttitle;
  @override
  String get news2stbody;
  @override
  String get news3stdate;
  @override
  String get news3sttitle;
  @override
  String get news3stbody;
  @override
  String get news4stdate;
  @override
  String get news4sttitle;
  @override
  String get news4stbody;
  @override
  String get news5stdate;
  @override
  String get news5sttitle;
  @override
  String get news5stbody;
  @override
  String get ma10;
  @override
  String get ma20;
  @override
  String get ma50;
  @override
  String get ma100;
  @override
  String get ma200;
  @override
  String get maAVG;
  @override
  String get ema10;
  @override
  String get ema20;
  @override
  String get ema50;
  @override
  String get ema100;
  @override
  String get ema200;
  @override
  String get emaAVG;
  @override
  String get stockBeta;
  @override
  @JsonKey(ignore: true)
  _$$ScripDetailsInfoDataImplCopyWith<_$ScripDetailsInfoDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
