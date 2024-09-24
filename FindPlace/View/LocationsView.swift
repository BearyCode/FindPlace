//
//  LocationsView.swift
//  InfoGuide
//
//  Created by BearyCode on 06.09.24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    let maxWidthForIpad: CGFloat = 700
    
    var body: some View {
        ZStack {
            map
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                VStack() {
                    header
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                    
                    searchButton
                        .padding(.trailing, 30)
                        .frame(maxWidth: maxWidthForIpad, alignment: .trailing)
                }
                
                Spacer()
                
                locationsPreview
            }
        }
        .sheet(isPresented: $viewModel.showSearchSheet) {
            LocationSearchLocationView()
        }
        .sheet(item: $viewModel.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}


extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: viewModel.toggleLocationsList) {
                let title = viewModel.locations.contains(viewModel.mapLocation) ? viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName : ""
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationList ? 180 : 0))
                    }
            }
            
            if viewModel.showLocationList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3),
                radius: 20,
                x: 0,
                y: 15)
    }
    
    private var searchButton: some View {
        Button(action: viewModel.searchButtonTapped) {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .padding(16)
                .scaledToFit()
                .background(.thickMaterial)
                .foregroundStyle(Color.blue)
                .cornerRadius(10)
        }
        .frame(width: 30, height: 30)
    }
    
    private var map: some View {
        Map(position: $viewModel.mapRegion) {
            Annotation(viewModel.mapLocation.name, coordinate: viewModel.mapLocation.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(1)
                    .shadow(radius: 10)
            }
        }
    }
    
    private var locationsPreview: some View {
        ZStack {
            LocationPreviewView(location: viewModel.mapLocation,
                                isSavedLocation: true)
            .shadow(color: Color.black.opacity(0.3),
                    radius: 20)
            .padding()
            .frame(maxWidth: maxWidthForIpad)
            .frame(maxWidth: .infinity)
            .transition(.asymmetric(insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
        }
    }
}
