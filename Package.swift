// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShikimoriSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ShikimoriSDK",
            targets: ["ShikimoriSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", from: "3.0.0"),
        .package(url: "https://github.com/Swinject/SwinjectAutoregistration.git", from: "2.8.1"),
    ],
    targets: [
        .target(
            name: "ShikimoriSDK",
            dependencies: ["Moya", "KeychainAccess", "SwinjectAutoregistration"])
    ]
)
