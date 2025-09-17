//
//  EventListView.swift
//  FormAndDetail
//
//  Created by Batuhan Arda on 17.09.2025.
//

import SwiftUI

struct EventListView: View {
    @StateObject private var viewModel = EventViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.events) { event in
                    NavigationLink(destination: EventDetailView(event: event, viewModel: viewModel)) {
                        VStack(alignment: .leading) {
                            Text(event.title)
                                .font(.headline)
                            Text(event.date, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(event.type.rawValue)
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle(AppStrings.EventList.title)
            .toolbar {
                Button(action: { viewModel.isAddingEvent.toggle() }) {
                    Image(systemName: AppStrings.EventList.addButton)
                }
            }
            .sheet(isPresented: $viewModel.isAddingEvent) {
                AddEventView(viewModel: viewModel)
            }
        }
    }
}


#Preview {
    EventListView()
}
