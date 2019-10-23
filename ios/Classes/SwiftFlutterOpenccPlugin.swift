import Flutter
import UIKit
import OpenCC

public class SwiftFlutterOpenccPlugin: NSObject, FlutterPlugin {
	public static func register(with registrar: FlutterPluginRegistrar) {
		let channel = FlutterMethodChannel(name: "flutter_opencc", binaryMessenger: registrar.messenger())
		let instance = SwiftFlutterOpenccPlugin()
		registrar.addMethodCallDelegate(instance, channel: channel)
	}

	lazy var bundle: Bundle? = {
		let openCCBundle = Bundle(for: ChineseConverter.self)
		guard let resourceUrl = openCCBundle.url(forResource: "OpenCCDictionary", withExtension: "bundle") else {
			return nil
		}
		return Bundle(url: resourceUrl)
	}()

	func convertOption(from: String) -> ChineseConverter.Options {
		let map: [String: ChineseConverter.Options] = [
			"s2t": [.traditionalize],
			"t2s": [.simplify],
			"s2hk": [.traditionalize, .HKStandard],
			"hk2s": [.simplify, .HKStandard],
			"s2tw": [.traditionalize, .TWStandard],
			"tw2s": [.simplify, .TWStandard],
			"s2twp": [.traditionalize, .TWStandard, .TWIdiom],
			"tw2sp": [.simplify, .TWStandard, .TWIdiom],
		]
		return map[from] ?? []
	}

	public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
		let method = call.method
		switch method {
		case "convert":
			guard let bundle = self.bundle else {
				return
			}
			guard let list = call.arguments as? [String],
				list.count >= 2 else {
				return
			}
			let text = list[0]
			let optionString = list[1]
			do {
				let option = convertOption(from: optionString)
				let converter = try ChineseConverter(bundle: bundle, option: option)
				let converted = converter.convert(text)
				result(converted)
			} catch {
				let flutterError = FlutterError(code: "0", message: error.localizedDescription, details: nil)
				result(flutterError)
			}
		default:
			let flutterError = FlutterError(code: "1", message: "Not supported", details: nil)
			result(flutterError)
		}
	}
}
