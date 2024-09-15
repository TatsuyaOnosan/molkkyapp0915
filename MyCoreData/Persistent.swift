//
//  Persistent.swift
//  molkkyapp
//
//  Created by 小野竜弥on 2024/09/15.
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
