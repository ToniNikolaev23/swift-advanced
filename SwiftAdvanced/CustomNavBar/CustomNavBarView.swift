//
//  CustomNavBarView.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 13.02.25.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButtom
            }
            
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButtom
                    .opacity(0)
            }
        
        }
        .padding()
        .accentColor(.white)
        .foregroundStyle(.white)
        .font(.headline)
        .background(Color.blue)
        
    }
}

#Preview {
    VStack {
        CustomNavBarView(showBackButton: true, title: "Title", subtitle: "Subtitle goes here")
        Spacer()
    }
}

extension CustomNavBarView {
    private var backButtom: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            
            if let subtitle = subtitle {
                Text(subtitle)
                    
            }
        }
    }
}
