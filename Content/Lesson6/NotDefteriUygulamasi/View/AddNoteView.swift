//
//  AddNoteView.swift
//  NotDefteriUygulamasi
//
//  Created by Batuhan Arda on 17.09.2025.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: NoteViewModel
    
    var body: some View {
        NavigationView {
            Form {
                TextField(AppStrings.AddNote.titleField, text: $viewModel.newTitle)
                TextEditor(text: $viewModel.newContent)
                    .frame(height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3))
                    )
            }
            .navigationTitle(AppStrings.AddNote.title)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(AppStrings.AddNote.cancel) { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(AppStrings.AddNote.save) {
                        viewModel.addNote()
                        dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    AddNoteView(viewModel: NoteViewModel())
}
