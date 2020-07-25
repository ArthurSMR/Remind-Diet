//
//  ContentView.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 24/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showModal = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(0..<3) { item in
                    DietCell()
                } // List
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    .navigationBarTitle("Suas dietas")
                Button(action: {
                    self.showModal.toggle()
                }) {
                    CreateNewDietButton()
                }.sheet(isPresented: $showModal) {
                    CreateDiet(showModal: self.$showModal)
                }
            }
        }
    }
}

struct CreateNewDietButton: View {
    var body: some View {
        
        HStack() {
            Image(systemName: "plus.circle.fill")
            Text("Criar dieta")
        }.padding()
        
    }
}

struct DietCell: View {
    
    @State var isToggle: Bool = false
    
    var body: some View {
        Toggle(isOn: $isToggle) {
            VStack(alignment: .leading) {
                Text("Secar o corpo")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Seg, Ter, Qui e Sáb")
                    .foregroundColor(.gray)
                Text("16 dias para o término da dieta")
                    .foregroundColor(.green)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
