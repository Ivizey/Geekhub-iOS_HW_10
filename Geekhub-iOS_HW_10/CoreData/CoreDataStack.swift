//
//  CoreDataStack.swift
//  Geekhub-iOS_HW_10
//
//  Created by Pavel Bondar on 19.12.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import CoreData

class CoreDataStack {

    static let shared = CoreDataStack()

    private init() { }

    private(set) lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")

        container.loadPersistentStores(completionHandler: { _, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
//            debugPrint(persistentStoreDescription)
        })
        return container
    }()
}
