//
//  DietViewModel.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 25/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

class DietListViewModel: ObservableObject {
    @Published private var dietListViewModel: DietList
    
    static func createDietList() -> DietList {
        DietList(diets: MockDiets.diets)
    }
    
    init() {
        self.dietListViewModel = DietListViewModel.createDietList()
    }
    
    // MARK: - Access to model
    
    var diets: [DietList.Diet] {
        dietListViewModel.diets
    }
    
    // MARK: - Intents
    
    func save(name: String, days: DaysOfTheWeek, initialDate: Date, finishDate: Date, meals: [Meal]) {
        let uuid = UUID()
        let newDiet = DietList.Diet(id: uuid, name: name, days: days, initialDate: initialDate, finishDate: finishDate, meals: meals)
        dietListViewModel.diets.append(newDiet)
    }
}

struct FoodMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
