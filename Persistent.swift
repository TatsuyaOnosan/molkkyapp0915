//
//  Persistent.swift
//  TestCoreData
//
//  Created by Tatsuya Ono on 2024/09/09.
//

import CoreData

struct PersistenceControlloer {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MyCoreData")
        
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
    }
}
