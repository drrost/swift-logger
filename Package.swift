// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Logger",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Logger",
            targets: ["Logger"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Logger",
            dependencies: []),
        .testTarget(
            name: "LoggerTests",
            dependencies: ["Logger"]),
    ]
)
