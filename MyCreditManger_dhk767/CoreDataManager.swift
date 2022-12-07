//
//  CoreDataManager.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/07.
//

import Foundation
import CoreData

class UsersNameDataManager {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UsersName")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("에러 : \(error), \(error.userInfo)")
        }
    }
    
}

class ScoresDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Scores")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("에러 : \(error), \(error.userInfo)")
        }
    }
}
