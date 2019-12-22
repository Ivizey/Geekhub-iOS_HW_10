//
//  Student+CoreDataClass.swift
//  Geekhub-iOS_HW_10
//
//  Created by Pavel Bondar on 19.12.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Student)
public class Student: NSManagedObject {
    var projectsArray: [Project] {
        projects?.allObjects as? [Project] ?? []
    }
}
