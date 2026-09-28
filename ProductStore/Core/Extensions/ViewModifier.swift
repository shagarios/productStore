//
//  ViewModifier.swift
//  ProductStore
//
//  Created by shagar on 27/09/26.
//

import SwiftUI

struct CardStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .backgroundStyle(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.2),lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.08), radius: 5,x: 0,y: 3)
    }
    
}
extension View {
    func cardStyle() -> some View {
        modifier(CardStyle())
    }
}
