//
//  AppTabView.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 18/10/22.
//

import SwiftUI

enum TabSelection {
    case list
    case shoppingCart
}

final class TabSelectionEnvironment: ObservableObject {
    @Published var selectionTab: TabSelection = .list
}

struct AppTabView: View {
    @StateObject private var tabSelectionEnvironment = TabSelectionEnvironment()
    @State private var selectionTab: TabSelection = .list
    
    var body: some View {
        TabView(selection: $selectionTab) {
            NavigationView {
                ProductListView()
            }
            .navigationViewStyle(.stack)
            .tabItem {
                Label("Listado", systemImage: "list.bullet")
            }
            .tag(TabSelection.list)
            
            NavigationView {
                ShoppingCartView()
            }
            .navigationViewStyle(.stack)
            .tabItem {
                Label("Carrito", systemImage: "cart")
            }
            .tag(TabSelection.shoppingCart)
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor(Assets.Color.white)
            tabBarAppearance.shadowImage = UIImage()
            tabBarAppearance.shadowColor = .gray
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        .accentColor(Assets.Color.marine)
        .onChange(of: tabSelectionEnvironment.selectionTab) { newValue in
            selectionTab = newValue
        }
        .onChange(of: selectionTab) { newValue in
            tabSelectionEnvironment.selectionTab = newValue
        }
        .environmentObject(tabSelectionEnvironment)
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppTabView()
        }
        .environmentObject(ShoppingCartLogic())
    }
}
