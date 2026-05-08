import 'package:flutter/material.dart';

import '../../../../core/native/battery_service.dart';


class BatteryPage
    extends StatefulWidget {

  const BatteryPage({
    super.key,
  });

  @override
  State<BatteryPage>
      createState() =>
          _BatteryPageState();
}


class _BatteryPageState
    extends State<BatteryPage> {

  String batteryText =
      'Press button';


  Future<void>
      checkBattery() async {

    try {

      final level =
          await BatteryService
              .getBatteryLevel();


      setState(() {

        batteryText =
            'Battery: $level%';
      });

    } catch (e) {

      setState(() {

        batteryText =
            'Error: $e';
      });
    }
  }


  @override
  Widget build(
    BuildContext context,
  ) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'Battery Test',
        ),
      ),


      body: Center(

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Text(
              batteryText,
            ),


            const SizedBox(
              height: 24,
            ),


            ElevatedButton(

              onPressed:
                  checkBattery,

              child: const Text(
                'Check Battery',
              ),
            ),
          ],
        ),
      ),
    );
  }
}