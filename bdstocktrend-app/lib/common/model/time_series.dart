import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_series.freezed.dart';

@freezed
class TimeSeries with _$TimeSeries {
  const factory TimeSeries({
    required DateTime time,
    required double value,
  }) = _TimeSeries;
}