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
    
    func from(diet: Diet) {
        self.id = diet.id
        self.name = diet.name
        self.initialDate = diet.initialDate
        self.finishDate = diet.finishDate
        self.frequency = diet.frequency.rawValue
        self.meals = NSSet(array: diet.meals)
    }
}
