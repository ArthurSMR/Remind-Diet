//
//  MockDiets.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 26/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

class MockDiets {
    
    static var diets: [Diet] {
        var arr: [Diet] = []
        
        var diet = Diet(id: UUID(), name: "Secar o corpo", frequency: Frequency.allDays, initialDate: Date(), finishDate: Date() + 520000, meals: [])
        arr.append(diet)
        
        diet = Diet(id: UUID(), name: "Emagrecimento", frequency: Frequency.onlyWeekDays, initialDate: Date(), finishDate: Date() + 260000, meals: [])
        arr.append(diet)
        
        diet = Diet(id: UUID(), name: "Hipertrofia", frequency: Frequency.onlyWeekend, initialDate: Date(), finishDate: Date() + 100000, meals: [])
        arr.append(diet)
        
        return arr
    }
}
