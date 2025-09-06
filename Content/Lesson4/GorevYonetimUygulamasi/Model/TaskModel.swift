//
//  TaskModel.swift
//  GorevYonetimUygulamasi
//
//  Created by Batuhan Arda on 6.09.2025.
//

import Foundation

struct TaskModel: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
