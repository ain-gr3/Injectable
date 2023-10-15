// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Injectable",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "Injectable",
            targets: ["Injectable"]),
    ],
    targets: [
        .target(
            name: "Injectable"),
        .testTarget(
            name: "InjectableTests",
            dependencies: ["Injectable"]),
    ]
)
