// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "ZendeskSDK",
            targets: [
                "ZendeskSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(
            name: "ZendeskSDKConversationKit",
            url: "https://github.com/zendesk/sdk_conversation_kit_ios",
            from: "11.1.0"
        ),
        .package(
            name: "ZendeskSDKCoreUtilities",
            url: "https://github.com/zendesk/sdk_core_utilities_ios",
            from: "7.0.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskSDK",
            path: "ZendeskSDK.xcframework"
        ),
        .target(
            name: "ZendeskSDKTargets",
            dependencies: [
                .target(name: "ZendeskSDK"),
                .product(name: "ZendeskSDKConversationKit", package: "ZendeskSDKConversationKit"),
                .product(name: "ZendeskSDKCoreUtilities", package: "ZendeskSDKCoreUtilities")
            ],
            path: "Sources"
        )
    ]
)
