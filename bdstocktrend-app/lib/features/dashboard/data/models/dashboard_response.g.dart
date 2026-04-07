// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardResponseImpl _$$DashboardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardResponseImpl(
      dseX: (json['dseX'] as List<dynamic>?)
          ?.map((e) => TimeSeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      dseS: (json['dseS'] as List<dynamic>?)
          ?.map((e) => TimeSeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      ds30: (json['ds30'] as List<dynamic>?)
          ?.map((e) => TimeSeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdateTime: json['lastUpdateTime'] as String?,
      topCompaniesByCategory: json['topCompaniesByCategory'] == null
          ? null
          : StockData.fromJson(
              json['topCompaniesByCategory'] as Map<String, dynamic>),
      dseInfo: json['dseInfo'] == null
          ? null
          : DseInfoData.fromJson(json['dseInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardResponseImplToJson(
        _$DashboardResponseImpl instance) =>
    <String, dynamic>{
      'dseX': instance.dseX?.map((e) => e.toJson()).toList(),
      'dseS': instance.dseS?.map((e) => e.toJson()).toList(),
      'ds30': instance.ds30?.map((e) => e.toJson()).toList(),
      'lastUpdateTime': instance.lastUpdateTime,
      'topCompaniesByCategory': instance.topCompaniesByCategory?.toJson(),
      'dseInfo': instance.dseInfo?.toJson(),
    };

_$TimeSeriesDataImpl _$$TimeSeriesDataImplFromJson(Map<String, dynamic> json) =>
    _$TimeSeriesDataImpl(
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TimeSeriesDataImplToJson(
        _$TimeSeriesDataImpl instance) =>
    <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'value': instance.value,
    };

_$DseInfoDataImpl _$$DseInfoDataImplFromJson(Map<String, dynamic> json) =>
    _$DseInfoDataImpl(
      IndexValue: (json['IndexValue'] as num?)?.toDouble(),
      Change: (json['Change'] as num?)?.toDouble(),
      ChangePct: (json['ChangePct'] as num?)?.toDouble(),
      DsIndex: (json['DsIndex'] as num?)?.toDouble(),
      DsChange: (json['DsChange'] as num?)?.toDouble(),
      DsChangePct: (json['DsChangePct'] as num?)?.toDouble(),
      D30Index: (json['D30Index'] as num?)?.toDouble(),
      D30Change: (json['D30Change'] as num?)?.toDouble(),
      D30ChangePct: (json['D30ChangePct'] as num?)?.toDouble(),
      TotalTrade: (json['TotalTrade'] as num?)?.toInt(),
      TotalVolume: (json['TotalVolume'] as num?)?.toInt(),
      TotalValue: (json['TotalValue'] as num?)?.toDouble(),
      Advance: (json['Advance'] as num?)?.toInt(),
      Decline: (json['Decline'] as num?)?.toInt(),
      Unchange: (json['Unchange'] as num?)?.toInt(),
      MarketStatus: json['MarketStatus'] as String?,
      DseTime: json['DseTime'] as String?,
      IsTradeDay: json['IsTradeDay'] as bool?,
      FundamentalUpdateDate: json['FundamentalUpdateDate'] as String?,
    );

Map<String, dynamic> _$$DseInfoDataImplToJson(_$DseInfoDataImpl instance) =>
    <String, dynamic>{
      'IndexValue': instance.IndexValue,
      'Change': instance.Change,
      'ChangePct': instance.ChangePct,
      'DsIndex': instance.DsIndex,
      'DsChange': instance.DsChange,
      'DsChangePct': instance.DsChangePct,
      'D30Index': instance.D30Index,
      'D30Change': instance.D30Change,
      'D30ChangePct': instance.D30ChangePct,
      'TotalTrade': instance.TotalTrade,
      'TotalVolume': instance.TotalVolume,
      'TotalValue': instance.TotalValue,
      'Advance': instance.Advance,
      'Decline': instance.Decline,
      'Unchange': instance.Unchange,
      'MarketStatus': instance.MarketStatus,
      'DseTime': instance.DseTime,
      'IsTradeDay': instance.IsTradeDay,
      'FundamentalUpdateDate': instance.FundamentalUpdateDate,
    };

_$StockDataImpl _$$StockDataImplFromJson(Map<String, dynamic> json) =>
    _$StockDataImpl(
      value: (json['value'] as List<dynamic>)
          .map((e) => ScripData.fromJson(e as Map<String, dynamic>))
          .toList(),
      trade: (json['trade'] as List<dynamic>)
          .map((e) => ScripData.fromJson(e as Map<String, dynamic>))
          .toList(),
      volume: (json['volume'] as List<dynamic>)
          .map((e) => ScripData.fromJson(e as Map<String, dynamic>))
          .toList(),
      gainar: (json['gainar'] as List<dynamic>)
          .map((e) => ScripData.fromJson(e as Map<String, dynamic>))
          .toList(),
      loser: (json['loser'] as List<dynamic>)
          .map((e) => ScripData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StockDataImplToJson(_$StockDataImpl instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'trade': instance.trade.map((e) => e.toJson()).toList(),
      'volume': instance.volume.map((e) => e.toJson()).toList(),
      'gainar': instance.gainar.map((e) => e.toJson()).toList(),
      'loser': instance.loser.map((e) => e.toJson()).toList(),
    };

_$ScripDataImpl _$$ScripDataImplFromJson(Map<String, dynamic> json) =>
    _$ScripDataImpl(
      Scrip: json['Scrip'] as String,
      LTP: (json['LTP'] as num).toDouble(),
      Change: (json['Change'] as num).toDouble(),
      ChangePer: (json['ChangePer'] as num).toDouble(),
      Value: (json['Value'] as num).toDouble(),
      Volume: (json['Volume'] as num).toInt(),
      Trade: (json['Trade'] as num).toInt(),
      Quotes: (json['Quotes'] as List<dynamic>)
          .map((e) => QuoteData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScripDataImplToJson(_$ScripDataImpl instance) =>
    <String, dynamic>{
      'Scrip': instance.Scrip,
      'LTP': instance.LTP,
      'Change': instance.Change,
      'ChangePer': instance.ChangePer,
      'Value': instance.Value,
      'Volume': instance.Volume,
      'Trade': instance.Trade,
      'Quotes': instance.Quotes.map((e) => e.toJson()).toList(),
    };

_$QuoteDataImpl _$$QuoteDataImplFromJson(Map<String, dynamic> json) =>
    _$QuoteDataImpl(
      Close: (json['Close'] as num).toDouble(),
      Volume: (json['Volume'] as num).toInt(),
      DateString: json['DateString'] as String,
    );

Map<String, dynamic> _$$QuoteDataImplToJson(_$QuoteDataImpl instance) =>
    <String, dynamic>{
      'Close': instance.Close,
      'Volume': instance.Volume,
      'DateString': instance.DateString,
    };
