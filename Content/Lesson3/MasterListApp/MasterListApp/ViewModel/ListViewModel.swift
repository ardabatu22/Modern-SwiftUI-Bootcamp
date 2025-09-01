//
//  ListViewModel.swift
//  MasterListApp
//
//  Created by Batuhan Arda on 1.09.2025.
//

import Foundation

@MainActor
final class ListViewModel: ObservableObject {
     @Published var items: [ListItem] = [
        ListItem(title: "Ödev 1", description: "SwiftUI listeleri öğren"),
        ListItem(title: "Ödev 2", description: "NavigationLink dene"),
        ListItem(title: "Ödev 3", description: "Section ekle"),
        ListItem(title: "Ödev 4", description: "Detay ekranına SF Symbol koy"),
        ListItem(title: "Ödev 5", description: "Dinamik veri ekle"),
        ListItem(title: "Ödev 6", description: "Swipe to delete ekle"),
        ListItem(title: "Ödev 7", description: "onAppear ile rastgele renk"),
        ListItem(title: "Ödev 8", description: "LazyVStack kullan"),
        ListItem(title: "Ödev 9", description: "Listeyi güncelle"),
        ListItem(title: "Ödev 10", description: "MasterListApp’i bitir")
    ]
    
    var pendingItems: [ListItem] {
        items.filter { !$0.isDone }
    }
    
    var completedItems: [ListItem] {
        items.filter { $0.isDone }
    }
    
    func addItem(title: String, description: String) {
        items.append(ListItem(title: title, description: description))
    }
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
