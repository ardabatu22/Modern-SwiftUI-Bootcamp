//
//  DetailView.swift
//  MasterListApp
//
//  Created by Batuhan Arda on 1.09.2025.
//

import SwiftUI

struct DetailView: View {
    @Binding var item: ListItem
    let symbols = ["star", "heart", "house", "bolt", "flame", "globe", "cloud", "book", "music.note", "cart"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text(item.title)
                .font(.largeTitle)
                .bold()
            
            Text(item.description)
                .font(.body)
                .padding()
            
            Image(systemName: symbols.randomElement() ?? "star")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle("Detay")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    item.isDone.toggle()
                } label: {
                    Label(
                        item.isDone ? "Geri Al" : "Tamamla",
                        systemImage: item.isDone ? "arrow.uturn.backward.circle" : "checkmark.circle"
                    )
                }
            }
        }
    }
}

#Preview {
    DetailView(item: .constant(ListItem(title: "30", description: "30")))
}
