//
//  BatteryStreamHandler.swift
//  Runner
//
//  Created by Lê Huỳnh Đức on 27/06/2023.
//

import Foundation

class BatteryStreamHandler: NSObject, FlutterStreamHandler {
    private var eventSink: FlutterEventSink?
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        UIDevice.current.isBatteryMonitoringEnabled = true
        sendBatteryEvent()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onBatteryStateDidChange),
            name: UIDevice.batteryStateDidChangeNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onBatteryLevelDidChange),
            name: UIDevice.batteryLevelDidChangeNotification,
            object: nil)
        return nil
    }
    
    @objc private func onBatteryStateDidChange(notification: NSNotification) {
        sendBatteryEvent()
    }
    
    @objc private func onBatteryLevelDidChange(notification: NSNotification) {
        sendBatteryEvent()
    }
    
    func sendBatteryEvent() {
        guard let eventSink = eventSink else {
            return
        }
        
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        
        if (device.batteryState == .unknown) {
            return eventSink(FlutterError(code: "UNVAILABLE",
                                          message: "Battery level not available.",
                                          details: nil))
        }
        var batteryResult: [String: Any] = [
            "level": device.batteryLevel * 100,
            "status": device.batteryState.rawValue
        ]
        return eventSink(batteryResult)
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        NotificationCenter.default.removeObserver(self)
            eventSink = nil
            return nil
    }
}
