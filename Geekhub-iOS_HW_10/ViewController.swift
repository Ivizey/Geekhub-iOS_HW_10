//
//  ViewController.swift
//  Geekhub-iOS_HW_10
//
//  Created by Pavel Bondar on 19.12.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var studentLabel: UILabel!
    @IBOutlet private weak var groupLabel: UILabel!
    @IBOutlet private weak var projectLabel: UILabel!
    @IBOutlet private weak var teacherLabel: UILabel!

    private var student: Student?
    private var group: Group?
    private var teacher: Teacher?
    private var project: Project?

    private let coreData = CoreDataStack.shared
    private let section = ["студента", "групу", "проект", "вчителя"]

    @IBAction private func addAndDelete(_ sender: UIButton) {
        if sender.backgroundColor == .red {
            sender.backgroundColor = .blue
            sender.setTitle("Створити \(section[sender.tag])", for: .normal)
            action(tag: sender.tag, isOn: false)
        } else {
            sender.backgroundColor = .red
            sender.setTitle("Видалити \(section[sender.tag])", for: .normal)
            action(tag: sender.tag, isOn: true)
        }
    }

    private func action(tag: Int, isOn: Bool) {
        switch tag {
        case 0:
            if isOn {
            student = Student(context: coreData.persistentContainer.viewContext)
            guard let student = student else { return }
            student.name = "Student"
            saveCoreData()
            studentLabel.text = student.name
            } else {
                coreData.persistentContainer.viewContext.delete(student!)
            }
        case 1:
            if isOn {
            group = Group(context: coreData.persistentContainer.viewContext)
            guard let group = group else { return }
            group.name = "Group"
            saveCoreData()
            groupLabel.text = group.name
            } else {
                coreData.persistentContainer.viewContext.delete(group!)
            }
        case 2:
            if isOn {
            project = Project(context: coreData.persistentContainer.viewContext)
            guard let project = project else { return }
            project.theme = "Theme"
            saveCoreData()
            projectLabel.text = project.theme
            } else {
                coreData.persistentContainer.viewContext.delete(project!)
            }
        case 3:
            if isOn {
            teacher = Teacher(context: coreData.persistentContainer.viewContext)
            guard let teacher = teacher else { return }
            teacher.name = "Teacher"
            saveCoreData()
            teacherLabel.text = teacher.name
            } else {
                coreData.persistentContainer.viewContext.delete(teacher!)
            }
        default:
            return
        }
    }

    private func saveCoreData() {
        do {
        try coreData.persistentContainer.viewContext.save()
        } catch {
            debugPrint(error)
        }
    }
}
