//
//  DietEntity+Convert.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 23/10/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

extension DietEntity {

    func toModel () -> Diet {
        
        var readyMeals: [Meal] = []
        
        if let mealsBla = self.meals?.allObjects as? [MealEntity] {
            
            for meal in mealsBla {
                readyMeals.append(meal.toModel())
            }
        }

        
        let id = self.id ?? UUID()
        let name = self.name ?? ""
        let frequency = Frequency(rawValue: self.frequency ?? "") ?? .allDays
        let initialDate = self.initialDate ?? Date()
        let finishDate = self.finishDate ?? Date()

        let diet = Diet(id: id, name: name, frequency: frequency, initialDate: initialDate, finishDate: finishDate, meals: readyMeals)
        
        return diet
    }
}

extension MealEntity {

    func toModel() -> Meal {
        let meal = Meal(time: self.time ?? Date())
        print(self.time, self.diet?.name)
        return meal
    }
}
