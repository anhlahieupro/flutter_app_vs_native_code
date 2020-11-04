import UIKit
import Flutter

enum MethodChannel: String {
    case add = "add"
    case sub = "sub"
    
    static func handleAdd(call: FlutterMethodCall, result: FlutterResult) {
        guard let args = call.arguments as? Dictionary<String, Any> else {
            result(FlutterError(code: "error", message: "Error", details: nil))
            return
        }
        
        let x = args["x"] as? Int ?? 0
        let y = args["y"] as? Int ?? 0
        result(Int(x + y))
    }
    
    static func handleSub(call: FlutterMethodCall, result: FlutterResult) {
        guard let args = call.arguments as? Dictionary<String, Any> else {
            result(FlutterError(code: "error", message: "Error", details: nil))
            return
        }
        
        let x = args["x"] as? Int ?? 0
        let y = args["y"] as? Int ?? 0
        result(Int(x - y))
    }
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        handleChannel()
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func handleChannel() {
        let controller = window?.rootViewController as! FlutterBinaryMessenger
        let channel = FlutterMethodChannel(name: "channel", binaryMessenger: controller)
        channel.setMethodCallHandler({ (call: FlutterMethodCall, result: FlutterResult) -> Void in
            
            switch call.method {
            case MethodChannel.add.rawValue:
                MethodChannel.handleAdd(call: call, result: result)
                
            case MethodChannel.sub.rawValue:
                MethodChannel.handleSub(call: call, result: result)
                
            default:
                break
            }
        })
    }
}
