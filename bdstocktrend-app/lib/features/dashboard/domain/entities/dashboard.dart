import 'package:bd_stock_trend/common/model/time_series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard.freezed.dart';

@freezed
class Dashboard with _$Dashboard {
  const factory Dashboard({
    required List<TimeSeries> dseX,
    required List<TimeSeries> dseS,
    required List<TimeSeries> ds30,
    required String lastUpdateTime,
    required Stock topCompaniesByCategory,
    required DseInfo dseInfo,
  }) = _Dashboard;
}

@freezed
class DseInfo with _$DseInfo {
  const factory DseInfo({
    double? IndexValue,
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
    String? FundamentalUpdateDate,
  }) = _DseInfo;
}

@freezed
class Stock with _$Stock {
  const factory Stock({
    required List<ScripInfo> value,
    required List<ScripInfo> trade,
    required List<ScripInfo> volume,
    required List<ScripInfo> gainar,
    required List<ScripInfo> loser,
  }) = _Stock;
}

@freezed
class ScripInfo with _$ScripInfo {
  const factory ScripInfo({
    required String Scrip,
    required double LTP,
    required double Change,
    required double ChangePer,
    required double Value,
    required int Volume,
    required int Trade,
    required List<Quote> Quotes,
  }) = _ScripInfo;
}

@freezed
class Quote with _$Quote {
  const factory Quote({
    required double Close,
    required int Volume,
    required String DateString,
  }) = _Quote;
}

