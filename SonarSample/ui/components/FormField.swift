//
//  FormField.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 11/10/22.
//

import SwiftUI

struct FormField<Content> : View where Content : View {
    private let title: String
    private let content: () -> Content
    
    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(title.uppercased())
                .modifier(AppTextStyle(style: .dark, font: .semiBold(10)))
            content()
                .background(
                    Assets.Color.white.shadow(color: Assets.Color.black.opacity(0.19), radius: 2, x: 0, y: 3)
                )
        }
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FormField(title: "NOMBRE") {
                AppTextField("Escriba aquí", text: .constant("dadddddede"), style: .plain)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Assets.Color.marine2)
    }
}
