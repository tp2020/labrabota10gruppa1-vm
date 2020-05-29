//
//  Route+CoreDataProperties.swift
//  task2.2Lab9
//
//  Created by Ivan on 15.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//
//

import Foundation
import CoreData


extension Route {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Route> {
        return NSFetchRequest<Route>(entityName: "Route")
    }

    @NSManaged public var from: String?
    @NSManaged public var to: String?
    @NSManaged public var prise: Float
    @NSManaged public var duration: Int64

}
