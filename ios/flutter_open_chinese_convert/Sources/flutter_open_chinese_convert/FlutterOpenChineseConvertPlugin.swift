import Flutter
import OpenCC
import UIKit

public class FlutterOpenChineseConvertPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "flutter_open_chinese_convert", binaryMessenger: registrar.messenger())
        let instance = FlutterOpenChineseConvertPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    func convertOptions(from: String) -> ChineseConverter.Options {
        return switch from {
        case "s2t": [.traditionalize]
        case "t2s": [.simplify]
        case "s2hk": [.traditionalize, .hkStandard]
        case "hk2s": [.simplify, .hkStandard]
        case "s2tw": [.traditionalize, .twStandard]
        case "tw2s": [.simplify, .twStandard]
        case "s2twp": [.traditionalize, .twStandard, .twIdiom]
        case "tw2sp": [.simplify, .twStandard, .twIdiom]
        default: []
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        switch method {
        case "convert":
            // Previously this looked up a bundle named "OpenCCDictionary" via
            // `Bundle(for: ChineseConverter.self)` before calling `convert`. That
            // matched CocoaPods' resource_bundle naming, but under Swift Package
            // Manager the equivalent resource is a differently-named, differently
            // located bundle (e.g. "SwiftyOpenCC_OpenCC.bundle"), so the lookup
            // always failed there with a NO_BUNDLE error. It's also unnecessary:
            // `ChineseConverter(options:)` resolves its own dictionaries via
            // `Bundle.module` internally, so no bundle needs to be passed in here.
            guard let list = call.arguments as? [Any],
                list.count >= 3,
                let text = list[0] as? String,
                let optionString = list[1] as? String,
                let inBackground = list[2] as? Bool
            else {
                let flutterError = FlutterError(
                    code: "MISSING_PARAMETER", message: "Required parameters are missing",
                    details: nil)
                result(flutterError)
                return
            }
            if inBackground {
                convertInBackground(text: text, optionString: optionString, result: result)
            } else {
                convert(text: text, optionString: optionString, result: result)
            }
        default:
            let flutterError = FlutterError(code: "1", message: "Not supported", details: nil)
            result(flutterError)
        }
    }

    func convert(
        text: String, optionString: String, result: @escaping FlutterResult
    ) {
        do {
            let options = convertOptions(from: optionString)
            let converter = try ChineseConverter(options: options)
            let converted = converter.convert(text)
            result(converted)
        } catch {
            let flutterError = FlutterError(
                code: "0", message: error.localizedDescription, details: nil)
            result(flutterError)
        }
    }

    func convertInBackground(
        text: String, optionString: String, result: @escaping FlutterResult
    ) {
        DispatchQueue.global().async {
            do {
                let options = self.convertOptions(from: optionString)
                let converter = try ChineseConverter(options: options)
                let converted = converter.convert(text)
                DispatchQueue.main.async {
                    result(converted)
                }
            } catch {
                let flutterError = FlutterError(
                    code: "0", message: error.localizedDescription, details: nil)
                DispatchQueue.main.async {
                    result(flutterError)
                }
            }
        }
    }

}
