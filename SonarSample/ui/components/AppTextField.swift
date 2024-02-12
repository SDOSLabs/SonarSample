//
//  AppTextField.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 10/10/22.
//

import SwiftUI

struct AppTextField: View {
    private let placeholder: String
    @Binding private var text: String
    private let onSubmit: () -> Void
    private let style: AppTextFieldStyle.Style
    private let isSecure: Bool
    
    init(_ placeholder: String, text: Binding<String>, isSecure: Bool = false, style: AppTextFieldStyle.Style = .translucent, onSubmit: @escaping (() -> Void) = { } ) {
        self.placeholder = placeholder
        self._text = text
        self.isSecure = isSecure
        self.onSubmit = onSubmit
        self.style = style
    }
    
    var body: some View {
        Group {
            if isSecure {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
            .overlay(content: {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(placeholderColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .allowsHitTesting(false)
                } else {
                    EmptyView()
                }
            })
            .onSubmit(onSubmit)
        .frame(maxWidth: .infinity, alignment: .leading)
        .modifier(AppTextFieldStyle(style))
    }
    
    private var placeholderColor: Color {
        switch style {
        case .plain:
            return Assets.Color.black58.opacity(0.7)
        case .translucent:
            return Assets.Color.white.opacity(0.7)
        }
    }
}

struct AppTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AppTextField("Email", text: .constant(""))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(DarkGradientStyle())
    }
}
