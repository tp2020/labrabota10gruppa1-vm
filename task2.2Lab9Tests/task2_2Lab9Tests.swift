//
//  task2_2Lab9Tests.swift
//  task2.2Lab9Tests
//
//  Created by Ivan on 28.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import XCTest
import CoreData
@testable import task2_2Lab9

class task2_2Lab9Tests: XCTestCase {

   
    var  persistentContainer: NSPersistentContainer? = nil;
    
    
    override func setUpWithError() throws {
        
        
          persistentContainer = {
            /*
             The persistent container for the application. This implementation
             creates and returns a container, having loaded the store for the
             application to it. This property is optional since there are legitimate
             error conditions that could cause the creation of the store to fail.
            */
            let container = NSPersistentContainer(name: "task2_2Lab9")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                     
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
       
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let a = 2;
        
        NSLog("Doing test a");
        
        XCTAssert(a==2, "a should be equal to 2");
        
    }
    
    
    func testRouteSearch() throws{
        let searchRequest = NSFetchRequest<NSManagedObject>(entityName: "Route");
           
           searchRequest.predicate=NSPredicate(format: "from == %@ && to == %@", "Brest", "Minsk");
           
           
        let foundRoutes=try persistentContainer!.viewContext.fetch(searchRequest);
        
        XCTAssertTrue(foundRoutes.count>0,"There should be some route from Brest to Misnk");
    }
    
    
    func testRouteSearchFailed() throws{
        let searchRequest = NSFetchRequest<NSManagedObject>(entityName: "Route");
           
           searchRequest.predicate=NSPredicate(format: "from == %@ && to == %@", "Moscow", "Minsk");
           
           
        let foundRoutes=try persistentContainer!.viewContext.fetch(searchRequest);
        
        XCTAssertTrue(foundRoutes.count>0,"There should be no route from Brest to Misnk");
    }
    
    
    func testRouteSearchUser() throws{
        let searchRequest = NSFetchRequest<NSManagedObject>(entityName: "User");
           
            searchRequest.predicate=NSPredicate(format: "login == %@", "228");
           
           
        let foundRoutes=try persistentContainer!.viewContext.fetch(searchRequest);
        
        XCTAssertTrue(foundRoutes.count == 0,"There should be no user ");
    }
    
    func testRouteSearchUserFailed() throws{
        let searchRequest = NSFetchRequest<NSManagedObject>(entityName: "User");
           
           searchRequest.predicate=NSPredicate(format: "login == %@", "admin");
           
           
        let foundRoutes=try persistentContainer!.viewContext.fetch(searchRequest);
        
        XCTAssertTrue(foundRoutes.count>0,"There should be no user");
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
