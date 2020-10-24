//
//  DietViewModel.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 25/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

class DietListViewModel: ObservableObject {
    
    @Published private var dietListViewModel: DietList
    
    private var dietWorker: DietWorker = DietWorker()
    
    static func createDietList() -> DietList {
        DietList(diets: MockDiets.diets)
    }
    
    init() {
        dietListViewModel = DietList(diets: [])
        self.fetchDiets()
    }
    
    // MARK: - Access to model
    
    var diets: [Diet] {
        dietListViewModel.diets
    }
    
    // MARK: - Intents
    
    func save(name: String, frequency: Frequency, initialDate: Date, finishDate: Date, meals: [Meal]) {
        let uuid = UUID()
        let newDiet = Diet(id: uuid, name: name, frequency: frequency, initialDate: initialDate, finishDate: finishDate, meals: meals)
        
        dietWorker.createDiet(diet: newDiet) { (result) in
            // TODO: treat error here
        }
        
        dietListViewModel.diets.append(newDiet)
    }
    
    func fetchDiets() {
        
        dietWorker.fetchDiet { (diets, error) in
            if let error = error {
                print(error)
            } else {
                self.dietListViewModel = DietList(diets: diets)
            }
        }
    }
    
    func move(source: IndexSet, destination: Int) {
        dietListViewModel.diets.move(fromOffsets: source, toOffset: destination)
    }
}

struct FoodMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
