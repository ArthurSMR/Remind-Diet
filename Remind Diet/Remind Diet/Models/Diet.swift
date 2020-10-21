//
//  Diet.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 25/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

struct DietList {
    var diets: [Diet]
    
    struct Diet: Hashable {
        var name: String
        var days: DaysOfTheWeek
        var initialDate: Date
        var finishDate: Date
        var meals: [Meal]
        
        init(name: String, days: DaysOfTheWeek, initialDate: Date, finishDate: Date, meals: [Meal]) {
            self.name = name
            self.days = days
            self.initialDate = initialDate
            self.finishDate = finishDate
            self.meals = meals
        }
        
        func daysBetween() -> Int {
            Calendar.current.dateComponents([.day], from: self.initialDate, to: self.finishDate).day ?? 0
        }
    }
}
