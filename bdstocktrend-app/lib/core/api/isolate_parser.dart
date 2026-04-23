import 'dart:isolate';

import 'package:bd_stock_trend/core/core.dart';

class IsolateParser<T> {
  final Map<String, dynamic> json;

  ResponseConverter<T> converter;

  static const String _okKey = '__isolate_parser_ok__';
  static const String _dataKey = '__isolate_parser_data__';
  static const String _errorKey = '__isolate_parser_error__';
  static const String _stackKey = '__isolate_parser_stack__';

  IsolateParser(this.json, this.converter);

  Future<T> parseInBackground() async {
    final port = ReceivePort();
    await Isolate.spawn(_parseListOfJson, port.sendPort);

    final result = await port.first;
    if (result is Map) {
      final ok = result[_okKey];
      if (ok == true) {
        return result[_dataKey] as T;
      }
      if (ok == false) {
        final error = result[_errorKey]?.toString() ?? 'Unknown parse error';
        throw FormatException(error);
      }
    }
    return result as T;
  }

  Future<void> _parseListOfJson(SendPort sendPort) async {
    try {
      final result = converter(json);
      Isolate.exit(sendPort, <String, dynamic>{
        _okKey: true,
        _dataKey: result,
      });
    } catch (e, stackTrace) {
      Isolate.exit(sendPort, <String, dynamic>{
        _okKey: false,
        _errorKey: e.toString(),
        _stackKey: stackTrace.toString(),
      });
    }
  }
}
