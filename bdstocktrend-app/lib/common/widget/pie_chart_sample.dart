
// ignore_for_file: prefer_final_locals, avoid_redundant_argument_values

import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/dashboard/dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: always_use_package_imports
import 'indicator.dart';

class PieChartSample2 extends StatefulWidget {

  final DseInfo dseInfo;

  const PieChartSample2({super.key, required this.dseInfo});

  @override
  State<StatefulWidget> createState() => _PieChart2State();
}

class _PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: Palette.greenLatte,
                text: 'Winner',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Palette.redLatte,
                text: 'Loser',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Palette.shadowDark,
                text: 'Neutral',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {

    double total = widget.dseInfo.Advance!.toDouble() + widget.dseInfo.Decline!.toDouble() + widget.dseInfo.Unchange!.toDouble();

    double unchange = (widget.dseInfo.Unchange!.toDouble() / total) * 100;
    double advance = (widget.dseInfo.Advance!.toDouble() / total) * 100;
    double decline = (widget.dseInfo.Decline!.toDouble() / total) * 100;


    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Palette.shadowDark,
            value: unchange,
            title: '${widget.dseInfo.Unchange!}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Palette.textDark,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Palette.redLatte,
            value: decline,
            title: '${widget.dseInfo.Decline!}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Palette.textDark,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Palette.greenLatte,
            value: advance,
            title: '${widget.dseInfo.Advance!}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Palette.textDark,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
// ignore: eol_at_end_of_file
}