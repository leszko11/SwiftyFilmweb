// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyFilmweb",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v11),
        .watchOS(.v5),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "SwiftyFilmweb",
            targets: ["SwiftyFilmweb"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(
            name: "SwiftyFilmweb",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "SwiftyFilmwebTests",
            dependencies: ["SwiftyFilmweb"]),
    ]
)
