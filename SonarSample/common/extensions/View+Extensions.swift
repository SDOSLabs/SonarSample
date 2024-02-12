//
//  View+Extensions.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 11/10/22.
//

import SwiftUI

extension Image {
    static var leftArrow: some View {
        Image(systemName: "arrow.left")
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25, alignment: .center)
            .padding(10)
            .foregroundColor(.white)
    }
}
extension View {
    
}
