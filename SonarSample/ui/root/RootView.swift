//
//  RootView.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 10/10/22.
//

import SwiftUI

struct RootView: View {
    @StateObject var shoppingCartLogic = ShoppingCartLogic()
    var body: some View {
        AppTabView()
            .environmentObject(shoppingCartLogic)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
