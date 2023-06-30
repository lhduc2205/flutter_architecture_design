import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        initMethodChannel()
        initEventChannel()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func initMethodChannel() {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: MethodChannelName.battery, binaryMessenger: controller.binaryMessenger)
        
        methodChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            switch call.method {
            case "getBatteryLevel":
                getBattery(result: result)
            default: result(FlutterMethodNotImplemented)
            }
            
        })
    }
    
    func initEventChannel() {
        let eventChannel = EventChannelName.battery
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        FlutterEventChannel(name: eventChannel, binaryMessenger: controller.binaryMessenger).setStreamHandler(BatteryStreamHandler())
    }
}

func getBattery(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    
    if (device.batteryState == .unknown) {
        return result(FlutterError(code: "UNVAILABLE",
                                   message: "Battery level not available.",
                                   details: nil))
    }
    var batteryResult: [String: Any] = [
        "level": device.batteryLevel * 100,
        "status": device.batteryState.rawValue
    ]
    
    return result(batteryResult)
}
