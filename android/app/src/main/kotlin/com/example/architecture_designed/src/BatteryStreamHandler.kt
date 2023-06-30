package com.example.architecture_designed.src

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink


class BatteryStreamHandler(private var context: Context) : EventChannel.StreamHandler {
    private var batteryStatusReceiver: BroadcastReceiver? = null
    private var eventSink: EventSink? = null


    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        batteryStatusReceiver = createBatteryStatusReceiver()
        val filter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        context.registerReceiver(batteryStatusReceiver, filter)
    }

    override fun onCancel(arguments: Any?) {
        context.unregisterReceiver(batteryStatusReceiver);
        batteryStatusReceiver = null;
        eventSink = null;
    }

    private fun createBatteryStatusReceiver(): BroadcastReceiver {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
                val scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
                val batteryLevel = level * 100 / scale.toFloat()
                val batteryIntent: Intent? =
                    IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { ifilter ->
                        context.registerReceiver(null, ifilter)
                    }
                val batteryStatus: Int =
                    batteryIntent?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1
                if (eventSink != null) {
                    eventSink!!.success(
                        mapOf(
                            "level" to batteryLevel,
                            "status" to batteryStatus - 1
                        )
                    )
                }
            }
        }
    }
}