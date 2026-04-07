import 'package:bd_stock_trend/common/widget/line_chart_sample2.dart';
import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/dashboard/domain/entities/dashboard.dart';
import 'package:bd_stock_trend/features/dashboard/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DhakaStockExchangePage extends StatefulWidget {
  const DhakaStockExchangePage({super.key});

  @override
  State<DhakaStockExchangePage> createState() => _DhakaStockExchangePageState();
}

class _DhakaStockExchangePageState extends State<DhakaStockExchangePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text("Dhaka Stock Exchange"),
          centerTitle: true,
        ),
      ),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (_, state) {
          return state.maybeWhen(
            success: (data) => _buildBody(data),
            orElse: () => _buildBody(Dashboard(
              dseX: [],
              dseS: [],
              ds30: [],
              dseInfo: const DseInfo(
                  TotalTrade: 0,
                  TotalVolume: 0,
                  TotalValue: 0.0,
                  Advance: 0,
                  Decline: 0,
                  Unchange: 0),
              lastUpdateTime: "Static Data (API Error)",
              topCompaniesByCategory: Stock(
                value: [],
                gainar: [],
                loser: _staticScripList(),
                volume: _staticScripList(),
                trade: _staticScripList(),
              ),
            )),
          );
        },
      ),
    );
  }

  Widget _buildBody(Dashboard data) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(Dimens.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSummaryCard(data),
          const SpacerV(value: 24),
          Text(
            "Market Indices",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SpacerV(value: 12),
          Container(
            height: 350.h,
            padding: EdgeInsets.all(Dimens.space12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimens.radiusLarge),
              boxShadow: [
                BoxShadow(
                  color: Palette.primary.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                TabBar(
                  labelColor: Palette.primary,
                  indicatorColor: Palette.primary,
                  controller: _tabController,
                  tabs: const [
                    Tab(text: "DSEX"),
                    Tab(text: "DSES"),
                    Tab(text: "DS30"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      LineChartSample2(data: data.dseX),
                      LineChartSample2(data: data.dseS),
                      LineChartSample2(data: data.ds30),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SpacerV(value: 24),
          Text(
            "Market Statistics",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SpacerV(value: 12),
          _buildStatGrid(data),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(Dashboard data) {
    return Container(
      padding: EdgeInsets.all(Dimens.space24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Palette.primary, Palette.primary.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(Dimens.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: Palette.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Market Status",
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
          ),
          const SpacerV(value: 8),
          const Text(
            "OPEN", // Assuming open, ideally should come from API
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SpacerV(value: 4),
          Text(
            "Last Update: ${data.lastUpdateTime}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatGrid(Dashboard data) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: Dimens.space16,
      mainAxisSpacing: Dimens.space16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard("Total Trade", "${data.dseInfo.TotalTrade}",
            Icons.compare_arrows_rounded, Colors.blue),
        _buildStatCard("Total Volume", "${data.dseInfo.TotalVolume}",
            Icons.bar_chart_rounded, Colors.orange),
        _buildStatCard("Total Value", "${data.dseInfo.TotalValue}",
            Icons.attach_money_rounded, Colors.green),
        _buildStatCard("Issues Advancing", "${data.dseInfo.Advance}",
            Icons.trending_up_rounded, Palette.success),
        _buildStatCard("Issues Declining", "${data.dseInfo.Decline}",
            Icons.trending_down_rounded, Palette.error),
        _buildStatCard("Issues Unchanged", "${data.dseInfo.Unchange}",
            Icons.remove_circle_outline_rounded, Colors.grey),
      ],
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(Dimens.space16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Dimens.radiusLarge),
        border: Border.all(color: color.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SpacerV(value: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  List<ScripInfo> _staticScripList() {
    return List.generate(
      10,
      (index) => ScripInfo(
        Scrip: "Company $index",
        LTP: 100.0 + index,
        Change: 1.5,
        ChangePer: 1.2,
        Value: 5000000.0,
        Volume: 1000,
        Trade: 500,
        Quotes: [],
      ),
    );
  }
}
