//
//  ViewModifierBootcamp.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 4.02.25.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    public func withDefaultButtonFormatting() -> some View {
        modifier(DefaultButtonViewModifier())
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .withDefaultButtonFormatting()

        }
    }
}

#Preview {
    ViewModifierBootcamp()
}
