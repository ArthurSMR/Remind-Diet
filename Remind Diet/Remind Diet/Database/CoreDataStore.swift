//
//  CoreDataStore.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 23/10/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import CoreData

class CoreDataStore: NSObject {
    
    private lazy var persistentContainer: NSPersistentContainer = {
        
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Remind Diet")
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            
            if let error = error as NSError? {
                print("Unresolved error at loading persistentContainer \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    public var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private override init() {}
    
    static let shared = CoreDataStore()
    
    deinit {
        
        do {
            try context.save()
        } catch {
            print("Unresolved at CoreDataStore deinit error: \(error)")
        }
    }
}
