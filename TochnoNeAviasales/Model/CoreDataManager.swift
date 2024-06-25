//
//  CoreDataManager.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 26.06.2024.
//
//MARK: --
//MARK: Использую CoreData потому что могу! (тут UserDefoults был бы оптимальнее)
//MARK: --

import Foundation
import CoreData

class CoreDataManager {
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
     
        let container = NSPersistentContainer(name: "TochnoNeAviasales")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    //MARK: - CRUD
    
    lazy var context = persistentContainer.viewContext
    
    func createData(city getCity : String){
        
        let currentCity = MyCity(context: context)
        currentCity.city = getCity
        
        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }
    
    func readData() -> [MyCity]{
        
        let fetchRequest = NSFetchRequest<MyCity>(entityName: "MyCity")
        do {
            let savedCity = try context.fetch(fetchRequest)
            return savedCity
        } catch {
            print("Error readData")
        }
        return []
    }
    
    func updateData(_ newCityName: String) {
        let fetchRequest = NSFetchRequest<MyCity>(entityName: "MyCity")

        do {
            let savedCities = try context.fetch(fetchRequest)

            if let cityToUpdate = savedCities.first {
                cityToUpdate.city = newCityName
                do {
                    try context.save()
                } catch {
                    print("Error saving updated city: \(error)")
                }
            } else {
                print("No city found with id 0")
            }

        } catch {
            print("Error updating data: \(error)")
        }
    }
    
    func removeAllData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = MyCity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Error removeAllData: \(error)")
        }
    }
    
    //для однострочного запроса
    
    func getReadData() -> String? {
        if readData() == [] {
            return nil
        } else {
            return readData()[0].city
        }
    }
    
}
