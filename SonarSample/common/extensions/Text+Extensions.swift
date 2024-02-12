//
//  Text+Extensions.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 14/10/22.
//

import SwiftUI

extension Text {
    init(_ string: String, underlineText: String) {
        var attributedString = AttributedString(string)
        if let range = attributedString.range(of: underlineText) {
            attributedString[range].underlineStyle = .single
        }
        self.init(attributedString)
    }
}
