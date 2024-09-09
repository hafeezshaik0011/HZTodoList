//
//  AddView.swift
//  TodoList
//
//  Created by hafeez Shaik on 03/09/24.
//

import SwiftUI

struct AddView: View {
    
    @State var textfield : String = ""
    @EnvironmentObject var listviewModel : listViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            
            VStack{
                TextField("Add items in here", text: $textfield)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.74)))
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                
                Button(action: {
                    if textfield.count < 3{
                        showAlert = true
                    }else{
                        listviewModel.additem(text: textfield)
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    Text("Add Item")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                })
                
                
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Add Item ✍🏻")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Add Item"))
        }
        
    }
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(listViewModel())
    
}
