//
//  ViewModifierBootcamp.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 4.02.25.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    public func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, world!")
                .font(.headline)
                .withDefaultButtonFormatting()
            
            Text("Hello, everyone!")
                .font(.subheadline)
                .withDefaultButtonFormatting(backgroundColor: .red)

        }
        .padding()
    }
}

#Preview {
    ViewModifierBootcamp()
}
