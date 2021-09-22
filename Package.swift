// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SwiftySitesWebsite",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/swiftysites/swiftysites", .branch("release"))
    ],
    targets: [
        .executableTarget(
            name: "SwiftySitesWebsite",
            dependencies: [
                .product(name: "SwiftySites", package: "swiftysites")
            ])
    ]
)
