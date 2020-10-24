//
//  CoreDataDAO.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 23/10/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import CoreData

class DietDAO {
    
    var context: NSManagedObjectContext {
        return CoreDataStore.shared.context
    }
    
    func create(diet: Diet) {
        
        let newDiet = DietEntity(context: context)
        newDiet.id = diet.id
        newDiet.name = diet.name
        newDiet.initialDate = diet.initialDate
        newDiet.finishDate = diet.finishDate
        newDiet.frequency = diet.frequency.rawValue
        
        
        for meal in diet.meals {
            let newMealEntity = MealEntity(context: context)
            newMealEntity.time = meal.time
            newMealEntity.diet = newDiet
            newDiet.addToMeals(newMealEntity)
        }
        
        do {
            try context.save()
            print(diet.name, "created with success")
        } catch let error {
            print("Error creating diet at context! \(error)")
        }
    }
    
}
