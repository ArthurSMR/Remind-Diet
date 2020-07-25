//
//  CreateDiet.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 24/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

struct Meal: Hashable {
    var time: Date = Date()
}

struct CreateDiet: View {
    
    @Binding var showModal: Bool
    @State var nameText: String = "Nova dieta"
    @State var meals: [Meal] = []
    @State var initialDate: Date = Date()
    @State var finishDate: Date = Date()
    @ObservedObject var dietViewModel: DietViewModel = DietViewModel()
    
    var body: some View {
        NavigationView {
            
                Form {
                    Section {
                        TextField("Nova dieta", text: $nameText)
                    }
                    Section {
                        FormCell(rightString: "Dias da semana", detailString: "Todos os dias")
                        DatePicker("Início", selection: $initialDate, displayedComponents: .date)
                        DatePicker("Fim", selection: $finishDate, in: initialDate..., displayedComponents: .date)

                        Stepper(onIncrement: {
                            self.meals.append(Meal())
                        }, onDecrement: {
                            self.meals.removeLast()
                        }) {
                            Text("Refeições: \(self.meals.count)")
                        } // Stepper
                    }
                    Section(header: self.meals.count > 0 ? Text("SUAS REFEIÇÕES") : Text("")) {
                        ForEach(self.meals.indices, id: \.self) { index in
                            MealCell(index: index, meal: self.meals[index])
                        }
                    }
                } // Form
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Criar dieta", displayMode: .inline)
                .navigationBarItems(trailing: Button("Salvar") {
                    self.save()
                })
        } // Navigation View
    }
    
    func save() {
        dietViewModel.saveDiet(name: nameText, days: [], initialDate: initialDate, finishDate: finishDate, meals: meals)
        self.showModal.toggle()
    }
}

struct MealCell: View {
    var index: Int
    @State var meal: Meal
    
    var body: some View {
        DatePicker("Refeição \(index + 1)", selection: $meal.time, displayedComponents: .hourAndMinute)
    }
}

struct FormCell: View {
    let rightString: String
    let detailString: String
    
    var body: some View {
        HStack {
            Text(rightString)
            Spacer()
            Text(detailString)
                .foregroundColor(.gray)
        }
    }
}

struct CreateDiet_Previews: PreviewProvider {
    
    
    static var previews: some View {
        CreateDiet(showModal: .constant(true), meals: [])
    }
}
