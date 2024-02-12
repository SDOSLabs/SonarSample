//
//  KeyboardDismissModifier.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 13/10/22.
//

import SwiftUI

struct KeyboardDismissModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        UIApplication.hideKeyboard()
                    }
                }
            }
    }
}

struct KeyboardDismissModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TextField("Prueba", text: .constant(""))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(KeyboardDismissModifier())
    }
}
