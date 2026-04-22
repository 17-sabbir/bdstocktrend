import 'dart:math' as math;
import 'dart:math';

import 'package:bd_stock_trend/common/model/time_series.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LineChartSample4 extends StatefulWidget {
  final List<TimeSeries> historicalData;
  final List<TimeSeries> forecastData;

  const LineChartSample4({
    super.key,
    required this.historicalData,
    required this.forecastData,
  });

  @override
  State<LineChartSample4> createState() => _LineChartSample4State();
}

class _VerticalPointHighlighter2 extends CustomPainter {
  final List<FlSpot> spots1;
  final List<FlSpot> spots2;
  final FlSpot? transitionSpot;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final int step;
  final double leftReserved;
  final double bottomReserved;
  final Color color;
  final double strokeWidth;
  final Color dotFillColor;
  final Color dotPrimaryStrokeColor;
  final Color dotSecondaryStrokeColor;
  final double dotRadius;

  _VerticalPointHighlighter2({
    required this.spots1,
    required this.spots2,
    this.transitionSpot,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    required this.step,
    required this.leftReserved,
    required this.bottomReserved,
    required this.color,
    required this.strokeWidth,
    required this.dotFillColor,
    required this.dotPrimaryStrokeColor,
    required this.dotSecondaryStrokeColor,
    required this.dotRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final allSpots = <FlSpot>[];
    allSpots.addAll(spots1);
    allSpots.addAll(spots2);

    if (allSpots.isEmpty) return;
    if (maxX <= minX || maxY <= minY) return;

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final fillPaint = Paint()
      ..color = dotFillColor
      ..style = PaintingStyle.fill;

    final plotWidth = size.width - leftReserved;
    final plotHeight = size.height - bottomReserved;

    if (plotWidth <= 0 || plotHeight <= 0) return;

    const double dayInMs = 24 * 60 * 60 * 1000;
    final seen = <int, FlSpot>{};

    // pick one spot per calendar-day index (prefer spots1 if collision)
    for (var s in spots1) {
      final dayIndex = ((s.x - minX) / dayInMs).round();
      if (dayIndex % step != 0) continue;
      seen.putIfAbsent(dayIndex, () => s);
    }
    for (var s in spots2) {
      final dayIndex = ((s.x - minX) / dayInMs).round();
      if (dayIndex % step != 0) continue;
      seen.putIfAbsent(dayIndex, () => s);
    }

    for (var entry in seen.entries) {
      final s = entry.value;
      final xNorm = (s.x - minX) / (maxX - minX);
      final px = leftReserved + (xNorm * plotWidth);
      final yNorm = (maxY - s.y) / (maxY - minY);
      final py = (yNorm * plotHeight).clamp(0.0, plotHeight);

      // vertical highlight: stop slightly below the dot so the dot's bottom
      // edge is not overlapped by the highlight line.
      final endY = (py + dotRadius).clamp(0.0, plotHeight);
      canvas.drawLine(Offset(px, plotHeight), Offset(px, endY), linePaint);

      // choose stroke color based on which list contained the spot
      final strokeColor = spots1.any((sp) => sp.x == s.x && sp.y == s.y)
          ? dotPrimaryStrokeColor
          : dotSecondaryStrokeColor;
      final strokePaint = Paint()
        ..color = strokeColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.3;

      // redraw dot on top
      canvas.drawCircle(Offset(px, py), dotRadius, fillPaint);
      canvas.drawCircle(Offset(px, py), dotRadius, strokePaint);
    }

    // Always keep the historical/forecast junction visible, even when it is
    // not aligned with the 7-day cadence.
    if (transitionSpot != null) {
      final s = transitionSpot!;
      final xNorm = (s.x - minX) / (maxX - minX);
      final px = leftReserved + (xNorm * plotWidth);
      final yNorm = (maxY - s.y) / (maxY - minY);
      final py = (yNorm * plotHeight).clamp(0.0, plotHeight);
      final endY = (py + dotRadius).clamp(0.0, plotHeight);

      final emphasisLine = Paint()
        ..color = color.withOpacity(0.98)
        ..strokeWidth = strokeWidth + 0.4
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.square;

      canvas.drawLine(Offset(px, plotHeight), Offset(px, endY), emphasisLine);

      final transitionStrokePaint = Paint()
        ..color = dotPrimaryStrokeColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6;
      canvas.drawCircle(Offset(px, py), dotRadius, fillPaint);
      canvas.drawCircle(Offset(px, py), dotRadius, transitionStrokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _LineChartSample4State extends State<LineChartSample4> {
  static const double _pointSpacing = 15;
  static const double _dayInMs = 24 * 60 * 60 * 1000;
  static const int _labelStepDays = 7;
  static const int _edgePaddingDays = 1;
  static const double _contentPaddingLeft = 12;
  static const double _contentPaddingRight = 18;

  List<Color> gradientColors1 = [
    Colors.greenAccent,
    Colors.green,
  ];

  List<Color> gradientColors2 = [
    Colors.redAccent,
    Colors.red,
  ];

  List<FlSpot> _values1 = const [];
  List<FlSpot> _values2 = const [];

  double _minX = 0;

  double _maxX = 0;
  double _focusX = 0;
  double _minY = 0;
  double _maxY = 0;
  double _leftTitlesInterval = 0;
  int _leftTitlesDecimals = 0;

  late final TransformationController _transformationController;
  late final ScrollController _scrollController;
  bool _initialScrollApplied = false;
  bool _initialScrollCallbackScheduled = false;

  void _applyYAxisBounds({required double dataMinY, required double dataMaxY}) {
    final safeMin = dataMinY.isFinite ? dataMinY : 0;
    final safeMax = dataMaxY.isFinite ? dataMaxY : 0;
    final base = max(max(safeMin.abs(), safeMax.abs()), 1.0);
    final range = (safeMax - safeMin).abs();

    final padding =
        range == 0 ? base * 0.05 : max(max(range * 0.10, base * 0.005), 0.01);

    var minY = safeMin - padding;
    var maxY = safeMax + padding;

    // Compute a "nice" interval dynamically so the Y-axis ticks look clean
    double interval;
    if (range <= 0) {
      interval = base / 10;
      if (interval <= 0) interval = 1.0;
    } else {
      const int targetTicks = 6;
      final raw = range / targetTicks;
      final exp = math.pow(10, (math.log(raw) / math.ln10).floor()).toDouble();
      final frac = raw / exp;
      double niceFrac;
      if (frac <= 1) {
        niceFrac = 1;
      } else if (frac <= 2) {
        niceFrac = 2;
      } else if (frac <= 5) {
        niceFrac = 5;
      } else {
        niceFrac = 10;
      }
      interval = niceFrac * exp;
      if (interval <= 0) interval = 1.0;
    }

    minY = (minY / interval).floorToDouble() * interval;
    maxY = (maxY / interval).ceilToDouble() * interval;

    if (minY == maxY) {
      maxY = minY + interval;
    }

    int decimals = 0;
    var tmp = interval;
    while (tmp < 1 && decimals < 6) {
      tmp *= 10;
      decimals++;
    }

    _minY = minY;
    _maxY = maxY;
    _leftTitlesInterval = interval;
    _leftTitlesDecimals = decimals;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _transformationController = TransformationController(
      Matrix4.identity()..scale(0.9),
    );
    _prepareStockData();
  }

  @override
  void dispose() {
    _initialScrollCallbackScheduled = false;
    _scrollController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LineChartSample4 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.historicalData, widget.historicalData) ||
        !identical(oldWidget.forecastData, widget.forecastData)) {
      _prepareStockData();
    }
  }

  void _prepareStockData() {
    if (widget.historicalData.isEmpty && widget.forecastData.isEmpty) {
      _values1 = const [];
      _values2 = const [];
      _minX = 0;
      _maxX = 1;
      _focusX = 0.5;
      _minY = 0;
      _maxY = 1;
      _leftTitlesInterval = 1;
      _leftTitlesDecimals = 0;
      _initialScrollApplied = false;
      _initialScrollCallbackScheduled = false;
      if (mounted) setState(() {});
      return;
    }

    _values1 = widget.historicalData
        .map((datum) => FlSpot(
              datum.time.millisecondsSinceEpoch.toDouble(),
              datum.value,
            ))
        .toList();

    _values2 = widget.forecastData
        .map((datum) => FlSpot(
              datum.time.millisecondsSinceEpoch.toDouble(),
              datum.value,
            ))
        .toList();

    // join the series so the forecast connects to history
    if (_values1.isNotEmpty && _values2.isNotEmpty) {
      _values2.insert(0, _values1.last);
    }

    final allValues = <FlSpot>[..._values1, ..._values2];
    final minY = allValues.map((s) => s.y).reduce(math.min);
    final maxY = allValues.map((s) => s.y).reduce(math.max);

    final dataMinX = allValues.map((s) => s.x).reduce(math.min);
    final dataMaxX = allValues.map((s) => s.x).reduce(math.max);

    _focusX = _values1.isNotEmpty ? _values1.last.x : (dataMinX + dataMaxX) / 2;

    final leftSpan = (_focusX - dataMinX).abs();
    final rightSpan = (dataMaxX - _focusX).abs();
    final balancedHalfSpan = math.max(leftSpan, rightSpan);
    final safeHalfSpan = balancedHalfSpan <= 0 ? _dayInMs : balancedHalfSpan;
    final edgePadding = _edgePaddingDays * _dayInMs;

    _minX = _focusX - safeHalfSpan - edgePadding;
    _maxX = _focusX + safeHalfSpan + edgePadding;

    _applyYAxisBounds(dataMinY: minY, dataMaxY: maxY);
    _initialScrollApplied = false;
    _initialScrollCallbackScheduled = false;

    if (mounted) setState(() {});
  }

  void _scheduleInitialScroll({
    required double desiredWidth,
    required double viewportWidth,
    required double chartWidth,
  }) {
    if (!mounted || _initialScrollApplied || _initialScrollCallbackScheduled) {
      return;
    }

    _initialScrollCallbackScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialScrollCallbackScheduled = false;
      if (!mounted) return;

      _applyInitialScroll(
        desiredWidth: desiredWidth,
        viewportWidth: viewportWidth,
        chartWidth: chartWidth,
      );
    });
  }

  void _applyInitialScroll({
    required double desiredWidth,
    required double viewportWidth,
    required double chartWidth,
  }) {
    if (_initialScrollApplied || !_scrollController.hasClients) return;

    final maxScroll =
        (desiredWidth - viewportWidth).clamp(0.0, double.infinity);
    if (maxScroll <= 0) {
      _initialScrollApplied = true;
      return;
    }

    final span = (_maxX - _minX);
    if (span <= 0) {
      _initialScrollApplied = true;
      return;
    }

    final ratio = ((_focusX - _minX) / span).clamp(0.0, 1.0);
    final focusPixels = _contentPaddingLeft + (ratio * chartWidth);
    final target = (focusPixels - viewportWidth / 2).clamp(0.0, maxScroll);

    _scrollController.jumpTo(target);
    _initialScrollApplied = true;
  }

  @override
  Widget build(BuildContext context) {
    final labelColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.65);
    final gridColor = Theme.of(context).dividerColor.withOpacity(0.35);

    return LayoutBuilder(
      builder: (context, constraints) {
        final spanDays = (_maxX - _minX) / _dayInMs;
        final desiredWidth = math.max(
          constraints.maxWidth,
          spanDays * _pointSpacing,
        );
        final chartWidth =
            (desiredWidth - _contentPaddingLeft - _contentPaddingRight)
                .clamp(0.0, double.infinity);

        _scheduleInitialScroll(
          desiredWidth: desiredWidth,
          viewportWidth: constraints.maxWidth,
          chartWidth: chartWidth,
        );

        return SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: desiredWidth,
            height: constraints.maxHeight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: _contentPaddingRight,
                left: _contentPaddingLeft,
                top: 24,
                bottom: 12,
              ),
              child: InteractiveViewer(
                panEnabled: true,
                scaleEnabled: true,
                transformationController: _transformationController,
                minScale: 0.85,
                maxScale: 3,
                child: Stack(
                  children: [
                    LineChart(
                      mainData(labelColor: labelColor, gridColor: gridColor),
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linearToEaseOut,
                    ),
                    Positioned.fill(
                      child: IgnorePointer(
                        child: CustomPaint(
                          painter: _VerticalPointHighlighter2(
                            spots1: _values1,
                            spots2: _values2,
                            transitionSpot:
                                _values1.isNotEmpty ? _values1.last : null,
                            minX: _minX,
                            maxX: _maxX,
                            minY: _minY,
                            maxY: _maxY,
                            step: _labelStepDays,
                            leftReserved: 44,
                            bottomReserved: 48,
                            color: gridColor.withOpacity(0.95),
                            strokeWidth: 2.0,
                            dotFillColor: Theme.of(context).colorScheme.surface,
                            dotPrimaryStrokeColor: gradientColors1.last,
                            dotSecondaryStrokeColor: gradientColors2.last,
                            dotRadius: 1.8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SideTitles bottomTitles({required Color labelColor}) {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        final DateTime date =
            DateTime.fromMillisecondsSinceEpoch(value.toInt());

        if (value == meta.max || value == meta.min) {
          return Container();
        }
        final tick = ((value - _minX) / _dayInMs).round().abs();
        // Show label only for every 7th day; hide intermediate day labels
        if (tick % _labelStepDays != 0) return Container();

        final time = DateFormat('dd/MM/yyyy').format(date);

        return SideTitleWidget(
          meta: meta,
          space: 6,
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Text(
              time,
              style: TextStyle(color: labelColor, fontSize: 11),
            ),
          ),
        );
      },
      reservedSize: 48,
      interval: _dayInMs,
    );
  }

  SideTitles leftTitles({required Color labelColor}) {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Text(
          value.toStringAsFixed(_leftTitlesDecimals),
          style: TextStyle(color: labelColor, fontSize: 12),
        );
      },
      reservedSize: 44,
      interval: _leftTitlesInterval,
    );
  }

  FlGridData gridData({required Color gridColor}) {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: gridColor,
          strokeWidth: 1,
          dashArray: const [2, 3],
        );
      },
      getDrawingVerticalLine: (value) {
        // Always draw dashed vertical grid lines here.
        // Column highlights are drawn by the custom painter instead.
        return FlLine(
          color: gridColor,
          strokeWidth: 1,
          dashArray: const [2, 3],
        );
      },
      /*getDrawingVerticalLine: (value) {
        return const FlLine(
          color: Colors.white24,
          strokeWidth: 1,
        );
      },*/
      horizontalInterval: _leftTitlesInterval,
      /*checkToShowHorizontalLine: (value) {
        return (value.floor()) % _leftTitlesInterval.floor() == 0;
      },*/
    );
  }

  LineChartData mainData(
      {required Color labelColor, required Color gridColor}) {
    return LineChartData(
      clipData: const FlClipData.all(),
      gridData: gridData(gridColor: gridColor),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles:
            AxisTitles(sideTitles: bottomTitles(labelColor: labelColor)),
        leftTitles: AxisTitles(sideTitles: leftTitles(labelColor: labelColor)),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineTouchData: LineTouchData(
        touchSpotThreshold: 30,
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          final strokeColor = (barData.gradient?.colors.isNotEmpty ?? false)
              ? barData.gradient!.colors.last
              : Colors.white;

          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(color: gridColor, strokeWidth: 1),
              FlDotData(
                show: true,
                getDotPainter: (spot, percent, bar, spotIndex) {
                  return FlDotCirclePainter(
                    radius: 3,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: strokeColor,
                  );
                },
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          maxContentWidth: 120,
          tooltipPadding: const EdgeInsets.all(6),
          tooltipMargin: 4,
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            if (touchedSpots.isEmpty) return const [];

            final time = DateTime.fromMillisecondsSinceEpoch(
              touchedSpots.first.x.toInt(),
            );

            double? historical;
            double? forecast;
            for (final spot in touchedSpots) {
              if (spot.barIndex == 0) {
                historical = spot.y;
              } else if (spot.barIndex == 1) {
                forecast = spot.y;
              }
            }

            final buffer = StringBuffer()
              ..write(DateFormat('dd/MM/yyyy').format(time));
            if (historical != null) {
              buffer.write('\nH: ${historical.toStringAsFixed(2)}');
            }
            if (forecast != null) {
              buffer.write('\nF: ${forecast.toStringAsFixed(2)}');
            }

            // fl_chart 1.1.1 requires tooltipItems.length == touchedSpots.length.
            return touchedSpots.map<LineTooltipItem?>((spot) {
              if (identical(spot, touchedSpots.first)) {
                return LineTooltipItem(
                  buffer.toString(),
                  const TextStyle(color: Colors.white),
                );
              }
              return null;
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      lineBarsData: [
        LineChartBarData(
          spots: _values1,
          //isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors1,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, bar, spotIndex) {
              return FlDotCirclePainter(
                radius: 1.8,
                color: Theme.of(context).colorScheme.surface,
                strokeWidth: 1.3,
                strokeColor: gradientColors1.last,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors1
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
        LineChartBarData(
          spots: _values2,
          //isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors2,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, bar, spotIndex) {
              return FlDotCirclePainter(
                radius: 1.8,
                color: Theme.of(context).colorScheme.surface,
                strokeWidth: 1.3,
                strokeColor: gradientColors2.last,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors2
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
