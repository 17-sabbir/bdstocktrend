
import 'package:bd_stock_trend/common/model/time_series.dart';
import 'package:bd_stock_trend/features/dashboard/domain/entities/dashboard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_response.freezed.dart';
part 'dashboard_response.g.dart';

@freezed
class DashboardResponse with _$DashboardResponse {
  const factory DashboardResponse({
    List<TimeSeriesData>? dseX,
    List<TimeSeriesData>? dseS,
    List<TimeSeriesData>? ds30,
    String? lastUpdateTime,
    StockData? topCompaniesByCategory,
    DseInfoData? dseInfo,
  }) = _DashboardResponse;

  const DashboardResponse._();

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);

  Dashboard toEntity() {
    final dseXList = dseX!
        .map<TimeSeries>(
          (model) => TimeSeries(
            time: model.time ?? DateTime.now(),
            value: model.value ?? 0.0,
          ),
        ).toList();

    final dseSList = dseS!
        .map<TimeSeries>(
          (model) => TimeSeries(
            time: model.time ?? DateTime.now(),
            value: model.value ?? 0.0,
          ),
        ).toList();

    final ds30List = ds30!
        .map<TimeSeries>(
          (model) => TimeSeries(
            time: model.time ?? DateTime.now(),
            value: model.value ?? 0.0,
          ),
        ).toList();

    final topByCategory = topCompaniesByCategory?.toEntity();

    final info = dseInfo?.toEntity();

    return Dashboard(dseX: dseXList, dseS: dseSList, ds30: ds30List, lastUpdateTime: lastUpdateTime ?? '', topCompaniesByCategory: topByCategory!, dseInfo: info!);
  }
}


@freezed
class TimeSeriesData with _$TimeSeriesData {
  const factory TimeSeriesData({
    DateTime? time,
    double? value,
  }) = _TimeSeriesData;

  factory TimeSeriesData.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesDataFromJson(json);
}


@freezed
class DseInfoData with _$DseInfoData {
  const factory DseInfoData({
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
  }) = _DseInfoData;

  const DseInfoData._();

  factory DseInfoData.fromJson(Map<String, dynamic> json) =>
      _$DseInfoDataFromJson(json);

  DseInfo toEntity() {
    return DseInfo(
      IndexValue: IndexValue,
      Change: Change,
      ChangePct: ChangePct,
      DsIndex: DsIndex,
      DsChange: DsChange,
      DsChangePct: DsChangePct,
      D30Index: D30Index,
      D30Change: D30Change,
      D30ChangePct: D30ChangePct,
      TotalTrade: TotalTrade,
      TotalVolume: TotalVolume,
      TotalValue: TotalValue,
      Advance: Advance,
      Decline: Decline,
      Unchange: Unchange,
      MarketStatus: MarketStatus,
      DseTime: DseTime,
      IsTradeDay: IsTradeDay,
      FundamentalUpdateDate: FundamentalUpdateDate,
    );
  }
}


@freezed
class StockData with _$StockData {
  const factory StockData({
    required List<ScripData> value,
    required List<ScripData> trade,
    required List<ScripData> volume,
    required List<ScripData> gainar,
    required List<ScripData> loser,
  }) = _StockData;

  const StockData._();

  factory StockData.fromJson(Map<String, dynamic> json) => _$StockDataFromJson(json);

  Stock toEntity() {
    return Stock(
      value: value.map((scripData) => scripData.toEntity()).toList(),
      trade: trade.map((scripData) => scripData.toEntity()).toList(),
      volume: volume.map((scripData) => scripData.toEntity()).toList(),
      gainar: gainar.map((scripData) => scripData.toEntity()).toList(),
      loser: loser.map((scripData) => scripData.toEntity()).toList(),
    );
  }
}

@freezed
class ScripData with _$ScripData {
  const factory ScripData({
    required String Scrip,
    required double LTP,
    required double Change,
    required double ChangePer,
    required double Value,
    required int Volume,
    required int Trade,
    required List<QuoteData> Quotes,
  }) = _ScripData;

  const ScripData._();

  factory ScripData.fromJson(Map<String, dynamic> json) => _$ScripDataFromJson(json);

  ScripInfo toEntity() {
    return ScripInfo(
      Scrip: Scrip,
      LTP: LTP,
      Change: Change,
      ChangePer: ChangePer,
      Value: Value,
      Volume: Volume,
      Trade: Trade,
      Quotes: Quotes.map((quoteData) => quoteData.toEntity()).toList(),
    );
  }
}

@freezed
class QuoteData with _$QuoteData {
  const factory QuoteData({
    required double Close,
    required int Volume,
    required String DateString,
  }) = _QuoteData;

  const QuoteData._();

  factory QuoteData.fromJson(Map<String, dynamic> json) => _$QuoteDataFromJson(json);

  Quote toEntity() {
    return Quote(
      Close: Close,
      Volume: Volume,
      DateString: DateString,
    );
  }
}




