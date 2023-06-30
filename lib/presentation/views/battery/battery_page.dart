import 'dart:async';

import 'package:architecture_designed/core/constants/channel.dart';
import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/l10n/l10n.dart';
import 'package:architecture_designed/presentation/views/battery/view_model/battery_result.dart';
import 'package:architecture_designed/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({Key? key}) : super(key: key);

  factory BatteryPage.routeBuilder(_, __) {
    return const BatteryPage(
      key: Key('battery_page'),
    );
  }

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  final platform = const MethodChannel(MethodChannelName.methodChannel);
  final eventChannel = const EventChannel(EventChannelName.battery);
  final double batteryHeight = 300;
  final double batteryWidth = 150;

  BatteryResult batteryResult = const BatteryResult();
  String message = 'Unknown battery level.';

  late StreamSubscription subscription;

  @override
  void initState() {
    // _getBatteryLevel();
    subscription = eventChannel.receiveBroadcastStream().listen(_onBatteryListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.batteryStatus),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${batteryResult.level.toInt()}%',
              style: AppStyles.headlineH6,
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: batteryWidth / 2,
                height: 17,
                decoration: BoxDecoration(
                  color: context.colorScheme.secondaryContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: batteryWidth,
                height: batteryHeight,
                color: context.colorScheme.secondaryContainer,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (batteryResult.level > -1)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: (batteryHeight * (batteryResult.level / 100)).toDouble(),
                            decoration: BoxDecoration(
                              color: getBatteryColor(),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    if (batteryResult.status == BatteryStatus.charging)
                      const FaIcon(
                        FontAwesomeIcons.bolt,
                        size: 80,
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${context.l10n.status}: ${batteryResult.status.name}',
              style: AppStyles.bodyXL,
            ),
          ],
        ),
      ),
    );
  }

  Color getBatteryColor() {
    if (batteryResult.status == BatteryStatus.charging) {
      return Colors.green;
    }
    if (batteryResult.isBatteryLow) {
      return Colors.redAccent;
    }
    return context.colorScheme.onBackground.withOpacity(0.9);
  }

  void _onBatteryListener(dynamic batteryResponse) {
    batteryResult = BatteryResult.fromJson(batteryResponse);
    message = 'Battery level at ${batteryResult.level}%.';
    sl<Logger>().i(batteryResult, 'Battery event change');
    setState(() {});
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
