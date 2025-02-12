//
//  CustomTabBarContainerView.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 12.02.25.
//

import SwiftUI


struct CustomTabBarContainerView<Content: View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

//tabs: [
//    TabBarItem(
//    iconName: "house",
//    title: "Home",
//    color: Color.red),
//    TabBarItem(
//    iconName: "heart",
//    title: "Favorites",
//    color: Color.blue),
//    TabBarItem(
//    iconName: "person",
//    title: "Profile",
//    color: Color.green),
//],

#Preview {
    CustomTabBarContainerView(selection: .constant(.home)) {
            Color.red
    }
}
