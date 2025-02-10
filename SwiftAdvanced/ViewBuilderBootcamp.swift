//
//  ViewBuilderBootcamp.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 10.02.25.
//

import SwiftUI

struct HeaderViewRegular: View {
    let title: String
    let descriotion: String?
    let iconName: String?
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let descriotion = descriotion {
                Text(descriotion)
                    .font(.callout)
            }
            
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


struct HeaderViewGeneric<Content:View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHstack<Content:View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "New Title", descriotion: "New desc", iconName: "heart.fill")
            
            HeaderViewRegular(title: "Another title", descriotion: nil, iconName: nil)
            
            HeaderViewGeneric(title: "TITLE GENERIC") {
                VStack {
                    Text("HI")
                    Image(systemName: "star")
                }
            }
            
            CustomHstack {
                Text("HI")
                Text("TEST")
            }
            
            Spacer()
        }
        
    }
}

#Preview {
    LocalViewBuilder(type: .one)
}


struct LocalViewBuilder: View {
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
        
        
    }
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
    }
    
    private var viewOne: some View {
        Text("ONE")
    }
    
    private var viewTwo: some View {
        VStack {
            Text("TWO")
            Image(systemName: "heart.fill")
        }
    }
    
    private var viewThree: some View {
        Image(systemName: "heart.fill")
    }
}
