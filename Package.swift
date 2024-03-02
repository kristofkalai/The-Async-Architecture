// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "The-Async-Architecture",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "The-Async-Architecture",
            targets: ["The-Async-Architecture"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", exact: .init(1, 5, 0))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "The-Async-Architecture",
            dependencies: ["Resolver"]
        ),
        .testTarget(
            name: "The-Async-ArchitectureTests",
            dependencies: ["The-Async-Architecture"]
        ),
    ]
)
