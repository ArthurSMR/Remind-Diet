//
//  CoreDataStoreErrors.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 23/10/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

enum CoreDataStoreError: Equatable, Error {
    
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}
