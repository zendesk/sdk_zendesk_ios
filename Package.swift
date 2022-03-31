// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskSDK",
    platforms: [
        .iOS(.v10)
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
        .package(name: "ZendeskSDKConversationKit",
                 url: "https://github.com/zendesk/sdk_conversation_kit_ios",
                 from: "1.1.0")
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskSDK",
            path: "ZendeskSDK.xcframework"
        ),
        .target(name: "ZendeskSDKTargets",
                dependencies: [
                    .target(name: "ZendeskSDK"),
                    .product(name: "ZendeskSDKConversationKit", package: "ZendeskSDKConversationKit")
                ],
                path: "Sources")
    ]
)
