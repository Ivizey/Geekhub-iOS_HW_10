//
//  Student+CoreDataProperties.swift
//  Geekhub-iOS_HW_10
//
//  Created by Pavel Bondar on 19.12.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var name: String?
    @NSManaged public var projects: NSSet?
    @NSManaged public var group: Group?

}

// MARK: Generated accessors for projects
extension Student {

    @objc(addProjectsObject:)
    @NSManaged public func addToProjects(_ value: Project)

    @objc(removeProjectsObject:)
    @NSManaged public func removeFromProjects(_ value: Project)

    @objc(addProjects:)
    @NSManaged public func addToProjects(_ values: NSSet)

    @objc(removeProjects:)
    @NSManaged public func removeFromProjects(_ values: NSSet)

}
