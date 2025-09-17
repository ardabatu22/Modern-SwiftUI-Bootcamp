//
//  NoteStorage.swift
//  NotDefteriUygulamasi
//
//  Created by Batuhan Arda on 17.09.2025.
//

import Foundation

final class NoteStorage {
    private let key = "notes_key"
    
    func save(_ notes: [Note]) {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func load() -> [Note] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([Note].self, from: data) else {
            return []
        }
        return decoded
    }
}
