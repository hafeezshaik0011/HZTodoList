//
//  ListViewModel.swift
//  TodoList
//
//  Created by hafeez Shaik on 04/09/24.
//

import Foundation

class listViewModel : ObservableObject{
    
    @Published var items : [ItemModel] = []{
        didSet{
            saveItem()
        }
    }
    
    init() {
        guard let data = UserDefaults.standard.data(forKey: "Items_List"),
              let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        self.items = savedItems
    }
    
    
    
    func deleteItem(indexset : IndexSet){
        items.remove(atOffsets: indexset)
    }
    
    func moveItems(from : IndexSet,to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func additem(text : String){
        items.append(ItemModel(title: text, isCompleted: false))
    }
    
    func updateitem(item : ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = ItemModel(id: item.id, title: item.title, isCompleted: !item.isCompleted)
        }
    }
    
    func saveItem(){//Here we are saving items i.e., array or list
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: "Items_List")
        }
    }
}
