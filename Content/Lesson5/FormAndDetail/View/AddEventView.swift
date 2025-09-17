//
//  AddEventView.swift
//  FormAndDetail
//
//  Created by Batuhan Arda on 17.09.2025.
//

import SwiftUI

struct AddEventView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: EventViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(AppStrings.AddEvent.section)) {
                    TextField(AppStrings.AddEvent.nameField, text: $viewModel.newTitle)
                    DatePicker(AppStrings.AddEvent.datePicker, selection: $viewModel.newDate, displayedComponents: .date)
                    Picker(AppStrings.AddEvent.type, selection: $viewModel.newType) {
                        ForEach(EventType.allCases) { eventType in
                            Text(eventType.rawValue).tag(eventType)
                        }
                    }
                    Toggle(AppStrings.AddEvent.reminder, isOn: $viewModel.newHasReminder)
                }
            }
            .navigationTitle(AppStrings.AddEvent.title)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(AppStrings.AddEvent.cancel) { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(AppStrings.AddEvent.save) {
                        viewModel.addEvent()
                        dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    AddEventView(viewModel: EventViewModel())
}
