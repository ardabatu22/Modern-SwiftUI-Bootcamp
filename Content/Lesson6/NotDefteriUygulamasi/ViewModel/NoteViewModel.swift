//
//  NoteViewModel.swift
//  NotDefteriUygulamasi
//
//  Created by Batuhan Arda on 17.09.2025.
//

import Foundation

@MainActor
final class NoteViewModel: ObservableObject {
    @Published private(set) var notes: [Note] = []
    
    private let storage = NoteStorage()
    
    // Form state
    @Published var newTitle: String = ""
    @Published var newContent: String = ""
    @Published var isAddingNote: Bool = false
    
    init() {
        loadNotes()
    }
    
    func addNote() {
        let note = Note(title: newTitle, content: newContent)
        notes.append(note)
        storage.save(notes)
        clearForm()
    }
    
    func deleteNote(_ note: Note) {
        notes.removeAll { $0.id == note.id }
        storage.save(notes)
    }
    
    private func loadNotes() {
        notes = storage.load()
    }
    
    private func clearForm() {
        newTitle = ""
        newContent = ""
        isAddingNote = false
    }
}
