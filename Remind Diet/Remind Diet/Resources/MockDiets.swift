//
//  MockDiets.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 26/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

class MockDiets {
    
    static var diets: [DietList.Diet] {
        var arr: [DietList.Diet] = []
        
        var diet = DietList.Diet(id: UUID(), name: "Secar o corpo", days: DaysOfTheWeek.allDays, initialDate: Date(), finishDate: Date() + 520000, meals: [])
        arr.append(diet)
        
        diet = DietList.Diet(id: UUID(), name: "Emagrecimento", days: DaysOfTheWeek.onlyWeekDays, initialDate: Date(), finishDate: Date() + 260000, meals: [])
        arr.append(diet)
        
        diet = DietList.Diet(id: UUID(), name: "Hipertrofia", days: DaysOfTheWeek.onlyWeekend, initialDate: Date(), finishDate: Date() + 100000, meals: [])
        arr.append(diet)
        
        return arr
    }
}
