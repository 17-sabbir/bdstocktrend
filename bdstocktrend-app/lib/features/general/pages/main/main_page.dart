import 'package:flutter/material.dart';
import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MainCubit>().initMenu(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (GoRouter.of(context).canPop()) {
          context.pop();
          return false;
        }

        return context.read<MainCubit>().onBackPressed(context, _scaffoldKey);
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _appBar(),
        drawer: MenuDrawer(
          dataMenu: context.read<MainCubit>().dataMenus,
          currentIndex: (int index) {
            if (index != 3) {
              context.read<MainCubit>().updateIndex(index);
            }
            _scaffoldKey.currentState?.openEndDrawer();
          },
          onLogoutPressed: _handleLogout,
        ),
        body: widget.child,
        bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            final currentIndex = context.read<MainCubit>().currentIndex;

            return NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: (index) {
                context.read<MainCubit>().updateIndex(index);
                switch (index) {
                  case 0:
                    context.goNamed(Routes.dashboard.name);
                    break;
                  case 1:
                    context.goNamed(Routes.companies.name);
                    break;
                  case 2:
                    context.goNamed(Routes.settings.name);
                    break;
                }
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                NavigationDestination(
                  icon: Icon(Icons.business_outlined),
                  selectedIcon: Icon(Icons.business),
                  label: 'Companies',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    final canPop = GoRouter.of(context).canPop();

    return AppBar(
      centerTitle: true,
      title: BlocBuilder<MainCubit, MainState>(
        builder: (_, state) {
          return Text(
            state.maybeWhen(
              success: (data) => data?.title ?? "-",
              orElse: () => "-",
            ),
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          );
        },
      ),
      leading: IconButton(
        icon: Icon(canPop ? Icons.arrow_back : Icons.menu),
        onPressed: () {
          if (canPop) {
            context.pop();
          } else {
            _scaffoldKey.currentState?.openDrawer();
          }
        },
      ),
    );
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          Strings.of(context)!.logout,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: Text(
          Strings.of(context)!.logoutDesc,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              Strings.of(context)!.cancel,
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
            },
            child: Text(
              Strings.of(context)!.yes,
              style: TextStyle(color: Palette.error),
            ),
          ),
        ],
      ),
    );
  }
}
