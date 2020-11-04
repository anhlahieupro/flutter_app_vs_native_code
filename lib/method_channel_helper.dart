import 'package:flutter/services.dart';

class MethodChannelFunctionName {
  static final add = 'add';
  static final sub = 'sub';
}

class MethodChannelHelper {
  static final channel = MethodChannel('channel');

  static Future<dynamic> handleAdd(int x, int y) async {
    try {
      final functionName = MethodChannelFunctionName.add;
      final params = {
        'x': x,
        'y': y,
      };

      int result = await channel.invokeMethod(functionName, params);
      return Future<int>.value(result);
    } on PlatformException catch (e) {
      return Future<dynamic>.value(e);
    }
  }

  static Future<dynamic> handleSub(int x, int y) async {
    try {
      final functionName = MethodChannelFunctionName.sub;
      final params = {
        'x': x,
        'y': y,
      };

      int result = await channel.invokeMethod(functionName, params);
      return Future<int>.value(result);
    } on PlatformException catch (e) {
      return Future<dynamic>.value(e);
    }
  }
}
