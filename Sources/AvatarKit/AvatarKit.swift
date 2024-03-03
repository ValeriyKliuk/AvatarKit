// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 17.0, *)
public struct AvatarView_Library: LibraryContentProvider {
    public var views: [LibraryItem] {
        [
            LibraryItem(AvatarView(title: "Title", subTitle: "SubTitle", imageName: "AssestsImageName"), title: "AvatarView", category: .control)
        ]
    }
    
    public func modifiers(base: AvatarView) -> [LibraryItem] {
        [
            LibraryItem(base.avatarStyle(.profile), title: "Profile", category: .control)
        ]
    }
}
