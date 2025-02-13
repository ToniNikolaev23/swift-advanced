//
//  AppNavBarView.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 13.02.25.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(destination:
                                Text("Destination")
                    .customNavigationTitle("Title Destination")
                    .customNavigationSubtitle("Subtitle Destination")
                    .customNavigationBarBackButtonHidden(false)
                ) {
                    Text("Navigate")
                }
            }
            .customNavBarItems(title: "New Title", subtitle: nil, backButtonHidden: false)
        }
    }
}

#Preview {
    AppNavBarView()
}

extension AppNavBarView {
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }

            }
            .navigationTitle("Nav title here")
        }
    }
}
