// swift-tools-version:6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlagPhoneNumber",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FlagPhoneNumber",
            targets: ["FlagPhoneNumber", "libPhoneNumber"]),
    ],
    dependencies: [
        .package(url: "https://github.com/chronotruck/FlagPhoneNumber.git", from: "1.0.0"),
        .package(url: "https://github.com/monzo/libPhoneNumber-iOS.git", from: "1.0.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "libPhoneNumber",
            dependencies: [],
            path: "Sources/libPhoneNumber",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("Internal")
            ]
        ),
        .target(
            name: "FlagPhoneNumber",
            dependencies: ["libPhoneNumber"],
            path: "Sources",
            exclude: ["Info.plist", "libPhoneNumber"],
            resources: [.copy("Resources/countryCodes.json")],
            publicHeadersPath: "."
        ),
    ]
)
