//
//  AppButtonStyle.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 10/10/22.
//

import SwiftUI

struct AppButtonStyle: ButtonStyle {
    private let style: Style
    
    init(style: Style = .fill(horizontalPadding: 34)) {
        self.style = style
    }
    
    func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .fill(let horizontalPadding):
            configuration.label
                .foregroundColor(configuration.isPressed ? Assets.Color.white : Assets.Color.marine)
                .padding(.vertical, 16)
                .padding(.horizontal, CGFloat(horizontalPadding))
                .background(
                    configuration.isPressed ? Assets.Color.marine : Assets.Color.white
                )
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Assets.Color.marine, lineWidth: 2)
                )
                .font(Font.custom(Assets.FontName.semiBold, size: 16))
        case .underline:
            configuration.label
                .foregroundColor(configuration.isPressed ? Assets.Color.white.opacity(0.7) : Assets.Color.white)
                .padding(.vertical, 16)
                .clipShape(Capsule())
                .font(Font.custom(Assets.FontName.regular, size: 14))
                .underline()
        case .light:
            configuration.label
                .foregroundColor(configuration.isPressed ? Assets.Color.white.opacity(0.7) : Assets.Color.white)
                .font(Font.custom(Assets.FontName.regular, size: 14))
        case .plain(let horizontalPadding):
            configuration.label
                .foregroundColor(configuration.isPressed ? Assets.Color.marine.opacity(0.7) : Assets.Color.marine)
                .font(Font.custom(Assets.FontName.bold, size: 16))
                .padding(.horizontal, CGFloat(horizontalPadding))
        }
    }
}

extension AppButtonStyle {
    enum Style {
        case fill(horizontalPadding: Float)
        case underline
        case light
        case plain(horizontalPadding: Float)
    }
}

struct AppButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            Button {
                
            } label: {
                Text("Continuar")
            }
            .buttonStyle(AppButtonStyle())
            Button {
                
            } label: {
                Text("Underline")
            }
            .buttonStyle(AppButtonStyle(style: .underline))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(DarkGradientStyle())
        
    }
}
