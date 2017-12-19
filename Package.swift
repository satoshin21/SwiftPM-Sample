// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "RepositorySearch",
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "UtilitySample",
            dependencies: ["Utility"]),
        .target(
            name: "RepositorySearch",
            dependencies: ["Core", "Utility"]),
        .target(
            name: "Core",
            dependencies: ["SwiftyJSON"]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"],
            path: "Tests/CoreTests")
    ]
)
