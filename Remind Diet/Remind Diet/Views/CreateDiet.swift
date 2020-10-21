//
//  CreateDiet.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 24/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

struct CreateDiet: View {
    
    @Binding var showModal: Bool
    @State var name: String = "Nova dieta"
    @State var meals: [Meal] = []
    @State var initialDate: Date = Date()
    @State var finishDate: Date = Date()
    @State private var weekDayIndex = 0
    
    var dietListViewModel: DietListViewModel
    
    var body: some View {
        NavigationView {
            
                Form {
                    Section {
                        TextField("", text: $name)
                    }
                    Section {
                        HStack {
                            Picker(selection: $weekDayIndex, label: Text("Dias da semana")) {
                                ForEach(0 ..< DaysOfTheWeek.allCases.count, id: \.self) {
                                    Text(DaysOfTheWeek.allCases[$0].rawValue).tag(weekDayIndex)
                                }
                            }
                        }
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
                    self.saveNewDiet()
                    self.showModal.toggle()
                })
        } // Navigation View
    }
    
    func saveNewDiet() {
        let days = DaysOfTheWeek.allCases[weekDayIndex]
        
        self.dietListViewModel.save(name: self.name, days: days, initialDate: self.initialDate, finishDate: self.finishDate, meals: self.meals)
    }
}

struct MealCell: View {
    var index: Int
    @State var meal: Meal
    
    var body: some View {
        if #available(iOS 14.0, *) {
            DatePicker("Refeição \(index + 1)", selection: $meal.time, displayedComponents: .hourAndMinute)
        } else {
            // Fallback on earlier versions
        }
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
        CreateDiet(showModal: .constant(true), dietListViewModel: DietListViewModel())
    }
}
