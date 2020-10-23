//
//  DietListEntity+CoreDataProperties.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 23/10/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//
//

import Foundation
import CoreData


extension DietListEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DietListEntity> {
        return NSFetchRequest<DietListEntity>(entityName: "DietListEntity")
    }
    
//    @NSManaged public var list: [DietList]

}

extension DietListEntity : Identifiable {

}
