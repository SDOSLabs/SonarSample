//
//  AppNavigationBar.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 11/10/22.
//

import SwiftUI

struct AppNavigationBar<LeftView: View, TitleView: View, RightView: View> : ViewModifier {
    private let style: Style
    private let leftView: () -> LeftView
    private let titleView: () -> TitleView
    private let rightView: () -> RightView
    
    init(style: Style = .opaque, @ViewBuilder leftView: @escaping () -> LeftView = { EmptyView() },
         @ViewBuilder titleView: @escaping () -> TitleView,
         @ViewBuilder rightView: @escaping () -> RightView = { EmptyView() }) {
        self.style = style
        self.leftView = leftView
        self.titleView = titleView
        self.rightView = rightView
    }
    
    func body(content: Content) -> some View {
        switch style {
        case .hidden:
            content
                .navigationBarHidden(true)
        case .translucent, .opaque:
            VStack(spacing: 0) {
                ZStack {
                    HStack {
                        leftView()
                        Spacer()
                    }
                    .padding(.leading, 10)
                    titleView()
                    HStack {
                        Spacer()
                        rightView()
                    }
                    .padding(.trailing, 10)
                }
//                HStack {
//                    Color.clear
//                        .overlay(alignment: .center, content: {
//                            leftView
//                        })
//                        .frame(width: 60)
//                    Color.clear
//                        .overlay(alignment: .center, content: {
//                            titleView
//                        })
//                    Color.clear
//                        .overlay(alignment: .center, content: {
//                            rightView
//                        })
//                        .frame(width: 60)
//                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(backgroundColor)
                .preferredColorScheme(.dark)
                content
                Spacer(minLength: 0)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Group {
            switch style {
            case .opaque:
                Assets.Color.marine
            case .translucent, .hidden:
                Color.clear
            }
        }
        .ignoresSafeArea()
    }
}

extension AppNavigationBar {
    enum Style {
        case opaque
        case translucent
        case hidden
    }
}

struct AppNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hola mundo")
                .foregroundColor(.white)
        }
        .modifier(AppNavigationBar(style: .translucent, leftView: {
            Button {
                print("Press button")
            } label: {
                Image.leftArrow
            }

        }, titleView: {
            Text("Registro")
                .modifier(AppTextStyle(style: .light, font: .bold(20)))
        }, rightView: {
            HStack {
                Text("Prueba")
                Text("Prueba")
            }
        }))
        .modifier(DarkGradientStyle())
    }
}
