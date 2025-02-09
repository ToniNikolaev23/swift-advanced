//
//  GenericsBootcamp.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 9.02.25.
//

import SwiftUI

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello world")
    
    @Published var genericStringModel = GenericModel(info: "Hello worlddd")
    @Published var genericBoolModel = GenericModel(info: true)
    

    func removeData() {
        stringModel = stringModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericView<T: View>: View {
    let content: T
    
    let title: String
    
    var body: some View {
        Text(title)
        content
    }
}

struct GenericsBootcamp: View {
    @StateObject private var viewModel = GenericsViewModel()
    
    var body: some View {
        VStack {
//            GenerigView(title: "NEW VIEW")
            GenericView(content: Text("HHH"), title: "YES")
            Text(viewModel.genericStringModel.info ?? "no data")
            Text(viewModel.genericBoolModel.info?.description ?? "no data")
        }
        .onTapGesture {
            viewModel.removeData()
        }
    }
}

#Preview {
    GenericsBootcamp()
}
