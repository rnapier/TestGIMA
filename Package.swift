// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestGIMA",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "TestGIMA", targets: ["TestGIMA"]),],
    dependencies: [],
    targets: [
        .target(
            name: "TestGIMA", dependencies: ["GoogleInteractiveMediaAds"]),
        .binaryTarget(
            name: "GoogleInteractiveMediaAds",
            path: "Sources/GoogleInteractiveMediaAds-3.18.4/GoogleInteractiveMediaAds.xcframework"
//            path: "Sources/GoogleInteractiveMediaAds-3.18.2/GoogleInteractiveMediaAds.xcframework"
        ),
        .testTarget(
            name: "TestGIMATests",
            dependencies: ["TestGIMA"]),
    ]
)
