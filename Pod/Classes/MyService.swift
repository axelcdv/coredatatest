//
//  MyService.swift
//  Pods
//
//  Created by Axel Colin de Verdiere on 27/11/2015.
//
//

import Foundation
import CoreData

internal let defaultSQLStoreName = "MyModel.sqlite"
internal let applicationSupportDirectory = NSFileManager.defaultManager().URLsForDirectory(.ApplicationSupportDirectory, inDomains: .UserDomainMask).first!
internal let documentsDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!

internal let applicationName = (NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as? String) ?? "CoreData"

public class MyService {
    // MARK: - Singleton
    private static var _sharedInstance: MyService?
    
    public static func sharedInstance() -> MyService {
        if _sharedInstance == nil {
            _sharedInstance = MyService()
        }
        return _sharedInstance!
    }
    
    // MARK: - Core Data
    lazy var managedObjectModel: NSManagedObjectModel = {
        //        let modelURL = NSBundle.mainBundle().URLForResource("PeanutModel", withExtension: "momd")!
        //        let model = NSManagedObjectModel(contentsOfURL: modelURL)!
        let model = NSManagedObjectModel.mergedModelFromBundles(NSBundle.allBundles())!
        
        return model
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = documentsDirectory.URLByAppendingPathComponent(defaultSQLStoreName)
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil,
                URL: url, options: nil)
        } catch {
            // TODO: Handle error
        }
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Public interface
    public func showEntities() {
        print("\(self.managedObjectContext.persistentStoreCoordinator?.managedObjectModel.entitiesByName)")
    }
}