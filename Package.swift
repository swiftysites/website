// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "SwiftySitesWebsite",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/swiftysites/swiftysites", from: "2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "SwiftySitesWebsite",
            dependencies: [
                .product(name: "SwiftySites", package: "swiftysites")
            ])
    ]
)
