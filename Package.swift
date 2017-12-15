// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "RepositorySearch",
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "RepositorySearch",
            dependencies: ["Core"]),
        .target(
            name: "Core",
            dependencies: ["SwiftyJSON"]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"],
            path: "Tests/CoreTests")
    ]
)
