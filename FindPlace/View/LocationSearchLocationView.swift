//
//  LocationSearchLocationView.swift
//  InfoGuide
//
//  Created by BearyCode on 07.09.24.
//

import MapKit
import SwiftUI

struct LocationSearchLocationView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    @State private var searchResults = [SearchResult]()
    @State private var selectedLocation: Location?
    
    var body: some View {
        VStack {
            LocationSearchView(searchResults: $searchResults)
            
            Text(selectedLocation?.name ?? "")
                .font(.title2)
            
            Text(selectedLocation?.cityName ?? "")
                .font(.headline)
            
            Button {
                if let selectedLocation = selectedLocation {
                    viewModel.mapLocation = selectedLocation
                    viewModel.showSearchSheet = false
                }
            } label: {
                Text("Go")
                    .font(.headline)
                    .frame(
                        width: 125,
                        height: 35)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .presentationDetents([.height(300), .large])
        .onChange(of: searchResults) {
            if let firstResult = searchResults.first, searchResults.count == 1 {
                selectedLocation = Location(
                    name: firstResult.name,
                    adress: firstResult.adress,
                    cityName: firstResult.cityName,
                    country: firstResult.country,
                    coordinates: firstResult.coordiantes,
                    link: "")
            }
        }
    }
}

#Preview {
    LocationSearchLocationView()
        .environmentObject(LocationsViewModel())
}
