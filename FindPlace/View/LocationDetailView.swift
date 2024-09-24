//
//  LocationDetailView.swift
//  InfoGuide
//
//  Created by BearyCode on 06.09.24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    map
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(BackButton(viewModel: viewModel, sheet: "location"),
                 alignment: .topTrailing)
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationDetailView {
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(location.cityName + ", " + location.country)
                .font(.title3)
                .foregroundStyle(Color.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name + ", " + location.adress)
                .font(.subheadline)
                .foregroundStyle(Color.secondary)
            
            if let url = URL(string: location.link) {
                Link("View link", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var map: some View {
        Map(position: $viewModel.mapRegion) {
            let coordinates = CLLocationCoordinate2D(latitude: location.coordinates.latitude,
                                                     longitude: location.coordinates.longitude)
            Annotation(location.name, coordinate: coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }
    
    private var backButton: some View {
        Button {
            viewModel.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(Color.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}
