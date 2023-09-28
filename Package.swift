// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Injectable",
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
