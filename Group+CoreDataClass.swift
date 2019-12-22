//
//  Group+CoreDataClass.swift
//  Geekhub-iOS_HW_10
//
//  Created by Pavel Bondar on 19.12.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Group)
public class Group: NSManagedObject {
    var studentsArray: [Student] {
        students?.allObjects as? [Student] ?? []
    }
    var teachersArray: [Teacher] {
        teachers?.allObjects as? [Teacher] ?? []
    }
}
