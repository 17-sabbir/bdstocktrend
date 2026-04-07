import 'dart:async';

import 'package:bd_stock_trend/bd_stock_trend.dart';
import 'package:bd_stock_trend/dependencies_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runZonedGuarded(
    /// Lock device orientation to portrait
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Register Service locator
      await serviceLocator();
      //await FirebaseServices.init();

      return SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      ).then((_) => runApp(BDStockTrend()));
    },
    (error, stackTrace) async {
      //FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}
