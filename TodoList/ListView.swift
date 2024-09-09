//
//  ListView.swift
//  TodoList
//
//  Created by hafeez Shaik on 03/09/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : listViewModel
    
    var body: some View {
        
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemavailable()
            }else{
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                listViewModel.updateitem(item: item)
                            }
                    }
                    .onDelete(perform: { indexSet in
                        listViewModel.deleteItem(indexset: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        listViewModel.moveItems(from: indices, to: newOffset)
                    })
                }
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
    }.environmentObject(listViewModel())
}
