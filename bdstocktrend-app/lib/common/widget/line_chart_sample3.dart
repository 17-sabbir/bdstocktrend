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
  static const double _pointSpacing = 20;
  static const double _dayInMs = 24 * 60 * 60 * 1000;

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

    // Force Y-axis interval to 0.5 as requested
    const interval = 0.5;

    minY = (minY / interval).floorToDouble() * interval;
    maxY = (maxY / interval).ceilToDouble() * interval;

    if (minY == maxY) {
      maxY = minY + interval;
    }

    int decimals = 0;
    var tmp = interval;
    while (tmp < 1 && decimals < 4) {
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
      _minX = 0;
      _maxX = 1;
      _minY = 0;
      _maxY = 1;
      _leftTitlesInterval = 1;
      _leftTitlesDecimals = 0;
      _initialScrollApplied = false;
      setState(() {});
      return;
    }

    double minY = double.maxFinite;
    double maxY = double.minPositive;

    _values = widget.data.map((datum) {
      if (minY > datum.value) minY = datum.value;
      if (maxY < datum.value) maxY = datum.value;
      return FlSpot(
        datum.time.millisecondsSinceEpoch.toDouble(),
        datum.value,
      );
    }).toList();

    _minX = _values.first.x;
    _maxX = _values.last.x;
    _applyYAxisBounds(dataMinY: minY, dataMaxY: maxY);
    _initialScrollApplied = false;

    setState(() {});
  }

  void _applyInitialScroll({
    required double desiredWidth,
    required double viewportWidth,
  }) {
    if (_initialScrollApplied || !_scrollController.hasClients) return;

    final maxScroll =
        (desiredWidth - viewportWidth).clamp(0.0, double.infinity);
    if (maxScroll <= 0) {
      _initialScrollApplied = true;
      return;
    }

    final focusOffset = maxScroll / 2;
    _scrollController.jumpTo(focusOffset);
    _initialScrollApplied = true;
  }

  @override
  Widget build(BuildContext context) {
    final labelColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.65);
    final gridColor = Theme.of(context).dividerColor.withOpacity(0.35);

    return LayoutBuilder(
      builder: (context, constraints) {
        final pointsCount = _values.length;
        final desiredWidth = math.max(
          constraints.maxWidth,
          pointsCount * _pointSpacing,
        );

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _applyInitialScroll(
            desiredWidth: desiredWidth,
            viewportWidth: constraints.maxWidth,
          );
        });

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
