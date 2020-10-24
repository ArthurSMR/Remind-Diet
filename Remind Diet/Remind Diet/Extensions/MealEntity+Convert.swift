//
//  MealEntity+Convert.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 24/10/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

extension MealEntity {

    func toModel() -> Meal {
        let meal = Meal(time: self.time ?? Date())
        return meal
    }
    
    func from(meal: Meal) {
        self.time = meal.time
    }
}
