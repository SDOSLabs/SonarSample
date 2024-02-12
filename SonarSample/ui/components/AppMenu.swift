//
//  AppMenu.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 13/10/22.
//

import SwiftUI

struct AppMenu<Value: Hashable & StringProtocol>: View {
    @Binding private var value: Value
    private let items: [Value]
    init(value: Binding<Value>, items: [Value]) {
        self._value = value
        self.items = items
    }
    
    var body: some View {
        Menu {
            ForEach(items, id: \.self) { element in
                Button(element) {
                    value = element
                }
            }
        } label: {
            HStack {
                Text(value.isEmpty ? "Tipo" : value)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if let image = UIImage(named: "arrow")?.withRenderingMode(.alwaysOriginal).withTintColor(.gray) {
                    Image(uiImage: image)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .foregroundColor(value.isEmpty ? Assets.Color.black58.opacity(0.7) : Assets.Color.black90)
        .modifier(AppTextFieldStyle(.plain))
    }
}

struct AppMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppMenu(value: .constant(""), items: ["", "NIF", "NIE"])
    }
}
