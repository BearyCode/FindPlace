//
//  LocationsListView.swift
//  InfoGuide
//
//  Created by BearyCode on 06.09.24.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(location.name)
                Text(location.cityName)
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
        }
    }
}
