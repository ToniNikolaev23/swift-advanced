//
//  CustomNavLink.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 13.02.25.
//

import SwiftUI

struct CustomNavLink<Label:View, Destination: View>: View {
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(
            destination:
                CustomNavBarContainerView(content: {
                    destination
                })
                .navigationBarHidden(true)
        ) {
                label
            }

    }
}

#Preview {
    CustomNavView {
        CustomNavLink(destination: Text("Destination")) {
            Text("CLICK ME")
        }
    }
   
}
