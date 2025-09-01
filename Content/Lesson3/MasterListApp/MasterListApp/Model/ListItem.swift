//
//  ListItem.swift
//  MasterListApp
//
//  Created by Batuhan Arda on 1.09.2025.
//

import Foundation

struct ListItem: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var isDone: Bool = false
}
