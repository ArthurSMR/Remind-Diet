//
//  Diet.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 25/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

struct Diet {
    var name: String
    var days: [String]
    var initialDate: Date
    var finishDate: Date
    var meals: [Meal]
    
    init(name: String, days: [String], startDay: Date, finishDay: Date, meals: [Meal]) {
        self.name = name
        self.days = days
        self.initialDate = startDay
        self.finishDate = finishDay
        self.meals = meals
    }
}
