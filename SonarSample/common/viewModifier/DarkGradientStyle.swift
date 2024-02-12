//
//  DarkGradientStyle.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 10/10/22.
//

import SwiftUI

struct DarkGradientStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Gradient(colors: [Assets.Color.navy, Assets.Color.lightNavy])
            )
    }
}

struct DarkGradientStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Test")
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(DarkGradientStyle())
    }
}
