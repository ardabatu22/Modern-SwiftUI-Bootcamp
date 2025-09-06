//
//  TaskViewModel.swift
//  GorevYonetimUygulamasi
//
//  Created by Batuhan Arda on 6.09.2025.
//

import Foundation
import SwiftUI

@MainActor
class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    @Published var newTaskTitle: String = ""
    @Published var errorMessage:String?
    
    // Add Task
    func addTask() {
        guard !newTaskTitle.isEmpty else {
        return errorMessage = "Boş görev eklenemez" }
        let task = TaskModel(title: newTaskTitle)
        tasks.append(task)
        newTaskTitle = ""
    }
    
    // Delete Task
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    // Change Task Situation
    func toggleTaskCompletion(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}
