import 'package:flutter/services.dart';


class BatteryService {

  static const MethodChannel
      _channel = MethodChannel(
    'battery_channel',
  );


  static Future<int>
      getBatteryLevel() async {

    final result =
        await _channel
            .invokeMethod<int>(
      'getBatteryLevel',
    );

    return result ?? 0;
  }
}