import 'package:bd_stock_trend/common/model/time_series.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class LineChartSample3 extends StatefulWidget {
  final List<TimeSeries> data;

  const LineChartSample3({super.key, required this.data});

  @override
  State<LineChartSample3> createState() => _LineChartSample3State();
}

class _LineChartSample3State extends State<LineChartSample3> {
  List<Color> gradientColors = [
    Colors.greenAccent,
    Colors.green,
  ];

  final int _leftLabelsCount = 5;

  List<FlSpot> _values = const [];

  double _minX = 0;
  double _maxX = 0;
  double _minY = 0;
  double _maxY = 0;
  double _leftTitlesInterval = 0;
  int _leftTitlesDecimals = 0;

  double _niceInterval(double rawInterval) {
    if (rawInterval <= 0 || rawInterval.isNaN || rawInterval.isInfinite) {
      return 1;
    }

    final exponent = (math.log(rawInterval) / math.ln10).floor();
    final pow10 = math.pow(10, exponent).toDouble();
    final fraction = rawInterval / pow10;

    double niceFraction;
    if (fraction <= 1) {
      niceFraction = 1;
    } else if (fraction <= 2) {
      niceFraction = 2;
    } else if (fraction <= 5) {
      niceFraction = 5;
    } else {
      niceFraction = 10;
    }

    return niceFraction * pow10;
  }

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

    final rawInterval = (maxY - minY) / (_leftLabelsCount - 1);
    final interval = _niceInterval(rawInterval);

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
    _prepareStockData();
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

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final pointsCount = _values.length;
        final desiredWidth = math.max(constraints.maxWidth, pointsCount * 28.0);

        return SingleChildScrollView(
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
                panEnabled: false,
                scaleEnabled: true,
                minScale: 1,
                maxScale: 3,
                child: LineChart(
                  mainData(),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceIn,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SideTitles bottomTitles() {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        final DateTime date =
            DateTime.fromMillisecondsSinceEpoch(value.toInt());
        final time = DateFormat('dd/MM').format(date);

        if (value == meta.max || value == meta.min) {
          return Container();
        }

        return SideTitleWidget(
          meta: meta,
          space: 6,
          child: Text(
            time,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
        );
      },
      reservedSize: 40,
      interval: 3600000 * 24 * 15,
    );
  }

  SideTitles leftTitles() {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        if (value == meta.max || value == meta.min) {
          return Container();
        }

        return Text(
          value.toStringAsFixed(_leftTitlesDecimals),
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 14,
          ),
        );
      },
      reservedSize: 40,
      interval: _leftTitlesInterval,
    );
  }

  FlGridData gridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: Colors.white24,
          strokeWidth: 1,
        );
      },
      horizontalInterval: _leftTitlesInterval,
      /*checkToShowHorizontalLine: (value) {
        return (value.floor()) % _leftTitlesInterval.floor() == 0;
      },*/
    );
  }

  LineChartData mainData() {
    return LineChartData(
      clipData: const FlClipData.all(),
      gridData: gridData(),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(sideTitles: bottomTitles()),
        leftTitles: AxisTitles(sideTitles: leftTitles()),
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
              const FlLine(
                color: Colors.white24,
                strokeWidth: 1,
              ),
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
                '${DateFormat('dd/MM').format(time)}\nPrice: ${value.toStringAsFixed(4)}',
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
          dotData: const FlDotData(
            show: false,
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
