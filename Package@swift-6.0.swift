// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let sitemap: Self = "Sitemap"
}

extension Target.Dependency {
    static var sitemap: Self { .target(name: .sitemap) }
}

let package = Package(
    name: "swift-sitemap",
    products: [
        .library(name: .sitemap, targets: [.sitemap]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: .sitemap,
            dependencies: []
        ),
        .testTarget(
            name: .sitemap.tests,
            dependencies: [.sitemap]
        )
    ],
    swiftLanguageModes: [.v6]
)

extension String { var tests: Self { self + " Tests" } }
