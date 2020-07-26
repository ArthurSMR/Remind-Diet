//
//  DietViewModel.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 25/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

class DietListViewModel: ObservableObject {
    @Published private var dietViewModel: Diet
    
    static func createDiet(name: String, days: [String], initialDate: Date, finishDay: Date, meals: [Meal]) -> Diet {
        return Diet(name: name, days: days, startDay: initialDate, finishDay: finishDay, meals: meals)
    }
    
    init(name: String, days: [String], startDay: Date, finishDay: Date, meals: [Meal]) {
        self.dietViewModel = DietListViewModel.createDiet(name: name, days: days, initialDate: startDay, finishDay: finishDay, meals: meals)
    }
    
    init() {
        self.dietViewModel = DietListViewModel.createDiet(name: "Nova dieta", days: [], initialDate: Date(), finishDay: Date(), meals: [])
    }
    
    // MARK: - Access to the model
    
    var name: String {
        dietViewModel.name
    }
    
    var days: [String] {
        dietViewModel.days
    }
    
    var startDay: Date {
        dietViewModel.initialDate
    }
    
    var finishDay: Date {
        dietViewModel.finishDate
    }
    
    var meals: [Meal] {
        dietViewModel.meals
    }
    
    // MARK: - Intents
    
    func saveDiet(name: String, days: [String], initialDate: Date, finishDate: Date, meals: [Meal]) {
        self.dietViewModel = DietListViewModel.createDiet(name: name, days: days, initialDate: initialDate, finishDay: finishDate, meals: meals)
    }
}

struct FoodMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
