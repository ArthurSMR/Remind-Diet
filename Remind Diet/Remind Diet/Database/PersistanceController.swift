//
//  CoreDataDAO.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 21/10/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import CoreData

struct PersistanceController {
    static let shared = PersistanceController()
    
    static var preview: PersistanceController = {
        let result = PersistanceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo) ")
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Remind Diet")
    }
}
