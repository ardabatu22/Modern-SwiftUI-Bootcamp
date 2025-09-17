//
//  NoteDetailView.swift
//  NotDefteriUygulamasi
//
//  Created by Batuhan Arda on 17.09.2025.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    @ObservedObject var viewModel: NoteViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(note.title)
                .font(.largeTitle)
                .bold()
            
            Text("\(AppStrings.Detail.date): \(note.date.formatted(date: .long, time: .shortened))")
                .foregroundColor(.gray)
            
            Divider()
            
            Text(note.content)
                .font(.body)
            
            Spacer()
            
            Button(role: .destructive) {
                viewModel.deleteNote(note)
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
    NoteDetailView(note: Note(title: "", content: ""), viewModel: NoteViewModel())
}
