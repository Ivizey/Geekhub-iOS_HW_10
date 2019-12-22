//
//  Teacher+CoreDataProperties.swift
//  Geekhub-iOS_HW_10
//
//  Created by Pavel Bondar on 21.12.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var name: String?
    @NSManaged public var teacher: NSSet?

}

// MARK: Generated accessors for teacher
extension Teacher {

    @objc(addTeacherObject:)
    @NSManaged public func addToTeacher(_ value: Group)

    @objc(removeTeacherObject:)
    @NSManaged public func removeFromTeacher(_ value: Group)

    @objc(addTeacher:)
    @NSManaged public func addToTeacher(_ values: NSSet)

    @objc(removeTeacher:)
    @NSManaged public func removeFromTeacher(_ values: NSSet)

}
