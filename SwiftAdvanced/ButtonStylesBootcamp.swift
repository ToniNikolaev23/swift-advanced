//
//  ButtonStylesBootcamp.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 5.02.25.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaleAmount: CGFloat
    
    init(scaleAmount: CGFloat) {
        self.scaleAmount = scaleAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

extension View {
    public func withPressableStyle(scaleAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaleAmount: scaleAmount))
    }
}

struct ButtonStylesBootcamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click me")
                .withDefaultButtonFormatting()
        }
        .withPressableStyle()
        .padding(40)

    }
}

#Preview {
    ButtonStylesBootcamp()
}
