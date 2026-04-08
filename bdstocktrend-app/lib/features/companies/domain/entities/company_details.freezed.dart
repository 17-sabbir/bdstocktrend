// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CompanyDetails {
  ScripDetailsInfo get info => throw _privateConstructorUsedError;
  List<TimeSeries> get last30Days => throw _privateConstructorUsedError;
  List<TimeSeries> get next30Days => throw _privateConstructorUsedError;
  ForecastMeta? get forecastMeta => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompanyDetailsCopyWith<CompanyDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyDetailsCopyWith<$Res> {
  factory $CompanyDetailsCopyWith(
          CompanyDetails value, $Res Function(CompanyDetails) then) =
      _$CompanyDetailsCopyWithImpl<$Res, CompanyDetails>;
  @useResult
  $Res call(
      {ScripDetailsInfo info,
      List<TimeSeries> last30Days,
      List<TimeSeries> next30Days,
      ForecastMeta? forecastMeta});

  $ScripDetailsInfoCopyWith<$Res> get info;
  $ForecastMetaCopyWith<$Res>? get forecastMeta;
}

/// @nodoc
class _$CompanyDetailsCopyWithImpl<$Res, $Val extends CompanyDetails>
    implements $CompanyDetailsCopyWith<$Res> {
  _$CompanyDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? last30Days = null,
    Object? next30Days = null,
    Object? forecastMeta = freezed,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ScripDetailsInfo,
      last30Days: null == last30Days
          ? _value.last30Days
          : last30Days // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      next30Days: null == next30Days
          ? _value.next30Days
          : next30Days // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      forecastMeta: freezed == forecastMeta
          ? _value.forecastMeta
          : forecastMeta // ignore: cast_nullable_to_non_nullable
              as ForecastMeta?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScripDetailsInfoCopyWith<$Res> get info {
    return $ScripDetailsInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ForecastMetaCopyWith<$Res>? get forecastMeta {
    if (_value.forecastMeta == null) {
      return null;
    }

    return $ForecastMetaCopyWith<$Res>(_value.forecastMeta!, (value) {
      return _then(_value.copyWith(forecastMeta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompanyDetailsImplCopyWith<$Res>
    implements $CompanyDetailsCopyWith<$Res> {
  factory _$$CompanyDetailsImplCopyWith(_$CompanyDetailsImpl value,
          $Res Function(_$CompanyDetailsImpl) then) =
      __$$CompanyDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScripDetailsInfo info,
      List<TimeSeries> last30Days,
      List<TimeSeries> next30Days,
      ForecastMeta? forecastMeta});

  @override
  $ScripDetailsInfoCopyWith<$Res> get info;
  @override
  $ForecastMetaCopyWith<$Res>? get forecastMeta;
}

/// @nodoc
class __$$CompanyDetailsImplCopyWithImpl<$Res>
    extends _$CompanyDetailsCopyWithImpl<$Res, _$CompanyDetailsImpl>
    implements _$$CompanyDetailsImplCopyWith<$Res> {
  __$$CompanyDetailsImplCopyWithImpl(
      _$CompanyDetailsImpl _value, $Res Function(_$CompanyDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? last30Days = null,
    Object? next30Days = null,
    Object? forecastMeta = freezed,
  }) {
    return _then(_$CompanyDetailsImpl(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ScripDetailsInfo,
      last30Days: null == last30Days
          ? _value._last30Days
          : last30Days // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      next30Days: null == next30Days
          ? _value._next30Days
          : next30Days // ignore: cast_nullable_to_non_nullable
              as List<TimeSeries>,
      forecastMeta: freezed == forecastMeta
          ? _value.forecastMeta
          : forecastMeta // ignore: cast_nullable_to_non_nullable
              as ForecastMeta?,
    ));
  }
}

/// @nodoc

class _$CompanyDetailsImpl implements _CompanyDetails {
  const _$CompanyDetailsImpl(
      {required this.info,
      required final List<TimeSeries> last30Days,
      required final List<TimeSeries> next30Days,
      this.forecastMeta})
      : _last30Days = last30Days,
        _next30Days = next30Days;

  @override
  final ScripDetailsInfo info;
  final List<TimeSeries> _last30Days;
  @override
  List<TimeSeries> get last30Days {
    if (_last30Days is EqualUnmodifiableListView) return _last30Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_last30Days);
  }

  final List<TimeSeries> _next30Days;
  @override
  List<TimeSeries> get next30Days {
    if (_next30Days is EqualUnmodifiableListView) return _next30Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_next30Days);
  }

  @override
  final ForecastMeta? forecastMeta;

  @override
  String toString() {
    return 'CompanyDetails(info: $info, last30Days: $last30Days, next30Days: $next30Days, forecastMeta: $forecastMeta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyDetailsImpl &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality()
                .equals(other._last30Days, _last30Days) &&
            const DeepCollectionEquality()
                .equals(other._next30Days, _next30Days) &&
            (identical(other.forecastMeta, forecastMeta) ||
                other.forecastMeta == forecastMeta));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      info,
      const DeepCollectionEquality().hash(_last30Days),
      const DeepCollectionEquality().hash(_next30Days),
      forecastMeta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyDetailsImplCopyWith<_$CompanyDetailsImpl> get copyWith =>
      __$$CompanyDetailsImplCopyWithImpl<_$CompanyDetailsImpl>(
          this, _$identity);
}

abstract class _CompanyDetails implements CompanyDetails {
  const factory _CompanyDetails(
      {required final ScripDetailsInfo info,
      required final List<TimeSeries> last30Days,
      required final List<TimeSeries> next30Days,
      final ForecastMeta? forecastMeta}) = _$CompanyDetailsImpl;

  @override
  ScripDetailsInfo get info;
  @override
  List<TimeSeries> get last30Days;
  @override
  List<TimeSeries> get next30Days;
  @override
  ForecastMeta? get forecastMeta;
  @override
  @JsonKey(ignore: true)
  _$$CompanyDetailsImplCopyWith<_$CompanyDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForecastMeta {
  double? get intervalWidth => throw _privateConstructorUsedError;
  double? get confidenceLevel => throw _privateConstructorUsedError;
  String? get disclaimer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastMetaCopyWith<ForecastMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastMetaCopyWith<$Res> {
  factory $ForecastMetaCopyWith(
          ForecastMeta value, $Res Function(ForecastMeta) then) =
      _$ForecastMetaCopyWithImpl<$Res, ForecastMeta>;
  @useResult
  $Res call(
      {double? intervalWidth, double? confidenceLevel, String? disclaimer});
}

/// @nodoc
class _$ForecastMetaCopyWithImpl<$Res, $Val extends ForecastMeta>
    implements $ForecastMetaCopyWith<$Res> {
  _$ForecastMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intervalWidth = freezed,
    Object? confidenceLevel = freezed,
    Object? disclaimer = freezed,
  }) {
    return _then(_value.copyWith(
      intervalWidth: freezed == intervalWidth
          ? _value.intervalWidth
          : intervalWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      confidenceLevel: freezed == confidenceLevel
          ? _value.confidenceLevel
          : confidenceLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      disclaimer: freezed == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastMetaImplCopyWith<$Res>
    implements $ForecastMetaCopyWith<$Res> {
  factory _$$ForecastMetaImplCopyWith(
          _$ForecastMetaImpl value, $Res Function(_$ForecastMetaImpl) then) =
      __$$ForecastMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? intervalWidth, double? confidenceLevel, String? disclaimer});
}

/// @nodoc
class __$$ForecastMetaImplCopyWithImpl<$Res>
    extends _$ForecastMetaCopyWithImpl<$Res, _$ForecastMetaImpl>
    implements _$$ForecastMetaImplCopyWith<$Res> {
  __$$ForecastMetaImplCopyWithImpl(
      _$ForecastMetaImpl _value, $Res Function(_$ForecastMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intervalWidth = freezed,
    Object? confidenceLevel = freezed,
    Object? disclaimer = freezed,
  }) {
    return _then(_$ForecastMetaImpl(
      intervalWidth: freezed == intervalWidth
          ? _value.intervalWidth
          : intervalWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      confidenceLevel: freezed == confidenceLevel
          ? _value.confidenceLevel
          : confidenceLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      disclaimer: freezed == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ForecastMetaImpl implements _ForecastMeta {
  const _$ForecastMetaImpl(
      {this.intervalWidth, this.confidenceLevel, this.disclaimer});

  @override
  final double? intervalWidth;
  @override
  final double? confidenceLevel;
  @override
  final String? disclaimer;

  @override
  String toString() {
    return 'ForecastMeta(intervalWidth: $intervalWidth, confidenceLevel: $confidenceLevel, disclaimer: $disclaimer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastMetaImpl &&
            (identical(other.intervalWidth, intervalWidth) ||
                other.intervalWidth == intervalWidth) &&
            (identical(other.confidenceLevel, confidenceLevel) ||
                other.confidenceLevel == confidenceLevel) &&
            (identical(other.disclaimer, disclaimer) ||
                other.disclaimer == disclaimer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, intervalWidth, confidenceLevel, disclaimer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastMetaImplCopyWith<_$ForecastMetaImpl> get copyWith =>
      __$$ForecastMetaImplCopyWithImpl<_$ForecastMetaImpl>(this, _$identity);
}

abstract class _ForecastMeta implements ForecastMeta {
  const factory _ForecastMeta(
      {final double? intervalWidth,
      final double? confidenceLevel,
      final String? disclaimer}) = _$ForecastMetaImpl;

  @override
  double? get intervalWidth;
  @override
  double? get confidenceLevel;
  @override
  String? get disclaimer;
  @override
  @JsonKey(ignore: true)
  _$$ForecastMetaImplCopyWith<_$ForecastMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScripDetailsInfo {
  String get scrip => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  double get lastTrade => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  double get closePrice => throw _privateConstructorUsedError;
  double get week1Close => throw _privateConstructorUsedError;
  double get week52Close => throw _privateConstructorUsedError;
  String get week52Range => throw _privateConstructorUsedError;
  double get openPrice => throw _privateConstructorUsedError;
  double get ycp => throw _privateConstructorUsedError;
  double get marketCap => throw _privateConstructorUsedError;
  double get daysValue => throw _privateConstructorUsedError;
  String get lastUpdate => throw _privateConstructorUsedError;
  String get change => throw _privateConstructorUsedError;
  double get totalTrade => throw _privateConstructorUsedError;
  double get authorizedCap => throw _privateConstructorUsedError;
  double get paidUpCap => throw _privateConstructorUsedError;
  double get totalSecurities => throw _privateConstructorUsedError;
  String get lastAGMHeld => throw _privateConstructorUsedError;
  double get reserveSurplus => throw _privateConstructorUsedError;
  int get listingYear => throw _privateConstructorUsedError;
  String get marketCategory => throw _privateConstructorUsedError;
  String get electronic => throw _privateConstructorUsedError;
  String get shareHoldingPercentage => throw _privateConstructorUsedError;
  double get sponsorDirector => throw _privateConstructorUsedError;
  double get govt => throw _privateConstructorUsedError;
  double get institute => throw _privateConstructorUsedError;
  double get foreign => throw _privateConstructorUsedError;
  double get public => throw _privateConstructorUsedError;
  String get shareHoldingPercentage1 => throw _privateConstructorUsedError;
  double get sponsorDirector1 => throw _privateConstructorUsedError;
  double get govt1 => throw _privateConstructorUsedError;
  double get institute1 => throw _privateConstructorUsedError;
  double get foreign1 => throw _privateConstructorUsedError;
  double get public1 => throw _privateConstructorUsedError;
  String get shareHoldingPercentage2 => throw _privateConstructorUsedError;
  double get sponsorDirector2 => throw _privateConstructorUsedError;
  double get govt2 => throw _privateConstructorUsedError;
  double get institute2 => throw _privateConstructorUsedError;
  double get foreign2 => throw _privateConstructorUsedError;
  double get public2 => throw _privateConstructorUsedError;
  String get presentOs => throw _privateConstructorUsedError;
  String get presentLs => throw _privateConstructorUsedError;
  int get shortLoan => throw _privateConstructorUsedError;
  int get longLoan => throw _privateConstructorUsedError;
  String? get latestDividendStatus => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get web => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  double get changePer => throw _privateConstructorUsedError;
  String get dayRange => throw _privateConstructorUsedError;
  double get eps => throw _privateConstructorUsedError;
  double get auditedPE => throw _privateConstructorUsedError;
  double get unAuditedPE => throw _privateConstructorUsedError;
  double get q1Eps => throw _privateConstructorUsedError;
  double get q2Eps => throw _privateConstructorUsedError;
  double get q3Eps => throw _privateConstructorUsedError;
  double get q4Eps => throw _privateConstructorUsedError;
  double get nav => throw _privateConstructorUsedError;
  double get navPrice => throw _privateConstructorUsedError;
  double get freefloat => throw _privateConstructorUsedError;
  String get ye => throw _privateConstructorUsedError;
  double get dividendYield => throw _privateConstructorUsedError;
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

  @JsonKey(ignore: true)
  $ScripDetailsInfoCopyWith<ScripDetailsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScripDetailsInfoCopyWith<$Res> {
  factory $ScripDetailsInfoCopyWith(
          ScripDetailsInfo value, $Res Function(ScripDetailsInfo) then) =
      _$ScripDetailsInfoCopyWithImpl<$Res, ScripDetailsInfo>;
  @useResult
  $Res call(
      {String scrip,
      String fullName,
      double lastTrade,
      double volume,
      double closePrice,
      double week1Close,
      double week52Close,
      String week52Range,
      double openPrice,
      double ycp,
      double marketCap,
      double daysValue,
      String lastUpdate,
      String change,
      double totalTrade,
      double authorizedCap,
      double paidUpCap,
      double totalSecurities,
      String lastAGMHeld,
      double reserveSurplus,
      int listingYear,
      String marketCategory,
      String electronic,
      String shareHoldingPercentage,
      double sponsorDirector,
      double govt,
      double institute,
      double foreign,
      double public,
      String shareHoldingPercentage1,
      double sponsorDirector1,
      double govt1,
      double institute1,
      double foreign1,
      double public1,
      String shareHoldingPercentage2,
      double sponsorDirector2,
      double govt2,
      double institute2,
      double foreign2,
      double public2,
      String presentOs,
      String presentLs,
      int shortLoan,
      int longLoan,
      String? latestDividendStatus,
      String address,
      String contact,
      String email,
      String web,
      String? rating,
      double changePer,
      String dayRange,
      double eps,
      double auditedPE,
      double unAuditedPE,
      double q1Eps,
      double q2Eps,
      double q3Eps,
      double q4Eps,
      double nav,
      double navPrice,
      double freefloat,
      String ye,
      double dividendYield,
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
class _$ScripDetailsInfoCopyWithImpl<$Res, $Val extends ScripDetailsInfo>
    implements $ScripDetailsInfoCopyWith<$Res> {
  _$ScripDetailsInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrip = null,
    Object? fullName = null,
    Object? lastTrade = null,
    Object? volume = null,
    Object? closePrice = null,
    Object? week1Close = null,
    Object? week52Close = null,
    Object? week52Range = null,
    Object? openPrice = null,
    Object? ycp = null,
    Object? marketCap = null,
    Object? daysValue = null,
    Object? lastUpdate = null,
    Object? change = null,
    Object? totalTrade = null,
    Object? authorizedCap = null,
    Object? paidUpCap = null,
    Object? totalSecurities = null,
    Object? lastAGMHeld = null,
    Object? reserveSurplus = null,
    Object? listingYear = null,
    Object? marketCategory = null,
    Object? electronic = null,
    Object? shareHoldingPercentage = null,
    Object? sponsorDirector = null,
    Object? govt = null,
    Object? institute = null,
    Object? foreign = null,
    Object? public = null,
    Object? shareHoldingPercentage1 = null,
    Object? sponsorDirector1 = null,
    Object? govt1 = null,
    Object? institute1 = null,
    Object? foreign1 = null,
    Object? public1 = null,
    Object? shareHoldingPercentage2 = null,
    Object? sponsorDirector2 = null,
    Object? govt2 = null,
    Object? institute2 = null,
    Object? foreign2 = null,
    Object? public2 = null,
    Object? presentOs = null,
    Object? presentLs = null,
    Object? shortLoan = null,
    Object? longLoan = null,
    Object? latestDividendStatus = freezed,
    Object? address = null,
    Object? contact = null,
    Object? email = null,
    Object? web = null,
    Object? rating = freezed,
    Object? changePer = null,
    Object? dayRange = null,
    Object? eps = null,
    Object? auditedPE = null,
    Object? unAuditedPE = null,
    Object? q1Eps = null,
    Object? q2Eps = null,
    Object? q3Eps = null,
    Object? q4Eps = null,
    Object? nav = null,
    Object? navPrice = null,
    Object? freefloat = null,
    Object? ye = null,
    Object? dividendYield = null,
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
      scrip: null == scrip
          ? _value.scrip
          : scrip // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      lastTrade: null == lastTrade
          ? _value.lastTrade
          : lastTrade // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      closePrice: null == closePrice
          ? _value.closePrice
          : closePrice // ignore: cast_nullable_to_non_nullable
              as double,
      week1Close: null == week1Close
          ? _value.week1Close
          : week1Close // ignore: cast_nullable_to_non_nullable
              as double,
      week52Close: null == week52Close
          ? _value.week52Close
          : week52Close // ignore: cast_nullable_to_non_nullable
              as double,
      week52Range: null == week52Range
          ? _value.week52Range
          : week52Range // ignore: cast_nullable_to_non_nullable
              as String,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      ycp: null == ycp
          ? _value.ycp
          : ycp // ignore: cast_nullable_to_non_nullable
              as double,
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double,
      daysValue: null == daysValue
          ? _value.daysValue
          : daysValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as String,
      totalTrade: null == totalTrade
          ? _value.totalTrade
          : totalTrade // ignore: cast_nullable_to_non_nullable
              as double,
      authorizedCap: null == authorizedCap
          ? _value.authorizedCap
          : authorizedCap // ignore: cast_nullable_to_non_nullable
              as double,
      paidUpCap: null == paidUpCap
          ? _value.paidUpCap
          : paidUpCap // ignore: cast_nullable_to_non_nullable
              as double,
      totalSecurities: null == totalSecurities
          ? _value.totalSecurities
          : totalSecurities // ignore: cast_nullable_to_non_nullable
              as double,
      lastAGMHeld: null == lastAGMHeld
          ? _value.lastAGMHeld
          : lastAGMHeld // ignore: cast_nullable_to_non_nullable
              as String,
      reserveSurplus: null == reserveSurplus
          ? _value.reserveSurplus
          : reserveSurplus // ignore: cast_nullable_to_non_nullable
              as double,
      listingYear: null == listingYear
          ? _value.listingYear
          : listingYear // ignore: cast_nullable_to_non_nullable
              as int,
      marketCategory: null == marketCategory
          ? _value.marketCategory
          : marketCategory // ignore: cast_nullable_to_non_nullable
              as String,
      electronic: null == electronic
          ? _value.electronic
          : electronic // ignore: cast_nullable_to_non_nullable
              as String,
      shareHoldingPercentage: null == shareHoldingPercentage
          ? _value.shareHoldingPercentage
          : shareHoldingPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      sponsorDirector: null == sponsorDirector
          ? _value.sponsorDirector
          : sponsorDirector // ignore: cast_nullable_to_non_nullable
              as double,
      govt: null == govt
          ? _value.govt
          : govt // ignore: cast_nullable_to_non_nullable
              as double,
      institute: null == institute
          ? _value.institute
          : institute // ignore: cast_nullable_to_non_nullable
              as double,
      foreign: null == foreign
          ? _value.foreign
          : foreign // ignore: cast_nullable_to_non_nullable
              as double,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as double,
      shareHoldingPercentage1: null == shareHoldingPercentage1
          ? _value.shareHoldingPercentage1
          : shareHoldingPercentage1 // ignore: cast_nullable_to_non_nullable
              as String,
      sponsorDirector1: null == sponsorDirector1
          ? _value.sponsorDirector1
          : sponsorDirector1 // ignore: cast_nullable_to_non_nullable
              as double,
      govt1: null == govt1
          ? _value.govt1
          : govt1 // ignore: cast_nullable_to_non_nullable
              as double,
      institute1: null == institute1
          ? _value.institute1
          : institute1 // ignore: cast_nullable_to_non_nullable
              as double,
      foreign1: null == foreign1
          ? _value.foreign1
          : foreign1 // ignore: cast_nullable_to_non_nullable
              as double,
      public1: null == public1
          ? _value.public1
          : public1 // ignore: cast_nullable_to_non_nullable
              as double,
      shareHoldingPercentage2: null == shareHoldingPercentage2
          ? _value.shareHoldingPercentage2
          : shareHoldingPercentage2 // ignore: cast_nullable_to_non_nullable
              as String,
      sponsorDirector2: null == sponsorDirector2
          ? _value.sponsorDirector2
          : sponsorDirector2 // ignore: cast_nullable_to_non_nullable
              as double,
      govt2: null == govt2
          ? _value.govt2
          : govt2 // ignore: cast_nullable_to_non_nullable
              as double,
      institute2: null == institute2
          ? _value.institute2
          : institute2 // ignore: cast_nullable_to_non_nullable
              as double,
      foreign2: null == foreign2
          ? _value.foreign2
          : foreign2 // ignore: cast_nullable_to_non_nullable
              as double,
      public2: null == public2
          ? _value.public2
          : public2 // ignore: cast_nullable_to_non_nullable
              as double,
      presentOs: null == presentOs
          ? _value.presentOs
          : presentOs // ignore: cast_nullable_to_non_nullable
              as String,
      presentLs: null == presentLs
          ? _value.presentLs
          : presentLs // ignore: cast_nullable_to_non_nullable
              as String,
      shortLoan: null == shortLoan
          ? _value.shortLoan
          : shortLoan // ignore: cast_nullable_to_non_nullable
              as int,
      longLoan: null == longLoan
          ? _value.longLoan
          : longLoan // ignore: cast_nullable_to_non_nullable
              as int,
      latestDividendStatus: freezed == latestDividendStatus
          ? _value.latestDividendStatus
          : latestDividendStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      web: null == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      changePer: null == changePer
          ? _value.changePer
          : changePer // ignore: cast_nullable_to_non_nullable
              as double,
      dayRange: null == dayRange
          ? _value.dayRange
          : dayRange // ignore: cast_nullable_to_non_nullable
              as String,
      eps: null == eps
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as double,
      auditedPE: null == auditedPE
          ? _value.auditedPE
          : auditedPE // ignore: cast_nullable_to_non_nullable
              as double,
      unAuditedPE: null == unAuditedPE
          ? _value.unAuditedPE
          : unAuditedPE // ignore: cast_nullable_to_non_nullable
              as double,
      q1Eps: null == q1Eps
          ? _value.q1Eps
          : q1Eps // ignore: cast_nullable_to_non_nullable
              as double,
      q2Eps: null == q2Eps
          ? _value.q2Eps
          : q2Eps // ignore: cast_nullable_to_non_nullable
              as double,
      q3Eps: null == q3Eps
          ? _value.q3Eps
          : q3Eps // ignore: cast_nullable_to_non_nullable
              as double,
      q4Eps: null == q4Eps
          ? _value.q4Eps
          : q4Eps // ignore: cast_nullable_to_non_nullable
              as double,
      nav: null == nav
          ? _value.nav
          : nav // ignore: cast_nullable_to_non_nullable
              as double,
      navPrice: null == navPrice
          ? _value.navPrice
          : navPrice // ignore: cast_nullable_to_non_nullable
              as double,
      freefloat: null == freefloat
          ? _value.freefloat
          : freefloat // ignore: cast_nullable_to_non_nullable
              as double,
      ye: null == ye
          ? _value.ye
          : ye // ignore: cast_nullable_to_non_nullable
              as String,
      dividendYield: null == dividendYield
          ? _value.dividendYield
          : dividendYield // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ScripDetailsInfoImplCopyWith<$Res>
    implements $ScripDetailsInfoCopyWith<$Res> {
  factory _$$ScripDetailsInfoImplCopyWith(_$ScripDetailsInfoImpl value,
          $Res Function(_$ScripDetailsInfoImpl) then) =
      __$$ScripDetailsInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String scrip,
      String fullName,
      double lastTrade,
      double volume,
      double closePrice,
      double week1Close,
      double week52Close,
      String week52Range,
      double openPrice,
      double ycp,
      double marketCap,
      double daysValue,
      String lastUpdate,
      String change,
      double totalTrade,
      double authorizedCap,
      double paidUpCap,
      double totalSecurities,
      String lastAGMHeld,
      double reserveSurplus,
      int listingYear,
      String marketCategory,
      String electronic,
      String shareHoldingPercentage,
      double sponsorDirector,
      double govt,
      double institute,
      double foreign,
      double public,
      String shareHoldingPercentage1,
      double sponsorDirector1,
      double govt1,
      double institute1,
      double foreign1,
      double public1,
      String shareHoldingPercentage2,
      double sponsorDirector2,
      double govt2,
      double institute2,
      double foreign2,
      double public2,
      String presentOs,
      String presentLs,
      int shortLoan,
      int longLoan,
      String? latestDividendStatus,
      String address,
      String contact,
      String email,
      String web,
      String? rating,
      double changePer,
      String dayRange,
      double eps,
      double auditedPE,
      double unAuditedPE,
      double q1Eps,
      double q2Eps,
      double q3Eps,
      double q4Eps,
      double nav,
      double navPrice,
      double freefloat,
      String ye,
      double dividendYield,
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
class __$$ScripDetailsInfoImplCopyWithImpl<$Res>
    extends _$ScripDetailsInfoCopyWithImpl<$Res, _$ScripDetailsInfoImpl>
    implements _$$ScripDetailsInfoImplCopyWith<$Res> {
  __$$ScripDetailsInfoImplCopyWithImpl(_$ScripDetailsInfoImpl _value,
      $Res Function(_$ScripDetailsInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrip = null,
    Object? fullName = null,
    Object? lastTrade = null,
    Object? volume = null,
    Object? closePrice = null,
    Object? week1Close = null,
    Object? week52Close = null,
    Object? week52Range = null,
    Object? openPrice = null,
    Object? ycp = null,
    Object? marketCap = null,
    Object? daysValue = null,
    Object? lastUpdate = null,
    Object? change = null,
    Object? totalTrade = null,
    Object? authorizedCap = null,
    Object? paidUpCap = null,
    Object? totalSecurities = null,
    Object? lastAGMHeld = null,
    Object? reserveSurplus = null,
    Object? listingYear = null,
    Object? marketCategory = null,
    Object? electronic = null,
    Object? shareHoldingPercentage = null,
    Object? sponsorDirector = null,
    Object? govt = null,
    Object? institute = null,
    Object? foreign = null,
    Object? public = null,
    Object? shareHoldingPercentage1 = null,
    Object? sponsorDirector1 = null,
    Object? govt1 = null,
    Object? institute1 = null,
    Object? foreign1 = null,
    Object? public1 = null,
    Object? shareHoldingPercentage2 = null,
    Object? sponsorDirector2 = null,
    Object? govt2 = null,
    Object? institute2 = null,
    Object? foreign2 = null,
    Object? public2 = null,
    Object? presentOs = null,
    Object? presentLs = null,
    Object? shortLoan = null,
    Object? longLoan = null,
    Object? latestDividendStatus = freezed,
    Object? address = null,
    Object? contact = null,
    Object? email = null,
    Object? web = null,
    Object? rating = freezed,
    Object? changePer = null,
    Object? dayRange = null,
    Object? eps = null,
    Object? auditedPE = null,
    Object? unAuditedPE = null,
    Object? q1Eps = null,
    Object? q2Eps = null,
    Object? q3Eps = null,
    Object? q4Eps = null,
    Object? nav = null,
    Object? navPrice = null,
    Object? freefloat = null,
    Object? ye = null,
    Object? dividendYield = null,
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
    return _then(_$ScripDetailsInfoImpl(
      scrip: null == scrip
          ? _value.scrip
          : scrip // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      lastTrade: null == lastTrade
          ? _value.lastTrade
          : lastTrade // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      closePrice: null == closePrice
          ? _value.closePrice
          : closePrice // ignore: cast_nullable_to_non_nullable
              as double,
      week1Close: null == week1Close
          ? _value.week1Close
          : week1Close // ignore: cast_nullable_to_non_nullable
              as double,
      week52Close: null == week52Close
          ? _value.week52Close
          : week52Close // ignore: cast_nullable_to_non_nullable
              as double,
      week52Range: null == week52Range
          ? _value.week52Range
          : week52Range // ignore: cast_nullable_to_non_nullable
              as String,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      ycp: null == ycp
          ? _value.ycp
          : ycp // ignore: cast_nullable_to_non_nullable
              as double,
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double,
      daysValue: null == daysValue
          ? _value.daysValue
          : daysValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as String,
      totalTrade: null == totalTrade
          ? _value.totalTrade
          : totalTrade // ignore: cast_nullable_to_non_nullable
              as double,
      authorizedCap: null == authorizedCap
          ? _value.authorizedCap
          : authorizedCap // ignore: cast_nullable_to_non_nullable
              as double,
      paidUpCap: null == paidUpCap
          ? _value.paidUpCap
          : paidUpCap // ignore: cast_nullable_to_non_nullable
              as double,
      totalSecurities: null == totalSecurities
          ? _value.totalSecurities
          : totalSecurities // ignore: cast_nullable_to_non_nullable
              as double,
      lastAGMHeld: null == lastAGMHeld
          ? _value.lastAGMHeld
          : lastAGMHeld // ignore: cast_nullable_to_non_nullable
              as String,
      reserveSurplus: null == reserveSurplus
          ? _value.reserveSurplus
          : reserveSurplus // ignore: cast_nullable_to_non_nullable
              as double,
      listingYear: null == listingYear
          ? _value.listingYear
          : listingYear // ignore: cast_nullable_to_non_nullable
              as int,
      marketCategory: null == marketCategory
          ? _value.marketCategory
          : marketCategory // ignore: cast_nullable_to_non_nullable
              as String,
      electronic: null == electronic
          ? _value.electronic
          : electronic // ignore: cast_nullable_to_non_nullable
              as String,
      shareHoldingPercentage: null == shareHoldingPercentage
          ? _value.shareHoldingPercentage
          : shareHoldingPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      sponsorDirector: null == sponsorDirector
          ? _value.sponsorDirector
          : sponsorDirector // ignore: cast_nullable_to_non_nullable
              as double,
      govt: null == govt
          ? _value.govt
          : govt // ignore: cast_nullable_to_non_nullable
              as double,
      institute: null == institute
          ? _value.institute
          : institute // ignore: cast_nullable_to_non_nullable
              as double,
      foreign: null == foreign
          ? _value.foreign
          : foreign // ignore: cast_nullable_to_non_nullable
              as double,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as double,
      shareHoldingPercentage1: null == shareHoldingPercentage1
          ? _value.shareHoldingPercentage1
          : shareHoldingPercentage1 // ignore: cast_nullable_to_non_nullable
              as String,
      sponsorDirector1: null == sponsorDirector1
          ? _value.sponsorDirector1
          : sponsorDirector1 // ignore: cast_nullable_to_non_nullable
              as double,
      govt1: null == govt1
          ? _value.govt1
          : govt1 // ignore: cast_nullable_to_non_nullable
              as double,
      institute1: null == institute1
          ? _value.institute1
          : institute1 // ignore: cast_nullable_to_non_nullable
              as double,
      foreign1: null == foreign1
          ? _value.foreign1
          : foreign1 // ignore: cast_nullable_to_non_nullable
              as double,
      public1: null == public1
          ? _value.public1
          : public1 // ignore: cast_nullable_to_non_nullable
              as double,
      shareHoldingPercentage2: null == shareHoldingPercentage2
          ? _value.shareHoldingPercentage2
          : shareHoldingPercentage2 // ignore: cast_nullable_to_non_nullable
              as String,
      sponsorDirector2: null == sponsorDirector2
          ? _value.sponsorDirector2
          : sponsorDirector2 // ignore: cast_nullable_to_non_nullable
              as double,
      govt2: null == govt2
          ? _value.govt2
          : govt2 // ignore: cast_nullable_to_non_nullable
              as double,
      institute2: null == institute2
          ? _value.institute2
          : institute2 // ignore: cast_nullable_to_non_nullable
              as double,
      foreign2: null == foreign2
          ? _value.foreign2
          : foreign2 // ignore: cast_nullable_to_non_nullable
              as double,
      public2: null == public2
          ? _value.public2
          : public2 // ignore: cast_nullable_to_non_nullable
              as double,
      presentOs: null == presentOs
          ? _value.presentOs
          : presentOs // ignore: cast_nullable_to_non_nullable
              as String,
      presentLs: null == presentLs
          ? _value.presentLs
          : presentLs // ignore: cast_nullable_to_non_nullable
              as String,
      shortLoan: null == shortLoan
          ? _value.shortLoan
          : shortLoan // ignore: cast_nullable_to_non_nullable
              as int,
      longLoan: null == longLoan
          ? _value.longLoan
          : longLoan // ignore: cast_nullable_to_non_nullable
              as int,
      latestDividendStatus: freezed == latestDividendStatus
          ? _value.latestDividendStatus
          : latestDividendStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      web: null == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      changePer: null == changePer
          ? _value.changePer
          : changePer // ignore: cast_nullable_to_non_nullable
              as double,
      dayRange: null == dayRange
          ? _value.dayRange
          : dayRange // ignore: cast_nullable_to_non_nullable
              as String,
      eps: null == eps
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as double,
      auditedPE: null == auditedPE
          ? _value.auditedPE
          : auditedPE // ignore: cast_nullable_to_non_nullable
              as double,
      unAuditedPE: null == unAuditedPE
          ? _value.unAuditedPE
          : unAuditedPE // ignore: cast_nullable_to_non_nullable
              as double,
      q1Eps: null == q1Eps
          ? _value.q1Eps
          : q1Eps // ignore: cast_nullable_to_non_nullable
              as double,
      q2Eps: null == q2Eps
          ? _value.q2Eps
          : q2Eps // ignore: cast_nullable_to_non_nullable
              as double,
      q3Eps: null == q3Eps
          ? _value.q3Eps
          : q3Eps // ignore: cast_nullable_to_non_nullable
              as double,
      q4Eps: null == q4Eps
          ? _value.q4Eps
          : q4Eps // ignore: cast_nullable_to_non_nullable
              as double,
      nav: null == nav
          ? _value.nav
          : nav // ignore: cast_nullable_to_non_nullable
              as double,
      navPrice: null == navPrice
          ? _value.navPrice
          : navPrice // ignore: cast_nullable_to_non_nullable
              as double,
      freefloat: null == freefloat
          ? _value.freefloat
          : freefloat // ignore: cast_nullable_to_non_nullable
              as double,
      ye: null == ye
          ? _value.ye
          : ye // ignore: cast_nullable_to_non_nullable
              as String,
      dividendYield: null == dividendYield
          ? _value.dividendYield
          : dividendYield // ignore: cast_nullable_to_non_nullable
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

class _$ScripDetailsInfoImpl implements _ScripDetailsInfo {
  const _$ScripDetailsInfoImpl(
      {required this.scrip,
      required this.fullName,
      required this.lastTrade,
      required this.volume,
      required this.closePrice,
      required this.week1Close,
      required this.week52Close,
      required this.week52Range,
      required this.openPrice,
      required this.ycp,
      required this.marketCap,
      required this.daysValue,
      required this.lastUpdate,
      required this.change,
      required this.totalTrade,
      required this.authorizedCap,
      required this.paidUpCap,
      required this.totalSecurities,
      required this.lastAGMHeld,
      required this.reserveSurplus,
      required this.listingYear,
      required this.marketCategory,
      required this.electronic,
      required this.shareHoldingPercentage,
      required this.sponsorDirector,
      required this.govt,
      required this.institute,
      required this.foreign,
      required this.public,
      required this.shareHoldingPercentage1,
      required this.sponsorDirector1,
      required this.govt1,
      required this.institute1,
      required this.foreign1,
      required this.public1,
      required this.shareHoldingPercentage2,
      required this.sponsorDirector2,
      required this.govt2,
      required this.institute2,
      required this.foreign2,
      required this.public2,
      required this.presentOs,
      required this.presentLs,
      required this.shortLoan,
      required this.longLoan,
      required this.latestDividendStatus,
      required this.address,
      required this.contact,
      required this.email,
      required this.web,
      required this.rating,
      required this.changePer,
      required this.dayRange,
      required this.eps,
      required this.auditedPE,
      required this.unAuditedPE,
      required this.q1Eps,
      required this.q2Eps,
      required this.q3Eps,
      required this.q4Eps,
      required this.nav,
      required this.navPrice,
      required this.freefloat,
      required this.ye,
      required this.dividendYield,
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
      required this.stockBeta});

  @override
  final String scrip;
  @override
  final String fullName;
  @override
  final double lastTrade;
  @override
  final double volume;
  @override
  final double closePrice;
  @override
  final double week1Close;
  @override
  final double week52Close;
  @override
  final String week52Range;
  @override
  final double openPrice;
  @override
  final double ycp;
  @override
  final double marketCap;
  @override
  final double daysValue;
  @override
  final String lastUpdate;
  @override
  final String change;
  @override
  final double totalTrade;
  @override
  final double authorizedCap;
  @override
  final double paidUpCap;
  @override
  final double totalSecurities;
  @override
  final String lastAGMHeld;
  @override
  final double reserveSurplus;
  @override
  final int listingYear;
  @override
  final String marketCategory;
  @override
  final String electronic;
  @override
  final String shareHoldingPercentage;
  @override
  final double sponsorDirector;
  @override
  final double govt;
  @override
  final double institute;
  @override
  final double foreign;
  @override
  final double public;
  @override
  final String shareHoldingPercentage1;
  @override
  final double sponsorDirector1;
  @override
  final double govt1;
  @override
  final double institute1;
  @override
  final double foreign1;
  @override
  final double public1;
  @override
  final String shareHoldingPercentage2;
  @override
  final double sponsorDirector2;
  @override
  final double govt2;
  @override
  final double institute2;
  @override
  final double foreign2;
  @override
  final double public2;
  @override
  final String presentOs;
  @override
  final String presentLs;
  @override
  final int shortLoan;
  @override
  final int longLoan;
  @override
  final String? latestDividendStatus;
  @override
  final String address;
  @override
  final String contact;
  @override
  final String email;
  @override
  final String web;
  @override
  final String? rating;
  @override
  final double changePer;
  @override
  final String dayRange;
  @override
  final double eps;
  @override
  final double auditedPE;
  @override
  final double unAuditedPE;
  @override
  final double q1Eps;
  @override
  final double q2Eps;
  @override
  final double q3Eps;
  @override
  final double q4Eps;
  @override
  final double nav;
  @override
  final double navPrice;
  @override
  final double freefloat;
  @override
  final String ye;
  @override
  final double dividendYield;
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
    return 'ScripDetailsInfo(scrip: $scrip, fullName: $fullName, lastTrade: $lastTrade, volume: $volume, closePrice: $closePrice, week1Close: $week1Close, week52Close: $week52Close, week52Range: $week52Range, openPrice: $openPrice, ycp: $ycp, marketCap: $marketCap, daysValue: $daysValue, lastUpdate: $lastUpdate, change: $change, totalTrade: $totalTrade, authorizedCap: $authorizedCap, paidUpCap: $paidUpCap, totalSecurities: $totalSecurities, lastAGMHeld: $lastAGMHeld, reserveSurplus: $reserveSurplus, listingYear: $listingYear, marketCategory: $marketCategory, electronic: $electronic, shareHoldingPercentage: $shareHoldingPercentage, sponsorDirector: $sponsorDirector, govt: $govt, institute: $institute, foreign: $foreign, public: $public, shareHoldingPercentage1: $shareHoldingPercentage1, sponsorDirector1: $sponsorDirector1, govt1: $govt1, institute1: $institute1, foreign1: $foreign1, public1: $public1, shareHoldingPercentage2: $shareHoldingPercentage2, sponsorDirector2: $sponsorDirector2, govt2: $govt2, institute2: $institute2, foreign2: $foreign2, public2: $public2, presentOs: $presentOs, presentLs: $presentLs, shortLoan: $shortLoan, longLoan: $longLoan, latestDividendStatus: $latestDividendStatus, address: $address, contact: $contact, email: $email, web: $web, rating: $rating, changePer: $changePer, dayRange: $dayRange, eps: $eps, auditedPE: $auditedPE, unAuditedPE: $unAuditedPE, q1Eps: $q1Eps, q2Eps: $q2Eps, q3Eps: $q3Eps, q4Eps: $q4Eps, nav: $nav, navPrice: $navPrice, freefloat: $freefloat, ye: $ye, dividendYield: $dividendYield, news1stdate: $news1stdate, news1sttitle: $news1sttitle, news1stbody: $news1stbody, news2stdate: $news2stdate, news2sttitle: $news2sttitle, news2stbody: $news2stbody, news3stdate: $news3stdate, news3sttitle: $news3sttitle, news3stbody: $news3stbody, news4stdate: $news4stdate, news4sttitle: $news4sttitle, news4stbody: $news4stbody, news5stdate: $news5stdate, news5sttitle: $news5sttitle, news5stbody: $news5stbody, ma10: $ma10, ma20: $ma20, ma50: $ma50, ma100: $ma100, ma200: $ma200, maAVG: $maAVG, ema10: $ema10, ema20: $ema20, ema50: $ema50, ema100: $ema100, ema200: $ema200, emaAVG: $emaAVG, stockBeta: $stockBeta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScripDetailsInfoImpl &&
            (identical(other.scrip, scrip) || other.scrip == scrip) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.lastTrade, lastTrade) ||
                other.lastTrade == lastTrade) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.closePrice, closePrice) ||
                other.closePrice == closePrice) &&
            (identical(other.week1Close, week1Close) ||
                other.week1Close == week1Close) &&
            (identical(other.week52Close, week52Close) ||
                other.week52Close == week52Close) &&
            (identical(other.week52Range, week52Range) ||
                other.week52Range == week52Range) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.ycp, ycp) || other.ycp == ycp) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.daysValue, daysValue) ||
                other.daysValue == daysValue) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.change, change) || other.change == change) &&
            (identical(other.totalTrade, totalTrade) ||
                other.totalTrade == totalTrade) &&
            (identical(other.authorizedCap, authorizedCap) ||
                other.authorizedCap == authorizedCap) &&
            (identical(other.paidUpCap, paidUpCap) ||
                other.paidUpCap == paidUpCap) &&
            (identical(other.totalSecurities, totalSecurities) ||
                other.totalSecurities == totalSecurities) &&
            (identical(other.lastAGMHeld, lastAGMHeld) ||
                other.lastAGMHeld == lastAGMHeld) &&
            (identical(other.reserveSurplus, reserveSurplus) ||
                other.reserveSurplus == reserveSurplus) &&
            (identical(other.listingYear, listingYear) ||
                other.listingYear == listingYear) &&
            (identical(other.marketCategory, marketCategory) ||
                other.marketCategory == marketCategory) &&
            (identical(other.electronic, electronic) ||
                other.electronic == electronic) &&
            (identical(other.shareHoldingPercentage, shareHoldingPercentage) ||
                other.shareHoldingPercentage == shareHoldingPercentage) &&
            (identical(other.sponsorDirector, sponsorDirector) ||
                other.sponsorDirector == sponsorDirector) &&
            (identical(other.govt, govt) || other.govt == govt) &&
            (identical(other.institute, institute) ||
                other.institute == institute) &&
            (identical(other.foreign, foreign) || other.foreign == foreign) &&
            (identical(other.public, public) || other.public == public) &&
            (identical(other.shareHoldingPercentage1, shareHoldingPercentage1) ||
                other.shareHoldingPercentage1 == shareHoldingPercentage1) &&
            (identical(other.sponsorDirector1, sponsorDirector1) ||
                other.sponsorDirector1 == sponsorDirector1) &&
            (identical(other.govt1, govt1) || other.govt1 == govt1) &&
            (identical(other.institute1, institute1) ||
                other.institute1 == institute1) &&
            (identical(other.foreign1, foreign1) ||
                other.foreign1 == foreign1) &&
            (identical(other.public1, public1) || other.public1 == public1) &&
            (identical(other.shareHoldingPercentage2, shareHoldingPercentage2) ||
                other.shareHoldingPercentage2 == shareHoldingPercentage2) &&
            (identical(other.sponsorDirector2, sponsorDirector2) ||
                other.sponsorDirector2 == sponsorDirector2) &&
            (identical(other.govt2, govt2) || other.govt2 == govt2) &&
            (identical(other.institute2, institute2) ||
                other.institute2 == institute2) &&
            (identical(other.foreign2, foreign2) ||
                other.foreign2 == foreign2) &&
            (identical(other.public2, public2) || other.public2 == public2) &&
            (identical(other.presentOs, presentOs) ||
                other.presentOs == presentOs) &&
            (identical(other.presentLs, presentLs) ||
                other.presentLs == presentLs) &&
            (identical(other.shortLoan, shortLoan) ||
                other.shortLoan == shortLoan) &&
            (identical(other.longLoan, longLoan) ||
                other.longLoan == longLoan) &&
            (identical(other.latestDividendStatus, latestDividendStatus) ||
                other.latestDividendStatus == latestDividendStatus) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.web, web) || other.web == web) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.changePer, changePer) ||
                other.changePer == changePer) &&
            (identical(other.dayRange, dayRange) ||
                other.dayRange == dayRange) &&
            (identical(other.eps, eps) || other.eps == eps) &&
            (identical(other.auditedPE, auditedPE) ||
                other.auditedPE == auditedPE) &&
            (identical(other.unAuditedPE, unAuditedPE) ||
                other.unAuditedPE == unAuditedPE) &&
            (identical(other.q1Eps, q1Eps) || other.q1Eps == q1Eps) &&
            (identical(other.q2Eps, q2Eps) || other.q2Eps == q2Eps) &&
            (identical(other.q3Eps, q3Eps) || other.q3Eps == q3Eps) &&
            (identical(other.q4Eps, q4Eps) || other.q4Eps == q4Eps) &&
            (identical(other.nav, nav) || other.nav == nav) &&
            (identical(other.navPrice, navPrice) || other.navPrice == navPrice) &&
            (identical(other.freefloat, freefloat) || other.freefloat == freefloat) &&
            (identical(other.ye, ye) || other.ye == ye) &&
            (identical(other.dividendYield, dividendYield) || other.dividendYield == dividendYield) &&
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

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        scrip,
        fullName,
        lastTrade,
        volume,
        closePrice,
        week1Close,
        week52Close,
        week52Range,
        openPrice,
        ycp,
        marketCap,
        daysValue,
        lastUpdate,
        change,
        totalTrade,
        authorizedCap,
        paidUpCap,
        totalSecurities,
        lastAGMHeld,
        reserveSurplus,
        listingYear,
        marketCategory,
        electronic,
        shareHoldingPercentage,
        sponsorDirector,
        govt,
        institute,
        foreign,
        public,
        shareHoldingPercentage1,
        sponsorDirector1,
        govt1,
        institute1,
        foreign1,
        public1,
        shareHoldingPercentage2,
        sponsorDirector2,
        govt2,
        institute2,
        foreign2,
        public2,
        presentOs,
        presentLs,
        shortLoan,
        longLoan,
        latestDividendStatus,
        address,
        contact,
        email,
        web,
        rating,
        changePer,
        dayRange,
        eps,
        auditedPE,
        unAuditedPE,
        q1Eps,
        q2Eps,
        q3Eps,
        q4Eps,
        nav,
        navPrice,
        freefloat,
        ye,
        dividendYield,
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
  _$$ScripDetailsInfoImplCopyWith<_$ScripDetailsInfoImpl> get copyWith =>
      __$$ScripDetailsInfoImplCopyWithImpl<_$ScripDetailsInfoImpl>(
          this, _$identity);
}

abstract class _ScripDetailsInfo implements ScripDetailsInfo {
  const factory _ScripDetailsInfo(
      {required final String scrip,
      required final String fullName,
      required final double lastTrade,
      required final double volume,
      required final double closePrice,
      required final double week1Close,
      required final double week52Close,
      required final String week52Range,
      required final double openPrice,
      required final double ycp,
      required final double marketCap,
      required final double daysValue,
      required final String lastUpdate,
      required final String change,
      required final double totalTrade,
      required final double authorizedCap,
      required final double paidUpCap,
      required final double totalSecurities,
      required final String lastAGMHeld,
      required final double reserveSurplus,
      required final int listingYear,
      required final String marketCategory,
      required final String electronic,
      required final String shareHoldingPercentage,
      required final double sponsorDirector,
      required final double govt,
      required final double institute,
      required final double foreign,
      required final double public,
      required final String shareHoldingPercentage1,
      required final double sponsorDirector1,
      required final double govt1,
      required final double institute1,
      required final double foreign1,
      required final double public1,
      required final String shareHoldingPercentage2,
      required final double sponsorDirector2,
      required final double govt2,
      required final double institute2,
      required final double foreign2,
      required final double public2,
      required final String presentOs,
      required final String presentLs,
      required final int shortLoan,
      required final int longLoan,
      required final String? latestDividendStatus,
      required final String address,
      required final String contact,
      required final String email,
      required final String web,
      required final String? rating,
      required final double changePer,
      required final String dayRange,
      required final double eps,
      required final double auditedPE,
      required final double unAuditedPE,
      required final double q1Eps,
      required final double q2Eps,
      required final double q3Eps,
      required final double q4Eps,
      required final double nav,
      required final double navPrice,
      required final double freefloat,
      required final String ye,
      required final double dividendYield,
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
      required final String stockBeta}) = _$ScripDetailsInfoImpl;

  @override
  String get scrip;
  @override
  String get fullName;
  @override
  double get lastTrade;
  @override
  double get volume;
  @override
  double get closePrice;
  @override
  double get week1Close;
  @override
  double get week52Close;
  @override
  String get week52Range;
  @override
  double get openPrice;
  @override
  double get ycp;
  @override
  double get marketCap;
  @override
  double get daysValue;
  @override
  String get lastUpdate;
  @override
  String get change;
  @override
  double get totalTrade;
  @override
  double get authorizedCap;
  @override
  double get paidUpCap;
  @override
  double get totalSecurities;
  @override
  String get lastAGMHeld;
  @override
  double get reserveSurplus;
  @override
  int get listingYear;
  @override
  String get marketCategory;
  @override
  String get electronic;
  @override
  String get shareHoldingPercentage;
  @override
  double get sponsorDirector;
  @override
  double get govt;
  @override
  double get institute;
  @override
  double get foreign;
  @override
  double get public;
  @override
  String get shareHoldingPercentage1;
  @override
  double get sponsorDirector1;
  @override
  double get govt1;
  @override
  double get institute1;
  @override
  double get foreign1;
  @override
  double get public1;
  @override
  String get shareHoldingPercentage2;
  @override
  double get sponsorDirector2;
  @override
  double get govt2;
  @override
  double get institute2;
  @override
  double get foreign2;
  @override
  double get public2;
  @override
  String get presentOs;
  @override
  String get presentLs;
  @override
  int get shortLoan;
  @override
  int get longLoan;
  @override
  String? get latestDividendStatus;
  @override
  String get address;
  @override
  String get contact;
  @override
  String get email;
  @override
  String get web;
  @override
  String? get rating;
  @override
  double get changePer;
  @override
  String get dayRange;
  @override
  double get eps;
  @override
  double get auditedPE;
  @override
  double get unAuditedPE;
  @override
  double get q1Eps;
  @override
  double get q2Eps;
  @override
  double get q3Eps;
  @override
  double get q4Eps;
  @override
  double get nav;
  @override
  double get navPrice;
  @override
  double get freefloat;
  @override
  String get ye;
  @override
  double get dividendYield;
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
  _$$ScripDetailsInfoImplCopyWith<_$ScripDetailsInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
