//
//  UIApplication+Extensions.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 13/10/22.
//

import UIKit

extension UIApplication {
    static func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
