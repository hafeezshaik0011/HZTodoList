//
//  ListView.swift
//  TodoList
//
//  Created by hafeez Shaik on 03/09/24.
//

import SwiftUI

struct ListView: View {
    @State var items = ["This is first item","This is Second item","This is Third item"]
    
    var body: some View {
        List{
            ForEach(items, id: \.self) { item in
                ListRowView(text: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing:  NavigationLink("Add", destination: AddView())
        )
    }
}




#Preview {
    NavigationView{
        ListView()
    }
}
