//
//  ListView.swift
//  MasterListApp
//
//  Created by Batuhan Arda on 1.09.2025.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = ListViewModel()
    @State private var newTitle = ""
    @State private var newDescription = ""
    @State private var themeColor: Color = .blue
    
    var body: some View {
        NavigationStack {
            VStack {
                addSection
                listSection
                
            }
            .background(themeColor.opacity(0.1))
            .onAppear {
                let colors: [Color] = [.blue, .green, .orange, .pink, .purple, .red, .yellow]
                themeColor = colors.randomElement() ?? .blue
            }
            .navigationTitle("MasterListApp")
        }
    }
    
    private var addSection: some View {
        HStack {
            TextField("Başlık", text: $newTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Açıklama", text: $newDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                guard !newTitle.isEmpty, !newDescription.isEmpty else { return }
                viewModel.addItem(title: newTitle, description: newDescription)
                newTitle = ""
                newDescription = ""
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                    .foregroundColor(.green)
            }
        }
        .padding()
    }
    private var listSection: some View {
        List {
            Section(header: Text("Tamamlanacaklar")) {
                ForEach($viewModel.items) { $item in
                    if !item.isDone {
                        NavigationLink(destination: DetailView(item: $item)) {
                            VStack(alignment: .leading) {
                                Text(item.title).font(.headline)
                                Text(item.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteItem)
            }
            
            Section(header: Text("Tamamlananlar")) {
                ForEach($viewModel.items) { $item in
                    if item.isDone { 
                        NavigationLink(destination: DetailView(item: $item)) {
                            VStack(alignment: .leading) {
                                Text(item.title).font(.headline)
                                Text(item.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteItem)
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

#Preview {
    ListView()
}
