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
    @ObservedObject var dietListViewModel: DietListViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(dietListViewModel.diets, id: \.self) { diet in
                        DietCell(diet: diet)
                    }
                } // List
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                .navigationBarTitle("Suas dietas")
                Button(action: {
                    self.showModal.toggle()
                }) {
                    CreateNewDietButton()
                }.sheet(isPresented: $showModal) {
                    CreateDiet(showModal: self.$showModal, dietListViewModel: self.dietListViewModel)
                }
            } // VStack
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
    var diet: Diet
    
    var body: some View {
        Toggle(isOn: $isToggle) {
            VStack(alignment: .leading) {
                Text(diet.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Text(diet.frequency.rawValue)
                    .foregroundColor(.gray)
                Text("\(diet.daysBetween()) dias para o término da dieta")
                    .foregroundColor(.green)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dietListViewModel: DietListViewModel())
    }
}
