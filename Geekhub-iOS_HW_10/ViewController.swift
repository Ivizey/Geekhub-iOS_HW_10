//
//  ViewController.swift
//  Geekhub-iOS_HW_10
//
//  Created by Pavel Bondar on 19.12.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var studentsTableView: UITableView!
    
    private var students: [String] = []
    private var projectTheme: [String] = []
    private var groups: [String] = []
    private var teachers: [String] = []
    private var student: Student?
    private var group: Group?
    private var teacher: Teacher?
    private var project: Project?
    private let coreData = CoreDataStack.shared

    @IBAction func deleteButton(_ sender: Any) {
        
    }
    
    @IBAction func addStudentButton(_ sender: UIBarButtonItem) {
        createAddStudentDialog()
    }

    private func createAddStudentDialog() {
        let alert = UIAlertController(title: "Додати нову групу", message: "Введіть назву групи", preferredStyle: .alert)
        let add = UIAlertAction(title: "Додати", style: .default, handler: { action in
            if let name = alert.textFields?.first?.text {
                self.createGroup(name: name)
            }})
        let cancel = UIAlertAction(title: "Скасувати", style: .cancel, handler: nil)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Назва"
        })
        alert.addAction(add)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    private func saveCoreData() {
        do {
        try coreData.persistentContainer.viewContext.save()
        } catch {
            debugPrint(error)
        }
    }

    private func createStudent(name: String) {
        student = Student(context: coreData.persistentContainer.viewContext)
        guard let student = student else { return }
        student.name = name
        saveCoreData()
        students.append(student.name!)
        createProject(theme: "Project")
        self.studentsTableView.reloadData()
    }
    
    private func createGroup(name: String) {
        group = Group(context: coreData.persistentContainer.viewContext)
        guard let group = group else { return }
        group.name = name
        saveCoreData()
        groups.append(group.name!)
        self.studentsTableView.reloadData()
    }
    
    private func createTeacher(name: String, birthday: Date) {
        teacher = Teacher(context: coreData.persistentContainer.viewContext)
        guard let teacher = teacher else { return }
        teacher.name = name
        teacher.birthday = birthday
        saveCoreData()
        teachers.append(teacher.name!)
        self.studentsTableView.reloadData()
    }
    
    private func createProject(theme: String) {
        project = Project(context: coreData.persistentContainer.viewContext)
        guard let project = project else { return }
        project.theme = theme
        saveCoreData()
        student?.addToProjects(project)
        saveCoreData()
        projectTheme.append(project.theme!)
    }
    
    private func removeStudent() {
        if let student = self.student {
            coreData.persistentContainer.viewContext.delete(student)
        }
    }
    
    private func removeGroup() {
        if let group = self.group {
            coreData.persistentContainer.viewContext.delete(group)
        }
    }
    
    private func removeTeacher() {
        if let teacher = self.teacher {
            coreData.persistentContainer.viewContext.delete(teacher)
        }
    }
    
    private func removeProject() {
        if let project = self.project {
            coreData.persistentContainer.viewContext.delete(project)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        cell.detailTextLabel?.text = projectTheme[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        students.remove(at: indexPath.row)
        projectTheme.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
        removeStudent()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groups[section]
    }
}
