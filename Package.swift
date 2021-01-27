// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppleGlossaryTranslate",
    products: [
        .library(name: "AppleGlossaryTranslate", targets: ["AppleGlossaryTranslate"]),
    ],
    dependencies: [
        .package(url: "https://github.com/cpageler93/AppleGlossary.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "AppleGlossaryTranslate",
            dependencies: [
                .product(name: "AppleGlossary", package: "AppleGlossary")
            ]
        ),
        .testTarget(
            name: "AppleGlossaryTranslateTests",
            dependencies: ["AppleGlossaryTranslate"]),
    ]
)
