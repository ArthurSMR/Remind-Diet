//
//  Diet.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 25/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import UIKit

struct DietList {
    var diets: [Diet]
}

struct Diet: Hashable {
    var id: UUID
    var name: String
    var frequency: Frequency
    var initialDate: Date
    var finishDate: Date
    var meals: [Meal]
    
    init(id: UUID,name: String, frequency: Frequency, initialDate: Date, finishDate: Date, meals: [Meal]) {
        self.id = id
        self.name = name
        self.frequency = frequency
        self.initialDate = initialDate
        self.finishDate = finishDate
        self.meals = meals
    }
    
    func daysBetween() -> Int {
        Calendar.current.dateComponents([.day], from: self.initialDate, to: self.finishDate).day ?? 0
    }
}
