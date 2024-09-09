//
//  TodoListApp.swift
//  TodoList
//
//  Created by hafeez Shaik on 03/09/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listviewmodel : listViewModel = listViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listviewmodel)
        }
    }
    
}
