// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MyLibrary1",
            targets: ["MyLibrary1"]),
        .library(
            name: "MyLibrary2",
            targets: ["MyLibrary2"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MyLibrary",
            dependencies: [],
            path: "MyLibrary/Sources",
            exclude: ["MyLibrary1", "MyLibrary2"]),
        .target(
            name: "MyLibrary1",
            dependencies: [ .target(name: "MyLibrary")],
            path: "MyLibrary1/Sources",
            exclude: ["MyLibrary", "MyLibrary2"]),

        .target(
            name: "MyLibrary2",
            dependencies: [],
            path: "MyLibrary2/Sources",
            exclude: ["MyLibrary1", "MyLibrary"]),
    ]
)
