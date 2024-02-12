//
//  ProductListView.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 14/10/22.
//

import SwiftUI

extension ProductListView {
    enum Mode {
        case list
        case grid
    }
}

struct ProductListView: View {
    @StateObject private var productViewModel = ProductViewModel()
    @State private var mode: Mode = .list
    
    private let colums = [
        GridItem(.adaptive(minimum: 140, maximum: 180), spacing: 17)
    ]
    
    var body: some View {
        content
            .modifier(AppNavigationBar(titleView: {
                Text("Listado")
                    .modifier(AppTextStyle(style: .light, font: .bold(20)))
            }, rightView: {
                navbarButton
            }))
            .background(Assets.Color.marine.opacity(0.05))
            .background(Assets.Color.white)
    }
    
    @ViewBuilder
    private var content: some View {
        switch productViewModel.state {
        case .idle:
            Color.clear
                .onAppear {
                    productViewModel.loadProducts()
                }
        case .loading:
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Assets.Color.black58))
                    .scaleEffect(1.5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        case .loaded(let items):
            switch mode {
            case .list:
                List {
                    ForEach(items) { product in
                        NavigationLink {
                            ProductDetailView(product: product)
                        } label: {
                            ProductCellView(product: product)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Assets.Color.marine2)
                .scrollContentBackground(.hidden)
                .colorScheme(.light)
            case .grid:
                ScrollView(showsIndicators: true) {
                    LazyVGrid(columns: colums, spacing: 10) {
                        ForEach(items) { product in
                            NavigationLink {
                                ProductDetailView(product: product)
                            } label: {
                                ProductGridView(product: product)
                                    .clipShape(RoundedRectangle(cornerRadius: 2))
                            }
                        }
                    }
                    .listStyle(.plain)
                    .colorScheme(.light)
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 22)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scrollIndicators(.visible)
            }
        case .error(let error):
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    Image(systemName: "wifi.exclamationmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 36)
                        .foregroundColor(Assets.Color.marine)
                    Text(error.localizedDescription)
                        .multilineTextAlignment(.center)
                        .modifier(AppTextStyle(style: .dark, font: .regular(16)))
                }
                Button("Reintentar") {
                    productViewModel.loadProducts()
                }
                .buttonStyle(AppButtonStyle(style: .fill(horizontalPadding: 20)))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }
    
    @ViewBuilder
    private var navbarButton: some View {
        HStack(spacing: 0) {
            Button {
                withAnimation {
                    mode = .list
                }
            } label: {
                Image(systemName: "list.bullet")
                    .resizable()
                    .foregroundColor((mode == .list) ? Assets.Color.marine : Assets.Color.white)
            }
            .frame(width: 18, height: 18)
            .padding(12)
            .background((mode == .list) ? Assets.Color.white.ignoresSafeArea() : Assets.Color.marine.ignoresSafeArea())
            Button {
                withAnimation {
                    mode = .grid
                }
            } label: {
                Image(systemName: "circle.grid.2x2")
                    .resizable()
                    .foregroundColor((mode == .grid) ? Assets.Color.marine : Assets.Color.white)
            }
            .frame(width: 18, height: 18)
            .padding(12)
            .background((mode == .grid) ? Assets.Color.white.ignoresSafeArea() : Assets.Color.marine.ignoresSafeArea())

        }
        .padding(.trailing, 20)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductListView()
        }
    }
}
