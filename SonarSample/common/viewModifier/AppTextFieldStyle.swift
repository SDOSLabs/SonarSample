//
//  AppTextFieldStyle.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 10/10/22.
//

import SwiftUI

struct AppTextFieldStyle: ViewModifier {
    private let style: Style
    
    init(_ style: Style = .translucent) {
        self.style = style
    }
    
    func body(content: Content) -> some View {
        switch style {
        case .translucent:
            content
                .padding(15)
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .background(Assets.Color.white.opacity(0.4))
                .foregroundColor(Assets.Color.white)
        case .plain:
            content
                .padding(15)
                .frame(height: 56)
                .background(Assets.Color.white)
                .frame(maxWidth: .infinity)
                .foregroundColor(Assets.Color.black90)
        }
        
    }
}

extension AppTextFieldStyle {
    enum Style {
        case plain
        case translucent
    }
}

struct AppTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TextField("Email", text: .constant("Algo"))
                .modifier(AppTextFieldStyle())
        }
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: [Assets.Color.navy, Assets.Color.lightNavy]))
    }
}
