// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_open_chinese_convert",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "flutter-open-chinese-convert", targets: ["flutter_open_chinese_convert"])
    ],
    dependencies: [
        .package(url: "https://github.com/ddddxxx/SwiftyOpenCC", revision: "1d8105a0f7199c90af722bff62728050c858e777")
    ],
    targets: [
        .target(
            name: "flutter_open_chinese_convert",
            dependencies: [
                .product(name: "OpenCC", package: "SwiftyOpenCC")
            ],
            resources: [
                // If your plugin requires a privacy manifest, for example if it uses any required
                // reason APIs, update the PrivacyInfo.xcprivacy file to describe your plugin's
                // privacy impact, and then uncomment these lines. For more information, see
                // https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
                // .process("PrivacyInfo.xcprivacy"),

                // If you have other resources that need to be bundled with your plugin, refer to
                // the following instructions to add them:
                // https://developer.apple.com/documentation/xcode/bundling-resources-with-a-swift-package
            ]
        )
    ]
)
