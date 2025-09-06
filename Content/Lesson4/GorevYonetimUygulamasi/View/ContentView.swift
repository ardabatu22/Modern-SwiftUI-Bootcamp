//
//  ContentView.swift
//  GorevYonetimUygulamasi
//
//  Created by Batuhan Arda on 6.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                addTaskSection
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                taskListSection
            }
            .navigationTitle(AppStrings.ContentView.navigationTitle)
        }
    }
}

extension ContentView {
    // Section for adding new task
    private var addTaskSection: some View {
        HStack {
            TextField(AppStrings.ContentView.taskPlaceholder, text: $viewModel.newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                viewModel.addTask()
            }) {
                Image(systemName: SystemIcons.addTask)
                    .font(.title)
            }
        }
        .padding()
    }
    
    // Section for listing all tasks
    private var taskListSection: some View {
        List {
            ForEach(viewModel.tasks) { task in
                taskRow(task)
            }
            .onDelete(perform: viewModel.deleteTask)
        }
    }
    
    // Single task row view
    private func taskRow(_ task: TaskModel) -> some View {
        HStack {
            Button(action: {
                viewModel.toggleTaskCompletion(task: task)
            }) {
                Image(systemName: task.isCompleted ? SystemIcons.completed : SystemIcons.uncompleted)
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            
            Text(task.title)
                .strikethrough(task.isCompleted, color: .black)
                .foregroundColor(task.isCompleted ? .gray : .primary)
        }
    }
}

#Preview {
    ContentView()
}
