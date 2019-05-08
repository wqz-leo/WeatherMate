// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "WMAPI",
    products: [
        .library(name: "WMAPI", targets: ["WMAPI"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .exact("4.8.2")),
    ],
    targets: [
        .target(name: "WMAPI", dependencies: [
          "Alamofire",
        ], path: "Sources")
    ]
)
