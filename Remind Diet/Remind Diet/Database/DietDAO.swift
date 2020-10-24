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
    
    func create(diet: Diet) throws {
        
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
        } catch let error {
            throw error
        }
    }
    
    func fetch() throws -> [Diet] {
        
        let dietEntityFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DietEntity")
        
        do {
            let dietResult = try self.context.fetch(dietEntityFetchRequest)
            
            if let diets = dietResult as? [DietEntity] {
                
                return diets.map { $0.toModel() }
            } else {
                throw CoreDataStoreError.CannotFetch("Could not load diets from CoreData")
            }
        } catch {
            throw CoreDataStoreError.CannotFetch("Could not load diets from CoreData")
        }
    }
}
