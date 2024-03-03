//
//  AvatarView.swift
//  AvatarKit
//
//  Created by Valeriy Kliuk on 2024-02-25.
//

import SwiftUI

@available(iOS 17.0, *)
public protocol AvatarStyle {
    @ViewBuilder
    func makeBody(configuration: Configuration) -> any View
    
    typealias Configuration = AvatarStyleConfiguration
}

@available(iOS 17.0, *)
extension View {
    
    public func onTapAvatarView(tapAvatarViewHandler: @escaping () -> Void) -> some View {
        environment(\.tapAvatarViewHandler, tapAvatarViewHandler)
    }
    
    public func avatarStyle(_ style: some AvatarStyle) -> some View {
        environment(\.avatarStyle, style)
    }
}

@available(iOS 17.0, *)
public struct AvatarViewTapHandler: EnvironmentKey {
    public static var defaultValue: (() -> Void)?
}

@available(iOS 17.0, *)
public struct AvatarStyleKey: EnvironmentKey {
    public static var defaultValue: any AvatarStyle = DefaultAvatarStyle()
}

@available(iOS 17.0, *)
public extension EnvironmentValues {
    public var tapAvatarViewHandler: (() -> Void)? {
        get { self[AvatarViewTapHandler.self] }
        set { self[AvatarViewTapHandler.self] = newValue }
    }
    
    public var avatarStyle: any AvatarStyle {
        get { self[AvatarStyleKey.self] }
        set { self[AvatarStyleKey.self] = newValue}
    }
}

@available(iOS 17.0, *)
public extension AvatarStyle where Self == ProfileAvatarStyle {
    static var profile: Self { .init() }
}

@available(iOS 17.0, *)
public extension AvatarStyle where Self == DefaultAvatarStyle {
    static var automatic: Self { .init() }
}

@available(iOS 17.0, *)
public struct AvatarStyleConfiguration {
    let title: Title
    let subTitle: SubTitle
    let image: Image
    
    struct SubTitle: View {
        let underlyingSubTitle: AnyView
        
        init(_ subTitle: some View) {
            self.underlyingSubTitle = AnyView(subTitle)
        }
        
        var body: some View {
            underlyingSubTitle
        }
    }
    
    struct Title: View {
        let underlyingTitle: AnyView
        
        init(_ title: some View) {
            self.underlyingTitle = AnyView(title)
        }
        
        var body: some View {
            underlyingTitle
        }
    }
    
    init(title: Title, subTitle: SubTitle, image: Image) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
    }
}

@available(iOS 17.0, *)
public struct DefaultAvatarStyle: AvatarStyle {

    public func makeBody(configuration: Configuration) -> any View {
        HStack(alignment: .top) {
            configuration.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75, height: 75, alignment: .center)
                .clipShape(.rect(cornerRadius: 5))
            VStack(alignment: .leading) {
                configuration.title
                    .font(.headline)
                configuration.subTitle
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}

@available(iOS 17.0, *)
public struct ProfileAvatarStyle: AvatarStyle {
    
    public func makeBody(configuration: Configuration) -> any View {
        VStack(alignment: .center) {
            configuration.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle(), style: FillStyle())
            configuration.title
                .font(.headline)
            configuration.subTitle
                .font(.subheadline)
        }
        .contentShape(Rectangle())
    }
}


@available(iOS 17.0, *)
public struct AvatarView: View {
    @Environment(\.tapAvatarViewHandler) var tapAvatarViewHandler
    @Environment(\.avatarStyle) var style

    var title: String
    var subTitle: String
    var imageName: String
    
    public init( title: String, subTitle: String, imageName: String) {
        self.title = title
        self.subTitle = subTitle
        self.imageName = imageName
    }
    
    public var body: some View {
        let configuration = AvatarStyleConfiguration(
            title: .init(Text(title)),
            subTitle: .init(Text(subTitle)),
            image: .init(imageName))
        
        AnyView(
            style.makeBody(configuration: configuration)
        )
        .onTapGesture {
            if let tapAvatarViewHandler {
                tapAvatarViewHandler()
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    AvatarView(title: "Title", subTitle: "SubTitle", imageName: "AssestsImageName")
        .avatarStyle(.profile)
}
