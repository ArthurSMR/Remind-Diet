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
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                List {
                    if dietListViewModel.diets.isEmpty {
                        EmptyDietList()
                    } else {
                        ForEach(dietListViewModel.diets, id: \.self) { diet in
                            DietCell(diet: diet)
                                .onLongPressGesture(perform: {
                                    self.showModal.toggle()
                                }).sheet(isPresented: $showModal) {
                                    CreateDiet(showModal: $showModal, dietListViewModel: dietListViewModel) // Precisa setar tela como update
                                }
                        } // ForEach
                        .onDelete(perform: onDelete)
                    } // Else
                } // List
                
                Button(action: {
                    self.showModal.toggle()
                }) {
                    CreateNewDietButton()
                }.sheet(isPresented: $showModal) {
                    CreateDiet(showModal: self.$showModal, dietListViewModel: self.dietListViewModel)
                }
            } // VStack
            .navigationBarTitle("Suas dietas")
            .listStyle(GroupedListStyle())
            .navigationBarItems(leading: EditButton())
            .environment(\.editMode, $editMode)
        }
    }
    
    func onAdd() {
        // To be implemented in the next section
    }
    
    private func onDelete(offsets: IndexSet) {
        // To be implemented in the next section
    }
}

struct EmptyDietList: View {
    var body: some View {
        HStack {
            Image("diet")
                .resizable()
                .frame(width: 32, height: 32, alignment: .center)
                .foregroundColor(.green)
            Text("Você não possui nenhuma dieta")
        }
        
    }
}


func delete(diet: Diet) {
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
