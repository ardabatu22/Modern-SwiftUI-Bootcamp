//
//  AlternativeListView.swift
//  MasterListApp
//
//  Created by Batuhan Arda on 1.09.2025.
//

import SwiftUI

struct AlternativeListView: View {
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(alignment: .center, spacing: 5) {
                    ForEach($viewModel.items) { $item in
                        NavigationLink(destination: DetailView(item: $item)){
                            VStack(alignment: .center) {
                                Text(item.title).font(.headline)
                                    .foregroundStyle(.black)
                                Text(item.description)
                                    .font(.subheadline).bold()
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal)
                            .frame(width:300,height:50,alignment: .center)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Alternatif Görünüm")
        }
    }
}

#Preview {
    AlternativeListView()
}
