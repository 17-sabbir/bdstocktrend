import 'dart:math' as math;

import 'package:bd_stock_trend/common/model/time_series.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LineChartSample3 extends StatefulWidget {
  final List<TimeSeries> data;

  const LineChartSample3({super.key, required this.data});

  @override
  State<LineChartSample3> createState() => _LineChartSample3State();
}

class _LineChartSample3State extends State<LineChartSample3> {
  static const double _pointSpacing = 15;
  static const double _dayInMs = 24 * 60 * 60 * 1000;
  static const int _rightPaddingDays = 1;
  static const double _initialRightGapPx = 20;

  // ── Fixed 6-month window ─────────────────────────────────────────────────
  // X-axis always spans [now - 6 months … now], regardless of how much data
  // is actually present. The window is computed once per build so that the
  // axis does not drift while the widget is on screen.
  static double _windowMinX() {
    final now = DateTime.now();
    final sixMonthsAgo = DateTime(now.year, now.month - 6, now.day);
    return sixMonthsAgo.millisecondsSinceEpoch.toDouble();
  }

  static double _windowMaxX() {
    // Use end-of-today plus a small padding so the chart initially shows
    // a bit of empty space to the right of the latest point.
    final now = DateTime.now();
    final endOfToday = DateTime(now.year, now.month, now.day, 23, 59, 59);
    final padded = endOfToday.add(const Duration(days: _rightPaddingDays));
    return padded.millisecondsSinceEpoch.toDouble();
  }

  List<Color> gradientColors = [
    Colors.greenAccent,
    Colors.green,
  ];

  List<FlSpot> _values = const [];

  double _minX = 0;
  double _maxX = 0;
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
    final base = math.max(math.max(safeMin.abs(), safeMax.abs()), 1.0);
    final range = (safeMax - safeMin).abs();

    final padding = range == 0
        ? base * 0.05
        : math.max(math.max(range * 0.10, base * 0.005), 0.01);

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
    _transformationController = TransformationController(Matrix4.identity());
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
  void didUpdateWidget(covariant LineChartSample3 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.data, widget.data)) {
      _prepareStockData();
    }
  }

  void _prepareStockData() {
    if (widget.data.isEmpty) {
      _values = const [];
      // Default Y range when no data is available.
      _minY = 0;
      _maxY = 1;
      _leftTitlesInterval = 1;
      _leftTitlesDecimals = 0;
      _initialScrollApplied = false;
      _initialScrollCallbackScheduled = false;
      if (mounted) setState(() {});
      return;
    }

    double minY = double.maxFinite;
    double maxY = double.minPositive;

    // ── Filter to the 6-month window ─────────────────────────────────────
    // Only include data points that fall within [_minX … _maxX].
    // This is a client-side safeguard even if the API already filters.
    _minX = _windowMinX();
    _maxX = _windowMaxX();
    _values = widget.data.where((datum) {
      final ms = datum.time.millisecondsSinceEpoch.toDouble();
      return ms >= _minX && ms <= _maxX;
    }).map((datum) {
      if (minY > datum.value) minY = datum.value;
      if (maxY < datum.value) maxY = datum.value;
      return FlSpot(
        datum.time.millisecondsSinceEpoch.toDouble(),
        datum.value,
      );
    }).toList();

    // If filtering removed everything, still keep the window but reset Y.
    if (_values.isEmpty) {
      _minY = 0;
      _maxY = 1;
      _leftTitlesInterval = 1;
      _leftTitlesDecimals = 0;
    } else {
      _applyYAxisBounds(dataMinY: minY, dataMaxY: maxY);
    }

    _initialScrollApplied = false;
    _initialScrollCallbackScheduled = false;
    if (mounted) setState(() {});
  }

  void _scheduleInitialScroll({
    required double desiredWidth,
    required double viewportWidth,
  }) {
    if (!mounted || _initialScrollApplied || _initialScrollCallbackScheduled) {
      return;
    }

    _initialScrollCallbackScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialScrollCallbackScheduled = false;
      if (!mounted) return;

      final latestX = _values.isEmpty
          ? _maxX
          : _values.map((e) => e.x).reduce((a, b) => a > b ? a : b);

      _applyInitialScroll(
        desiredWidth: desiredWidth,
        viewportWidth: viewportWidth,
        latestX: latestX,
      );
    });
  }

  void _applyInitialScroll({
    required double desiredWidth,
    required double viewportWidth,
    required double latestX,
  }) {
    if (_initialScrollApplied || !_scrollController.hasClients) return;

    final maxScroll =
        (desiredWidth - viewportWidth).clamp(0.0, double.infinity);
    if (maxScroll <= 0) {
      _initialScrollApplied = true;
      return;
    }

    // Start focused on the latest known point with a small right-side gap.
    // This avoids landing fully inside the padded future area.
    final rangeX = (_maxX - _minX).abs();
    final latestRatio = rangeX == 0 ? 1.0 : ((latestX - _minX) / rangeX);
    final latestPx = (latestRatio.clamp(0.0, 1.0)) * desiredWidth;
    final target = (latestPx - viewportWidth + _initialRightGapPx)
        .clamp(0.0, maxScroll);
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
        // Desired width covers at least the full 6-month span at _pointSpacing
        // per day, or the viewport, whichever is larger. This means the axis
        // shows the full six-month window even if there are few data points.
        final spanDays = (_maxX - _minX) / _dayInMs;
        final desiredWidth = math.max(
          constraints.maxWidth,
          spanDays * _pointSpacing,
        );

        _scheduleInitialScroll(
          desiredWidth: desiredWidth,
          viewportWidth: constraints.maxWidth,
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
                right: 18,
                left: 12,
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
                      curve: Curves.bounceIn,
                    ),
                    // Draw highlights on top of chart; ignore pointer so interactions pass through
                    Positioned.fill(
                      child: IgnorePointer(
                        child: CustomPaint(
                          painter: _VerticalPointHighlighter(
                            spots: _values,
                            minX: _minX,
                            maxX: _maxX,
                            minY: _minY,
                            maxY: _maxY,
                            step: 7,
                            leftReserved: 40,
                            bottomReserved: 48,
                            color: gridColor.withOpacity(0.95),
                            strokeWidth: 2.0,
                            dotFillColor: Theme.of(context).colorScheme.surface,
                            dotStrokeColor: gradientColors.last,
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

        // Hide labels in the padded "future" area; keep labels only up to today.
        final now = DateTime.now();
        final endOfTodayMs = DateTime(now.year, now.month, now.day, 23, 59, 59)
            .millisecondsSinceEpoch
            .toDouble();
        if (value > endOfTodayMs) return Container();

        if (value == meta.max || value == meta.min) {
          return Container();
        }
        final tick = ((value - _minX) / _dayInMs).round().abs();
        // Show label only for every 7th day; hide intermediate day labels
        if (tick % 7 != 0) return Container();

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
      reservedSize: 40,
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
        // Thick highlights for every-7th tick are handled by the custom painter.
        return FlLine(
          color: gridColor,
          strokeWidth: 1,
          dashArray: const [2, 3],
        );
      },
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
                    strokeColor: gradientColors.last,
                  );
                },
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          maxContentWidth: 160,
          tooltipPadding: const EdgeInsets.all(8),
          tooltipMargin: 8,
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              final time = DateTime.fromMillisecondsSinceEpoch(
                touchedSpot.x.toInt(),
              );
              final value = touchedSpot.y;
              return LineTooltipItem(
                '${DateFormat('dd/MM/yyyy').format(time)}\nPrice: ${value.toStringAsFixed(2)}',
                const TextStyle(color: Colors.white),
              );
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
          spots: _values,
          //isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
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
                strokeColor: gradientColors.last,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _VerticalPointHighlighter extends CustomPainter {
  final List<FlSpot> spots;
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
  final Color dotStrokeColor;
  final double dotRadius;

  _VerticalPointHighlighter({
    required this.spots,
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
    required this.dotStrokeColor,
    required this.dotRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (spots.isEmpty) return;
    if (maxX <= minX || maxY <= minY) return;

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final fillPaint = Paint()
      ..color = dotFillColor
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = dotStrokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;

    final plotWidth =
        size.width - leftReserved; // leftReserved accounts for left titles
    final plotHeight =
        size.height - bottomReserved; // leave room for bottom titles

    if (plotWidth <= 0 || plotHeight <= 0) return;

    const double dayInMs = 24 * 60 * 60 * 1000;
    final seen = <int>{};

    // iterate actual data points and highlight only when their calendar-day index matches
    for (var s in spots) {
      final dayIndex = ((s.x - minX) / dayInMs).round();
      if (dayIndex % step != 0) continue;
      if (!seen.add(dayIndex)) continue;

      final xNorm = (s.x - minX) / (maxX - minX);
      final px = leftReserved + (xNorm * plotWidth);
      final yNorm = (maxY - s.y) / (maxY - minY);
      final py = (yNorm * plotHeight).clamp(0.0, plotHeight);

      // draw vertical highlight from bottom up to slightly below the dot
      final endY = (py + dotRadius).clamp(0.0, plotHeight);
      canvas.drawLine(Offset(px, plotHeight), Offset(px, endY), linePaint);

      // redraw the dot on top so it's not covered by the highlight
      canvas.drawCircle(Offset(px, py), dotRadius, fillPaint);
      canvas.drawCircle(Offset(px, py), dotRadius, strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
