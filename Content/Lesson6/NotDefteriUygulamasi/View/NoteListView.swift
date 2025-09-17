//
//  NoteListView.swift
//  NotDefteriUygulamasi
//
//  Created by Batuhan Arda on 17.09.2025.
//

import SwiftUI

struct NoteListView: View {
    @StateObject private var viewModel = NoteViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note, viewModel: viewModel)) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.map { viewModel.notes[$0] }.forEach { viewModel.deleteNote($0) }
                }
            }
            .navigationTitle(AppStrings.NotesList.title)
            .toolbar {
                Button(action: { viewModel.isAddingNote = true }) {
                    Image(systemName: AppStrings.NotesList.addButton)
                }
            }
            .sheet(isPresented: $viewModel.isAddingNote) {
                AddNoteView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    NoteListView()
}
