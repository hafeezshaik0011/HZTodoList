//
//  NoItemavailable.swift
//  TodoList
//
//  Created by hafeez Shaik on 04/09/24.
//

import SwiftUI

struct NoItemavailable: View {
    @State var animate : Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 25){
                Text("There are no items !")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("If you are a productive person.Add some too list and implemeted it with success.")

                
                NavigationLink(destination: AddView()) {
                    Text("Add items")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.blue : Color.red)
                        .cornerRadius(10)
                    
                }
                .padding(.horizontal,animate ? 30 : 50)
                
                .shadow(
                    color: animate ? Color.blue : Color.red,
                    radius: animate ? 30 : 10,
                    x: 0,
                    y:animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y : animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
    }
    
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.25) {
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever())
            {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemavailable()
}
