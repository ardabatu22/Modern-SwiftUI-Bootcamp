//
//  EventDetailView.swift
//  FormAndDetail
//
//  Created by Batuhan Arda on 17.09.2025.
//

import SwiftUI

struct EventDetailView: View {
    let event: Event
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text(event.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(event.date, style: .date)
                .font(.title2)
                .foregroundColor(.gray)
            
            Text("\(AppStrings.Detail.type): \(event.type.rawValue)")
                .font(.headline)
            
            Toggle(AppStrings.Detail.reminder, isOn: Binding(
                get: { event.hasReminder },
                set: { _ in viewModel.toggleReminder(for: event) }
            ))
            .padding()
            
            Spacer()
            
            Button(role: .destructive) {
                viewModel.deleteEvent(event)
                dismiss()
            } label: {
                Text(AppStrings.Detail.delete)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle(AppStrings.Detail.title)
    }
}


#Preview {
    EventDetailView(event: Event(title: "", date: Date(), type: EventType.birthday, hasReminder: true), viewModel: EventViewModel())
}
