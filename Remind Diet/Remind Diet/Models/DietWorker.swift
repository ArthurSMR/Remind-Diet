//
//  DietWorker.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 23/10/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import UIKit

protocol DietBusinessLogic {
    func createDiet(diet: Diet, completion: (Result<Bool, Error>) -> Void)
}

class DietWorker: DietBusinessLogic {
    
    var dietDAO = DietDAO()
    
    func createDiet(diet: Diet, completion: (Result<Bool, Error>) -> Void) {
        do {
            try dietDAO.create(diet: diet)
            completion(.success(true))
        } catch let error {
            print(error)
            completion(.failure(error))
        }
    }
    
    func fetchDiet(completion: @escaping(_ diets: [Diet], _ error: Error?) -> Void) {
        
        do {
            let diets = try dietDAO.fetch()
            completion(diets, nil)
        } catch let error {
            completion([], error)
        }
    }
    
}
