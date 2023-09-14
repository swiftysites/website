// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SwiftySitesWebsite",
    platforms: [.macOS(.v14)],
    dependencies: [
        //.package(url: "https://github.com/swiftysites/swiftysites", branch: "release")
        .package(path: "../swiftysites")
    ],
    targets: [
        .executableTarget(
            name: "SwiftySitesWebsite",
            dependencies: [
                .product(name: "SwiftySites", package: "swiftysites")
            ])
    ]
)
