//
//  User+CoreDataProperties.swift
//  task2.2Lab9
//
//  Created by Ivan on 30.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int64
    @NSManaged public var login: String?
    @NSManaged public var password: String?

}
