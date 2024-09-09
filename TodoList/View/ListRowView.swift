//
//  ListRowView.swift
//  TodoList
//
//  Created by hafeez Shaik on 03/09/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
        }
        .font(.title2)
        .padding(.vertical,8)
        
    }
    
}


#Preview {
    NavigationView{
        Group{
            ListRowView(item: ItemModel(title: "This is first item", isCompleted: true))
        }
        .previewLayout(.sizeThatFits)
    }
}
