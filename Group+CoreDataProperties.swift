//
//  Group+CoreDataProperties.swift
//  Geekhub-iOS_HW_10
//
//  Created by Pavel Bondar on 19.12.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var name: String?
    @NSManaged public var students: NSSet?
    @NSManaged public var teachers: NSSet?

}

// MARK: Generated accessors for students
extension Group {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}

// MARK: Generated accessors for teachers
extension Group {

    @objc(addTeachersObject:)
    @NSManaged public func addToTeachers(_ value: Teacher)

    @objc(removeTeachersObject:)
    @NSManaged public func removeFromTeachers(_ value: Teacher)

    @objc(addTeachers:)
    @NSManaged public func addToTeachers(_ values: NSSet)

    @objc(removeTeachers:)
    @NSManaged public func removeFromTeachers(_ values: NSSet)

}
