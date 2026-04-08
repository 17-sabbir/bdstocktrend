// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyDetailsResponseImpl _$$CompanyDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyDetailsResponseImpl(
      info: json['info'] == null
          ? null
          : ScripDetailsInfoData.fromJson(json['info'] as Map<String, dynamic>),
      last30Days: (json['last30Days'] as List<dynamic>?)
          ?.map((e) => TimeSeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      next30Days: (json['next30Days'] as List<dynamic>?)
          ?.map((e) => TimeSeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      forecastMeta: json['forecastMeta'] == null
          ? null
          : ForecastMetaData.fromJson(
              json['forecastMeta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompanyDetailsResponseImplToJson(
        _$CompanyDetailsResponseImpl instance) =>
    <String, dynamic>{
      'info': instance.info?.toJson(),
      'last30Days': instance.last30Days?.map((e) => e.toJson()).toList(),
      'next30Days': instance.next30Days?.map((e) => e.toJson()).toList(),
      'forecastMeta': instance.forecastMeta?.toJson(),
    };

_$TimeSeriesDataImpl _$$TimeSeriesDataImplFromJson(Map<String, dynamic> json) =>
    _$TimeSeriesDataImpl(
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      value: (json['value'] as num?)?.toDouble(),
      low: (json['low'] as num?)?.toDouble(),
      high: (json['high'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TimeSeriesDataImplToJson(
        _$TimeSeriesDataImpl instance) =>
    <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'value': instance.value,
      'low': instance.low,
      'high': instance.high,
    };

_$ForecastMetaDataImpl _$$ForecastMetaDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ForecastMetaDataImpl(
      intervalWidth: (json['intervalWidth'] as num?)?.toDouble(),
      confidenceLevel: (json['confidenceLevel'] as num?)?.toDouble(),
      disclaimer: json['disclaimer'] as String?,
    );

Map<String, dynamic> _$$ForecastMetaDataImplToJson(
        _$ForecastMetaDataImpl instance) =>
    <String, dynamic>{
      'intervalWidth': instance.intervalWidth,
      'confidenceLevel': instance.confidenceLevel,
      'disclaimer': instance.disclaimer,
    };

_$ScripDetailsInfoDataImpl _$$ScripDetailsInfoDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ScripDetailsInfoDataImpl(
      Scrip: json['Scrip'] as String,
      FullName: json['FullName'] as String,
      LastTrade: (json['LastTrade'] as num).toDouble(),
      Volume: (json['Volume'] as num).toDouble(),
      ClosePrice: (json['ClosePrice'] as num).toDouble(),
      Week1Close: (json['Week1Close'] as num).toDouble(),
      Week52Close: (json['Week52Close'] as num).toDouble(),
      Week52Range: json['Week52Range'] as String,
      OpenPrice: (json['OpenPrice'] as num).toDouble(),
      YCP: (json['YCP'] as num).toDouble(),
      MarketCap: (json['MarketCap'] as num).toDouble(),
      DaysValue: (json['DaysValue'] as num).toDouble(),
      LastUpdate: json['LastUpdate'] as String,
      Change: json['Change'] as String,
      TotalTrade: (json['TotalTrade'] as num).toDouble(),
      AuthorizedCap: (json['AuthorizedCap'] as num).toDouble(),
      PaidUpCap: (json['PaidUpCap'] as num).toDouble(),
      TotalSecurities: (json['TotalSecurities'] as num).toDouble(),
      LastAGMHeld: json['LastAGMHeld'] as String,
      ReserveSurplus: (json['ReserveSurplus'] as num).toDouble(),
      ListingYear: (json['ListingYear'] as num).toInt(),
      MarketCategory: json['MarketCategory'] as String,
      Electronic: json['Electronic'] as String,
      ShareHoldingPercentage: json['ShareHoldingPercentage'] as String,
      SponsorDirector: (json['SponsorDirector'] as num).toDouble(),
      Govt: (json['Govt'] as num).toDouble(),
      Institute: (json['Institute'] as num).toDouble(),
      Foreign: (json['Foreign'] as num).toDouble(),
      Public: (json['Public'] as num).toDouble(),
      ShareHoldingPercentage1: json['ShareHoldingPercentage1'] as String,
      SponsorDirector1: (json['SponsorDirector1'] as num).toDouble(),
      Govt1: (json['Govt1'] as num).toDouble(),
      Institute1: (json['Institute1'] as num).toDouble(),
      Foreign1: (json['Foreign1'] as num).toDouble(),
      Public1: (json['Public1'] as num).toDouble(),
      ShareHoldingPercentage2: json['ShareHoldingPercentage2'] as String,
      SponsorDirector2: (json['SponsorDirector2'] as num).toDouble(),
      Govt2: (json['Govt2'] as num).toDouble(),
      Institute2: (json['Institute2'] as num).toDouble(),
      Foreign2: (json['Foreign2'] as num).toDouble(),
      Public2: (json['Public2'] as num).toDouble(),
      PresentOs: json['PresentOs'] as String,
      PresentLs: json['PresentLs'] as String,
      ShortLoan: (json['ShortLoan'] as num).toInt(),
      LongLoan: (json['LongLoan'] as num).toInt(),
      LatestDividendStatus: json['LatestDividendStatus'] as String?,
      Address: json['Address'] as String,
      Contact: json['Contact'] as String,
      Email: json['Email'] as String,
      Web: json['Web'] as String,
      Rating: json['Rating'] as String?,
      ChangePer: (json['ChangePer'] as num).toDouble(),
      DayRange: json['DayRange'] as String,
      EPS: (json['EPS'] as num).toDouble(),
      AuditedPE: (json['AuditedPE'] as num).toDouble(),
      UnAuditedPE: (json['UnAuditedPE'] as num).toDouble(),
      Q1Eps: (json['Q1Eps'] as num).toDouble(),
      Q2Eps: (json['Q2Eps'] as num).toDouble(),
      Q3Eps: (json['Q3Eps'] as num).toDouble(),
      Q4Eps: (json['Q4Eps'] as num).toDouble(),
      NAV: (json['NAV'] as num).toDouble(),
      NavPrice: (json['NavPrice'] as num).toDouble(),
      freefloat: (json['freefloat'] as num).toDouble(),
      YE: json['YE'] as String,
      DividentYield: (json['DividentYield'] as num).toDouble(),
      news1stdate: json['news1stdate'] as String,
      news1sttitle: json['news1sttitle'] as String,
      news1stbody: json['news1stbody'] as String,
      news2stdate: json['news2stdate'] as String,
      news2sttitle: json['news2sttitle'] as String,
      news2stbody: json['news2stbody'] as String,
      news3stdate: json['news3stdate'] as String,
      news3sttitle: json['news3sttitle'] as String,
      news3stbody: json['news3stbody'] as String,
      news4stdate: json['news4stdate'] as String,
      news4sttitle: json['news4sttitle'] as String,
      news4stbody: json['news4stbody'] as String,
      news5stdate: json['news5stdate'] as String,
      news5sttitle: json['news5sttitle'] as String,
      news5stbody: json['news5stbody'] as String,
      ma10: json['ma10'] as String,
      ma20: json['ma20'] as String,
      ma50: json['ma50'] as String,
      ma100: json['ma100'] as String,
      ma200: json['ma200'] as String,
      maAVG: json['maAVG'] as String,
      ema10: json['ema10'] as String,
      ema20: json['ema20'] as String,
      ema50: json['ema50'] as String,
      ema100: json['ema100'] as String,
      ema200: json['ema200'] as String,
      emaAVG: json['emaAVG'] as String,
      stockBeta: json['stockBeta'] as String,
    );

Map<String, dynamic> _$$ScripDetailsInfoDataImplToJson(
        _$ScripDetailsInfoDataImpl instance) =>
    <String, dynamic>{
      'Scrip': instance.Scrip,
      'FullName': instance.FullName,
      'LastTrade': instance.LastTrade,
      'Volume': instance.Volume,
      'ClosePrice': instance.ClosePrice,
      'Week1Close': instance.Week1Close,
      'Week52Close': instance.Week52Close,
      'Week52Range': instance.Week52Range,
      'OpenPrice': instance.OpenPrice,
      'YCP': instance.YCP,
      'MarketCap': instance.MarketCap,
      'DaysValue': instance.DaysValue,
      'LastUpdate': instance.LastUpdate,
      'Change': instance.Change,
      'TotalTrade': instance.TotalTrade,
      'AuthorizedCap': instance.AuthorizedCap,
      'PaidUpCap': instance.PaidUpCap,
      'TotalSecurities': instance.TotalSecurities,
      'LastAGMHeld': instance.LastAGMHeld,
      'ReserveSurplus': instance.ReserveSurplus,
      'ListingYear': instance.ListingYear,
      'MarketCategory': instance.MarketCategory,
      'Electronic': instance.Electronic,
      'ShareHoldingPercentage': instance.ShareHoldingPercentage,
      'SponsorDirector': instance.SponsorDirector,
      'Govt': instance.Govt,
      'Institute': instance.Institute,
      'Foreign': instance.Foreign,
      'Public': instance.Public,
      'ShareHoldingPercentage1': instance.ShareHoldingPercentage1,
      'SponsorDirector1': instance.SponsorDirector1,
      'Govt1': instance.Govt1,
      'Institute1': instance.Institute1,
      'Foreign1': instance.Foreign1,
      'Public1': instance.Public1,
      'ShareHoldingPercentage2': instance.ShareHoldingPercentage2,
      'SponsorDirector2': instance.SponsorDirector2,
      'Govt2': instance.Govt2,
      'Institute2': instance.Institute2,
      'Foreign2': instance.Foreign2,
      'Public2': instance.Public2,
      'PresentOs': instance.PresentOs,
      'PresentLs': instance.PresentLs,
      'ShortLoan': instance.ShortLoan,
      'LongLoan': instance.LongLoan,
      'LatestDividendStatus': instance.LatestDividendStatus,
      'Address': instance.Address,
      'Contact': instance.Contact,
      'Email': instance.Email,
      'Web': instance.Web,
      'Rating': instance.Rating,
      'ChangePer': instance.ChangePer,
      'DayRange': instance.DayRange,
      'EPS': instance.EPS,
      'AuditedPE': instance.AuditedPE,
      'UnAuditedPE': instance.UnAuditedPE,
      'Q1Eps': instance.Q1Eps,
      'Q2Eps': instance.Q2Eps,
      'Q3Eps': instance.Q3Eps,
      'Q4Eps': instance.Q4Eps,
      'NAV': instance.NAV,
      'NavPrice': instance.NavPrice,
      'freefloat': instance.freefloat,
      'YE': instance.YE,
      'DividentYield': instance.DividentYield,
      'news1stdate': instance.news1stdate,
      'news1sttitle': instance.news1sttitle,
      'news1stbody': instance.news1stbody,
      'news2stdate': instance.news2stdate,
      'news2sttitle': instance.news2sttitle,
      'news2stbody': instance.news2stbody,
      'news3stdate': instance.news3stdate,
      'news3sttitle': instance.news3sttitle,
      'news3stbody': instance.news3stbody,
      'news4stdate': instance.news4stdate,
      'news4sttitle': instance.news4sttitle,
      'news4stbody': instance.news4stbody,
      'news5stdate': instance.news5stdate,
      'news5sttitle': instance.news5sttitle,
      'news5stbody': instance.news5stbody,
      'ma10': instance.ma10,
      'ma20': instance.ma20,
      'ma50': instance.ma50,
      'ma100': instance.ma100,
      'ma200': instance.ma200,
      'maAVG': instance.maAVG,
      'ema10': instance.ema10,
      'ema20': instance.ema20,
      'ema50': instance.ema50,
      'ema100': instance.ema100,
      'ema200': instance.ema200,
      'emaAVG': instance.emaAVG,
      'stockBeta': instance.stockBeta,
    };
