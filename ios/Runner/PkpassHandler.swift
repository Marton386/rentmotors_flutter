//
//  PkpassHandler.swift
//  Runner
//
//  Created by Nikita Marton on 07.06.2023.
//

import Foundation
import Flutter
import UIKit
import PassKit

public class SwiftHelloPlugin: NSObject, FlutterPlugin {

    var rootViewController: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "pkpass_util", binaryMessenger: registrar.messenger())
        let instance = SwiftHelloPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getAppVersion" {
            let version = getiOSVersion()
            result(version)
        } else if call.method == "downloadAndOpenPkpass" {
            if let args = call.arguments as? [String: Any],
                let urlString = args["url"] as? String,
                let url = URL(string: urlString),
                let headers = args["headers"] as? [String: String] {
                
                var request = URLRequest(url: url)
                for (key, value) in headers {
                    request.setValue(value, forHTTPHeaderField: key)
                }

                let session = URLSession.shared
                let task = session.dataTask(with: request) { (data, response, error) in
                    if let data = data, let passData = try? PKPass(data: data), let viewController = self.rootViewController {
                        let passLibrary = PKPassLibrary()
                        if passLibrary.containsPass(passData) {
                            return
                        }
                        if let passViewController = PKAddPassesViewController(pass: passData) {
                            viewController.present(passViewController, animated: true)
                        } else {
                            result(FlutterError(code: "pass_view_controller_error", message: "Could not instantiate PKAddPassesViewController.", details: nil))
                        }
                    } else {
                        result(FlutterError(code: "download_error", message: "Failed to download or open the pkpass file.", details: nil))
                    }
                }
                task.resume()
            } else {
                result(FlutterError(code: "invalid_argument", message: "URL is required", details: nil))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}

public extension SwiftHelloPlugin {
    func getiOSVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0"
    }
}
