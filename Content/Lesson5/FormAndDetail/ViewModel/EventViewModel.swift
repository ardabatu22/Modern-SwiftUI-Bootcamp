//
//  EventViewModel.swift
//  FormAndDetail
//
//  Created by Batuhan Arda on 17.09.2025.
//

import Foundation

@MainActor
final class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    // Modal kontrolü
    @Published var isAddingEvent = false
    
    // Form state
    @Published var newTitle: String = ""
    @Published var newDate: Date = Date()
    @Published var newType: EventType = .other
    @Published var newHasReminder: Bool = false
    
    // Yeni etkinlik ekleme
    func addEvent() {
        let newEvent = Event(title: newTitle, date: newDate, type: newType, hasReminder: newHasReminder)
        events.append(newEvent)
        clearForm()
    }
    
    // Etkinlik silme
    func deleteEvent(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
    
    // Hatırlatıcı aç/kapa
    func toggleReminder(for event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index].hasReminder.toggle()
        }
    }
    
    // Form temizleme
    private func clearForm() {
        newTitle = ""
        newDate = Date()
        newType = .other
        newHasReminder = false
        isAddingEvent = false
    }
}

