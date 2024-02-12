//
//  AppTextStyle.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 11/10/22.
//

import SwiftUI

struct AppTextStyle: ViewModifier {
    private let style: TextStyle
    private let font: TextFont
    
    init(style: TextStyle = .light, font: TextFont = .regular(14)) {
        self.style = style
        self.font = font
    }
    
    func body(content: Content) -> some View {
        applyFont(view: applyStyle(view: content))
    }
    
    @ViewBuilder
    private func applyStyle(view: some View) -> some View {
        switch style {
        case .light:
            view
                .foregroundColor(Assets.Color.white)
        case .dark:
            view
                .foregroundColor(Assets.Color.black58)
        case .black:
            view
                .foregroundColor(Assets.Color.black)
        case .marine:
            view
                .foregroundColor(Assets.Color.marine)
        }
    }
    
    @ViewBuilder
    private func applyFont(view: some View) -> some View {
        switch font {
        case .regular(let fontSize):
            view
                .font(Font.custom(Assets.FontName.regular, size: fontSize))
        case .bold(let fontSize):
            view
                .font(Font.custom(Assets.FontName.bold, size: fontSize))
        case .semiBold(let fontSize):
            view
                .font(Font.custom(Assets.FontName.semiBold, size: fontSize))
        }
    }
    
}

extension AppTextStyle {
    enum TextStyle {
        case light
        case dark
        case black
        case marine
    }
    
    enum TextFont {
        case bold(CGFloat)
        case semiBold(CGFloat)
        case regular(CGFloat)
    }
}

struct AppTextStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Test Regular")
                .modifier(AppTextStyle(style: .light, font: .regular(14)))
            Text("Test Bold")
                .modifier(AppTextStyle(style: .light, font: .bold(20)))
            Text("Test Semi Bold")
                .modifier(AppTextStyle(style: .light, font: .semiBold(20)))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(DarkGradientStyle())
    }
}
