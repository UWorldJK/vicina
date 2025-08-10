// This file defines the configuration for the Swift Package Manager, including dependencies and build settings.

import PackageDescription

let package = Package(
    name: "ios-local-recommendations-app",
    platforms: [
        .iOS(.v14) // Minimum iOS version
    ],
    products: [
        .app(
            name: "ios-local-recommendations-app",
            targets: ["App"]
        )
    ],
    dependencies: [
        // Add any dependencies here, for example:
        // .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: []
        ),
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]
        )
    ]
)