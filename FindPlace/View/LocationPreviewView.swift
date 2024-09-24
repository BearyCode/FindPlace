//
//  LocationPreviewView.swift
//  InfoGuide
//
//  Created by BearyCode on 06.09.24.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    let location: Location
    let isSavedLocation: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            titleSection
            
            if isSavedLocation {
                VStack(spacing: 8) {
                    learnMoreButton
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
        )
        .cornerRadius(10)
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!, isSavedLocation: false)
        .environmentObject(LocationsViewModel())
}


extension LocationPreviewView {
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            viewModel.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .foregroundStyle(Color.blue)
                .frame(width: 125,
                       height: 35)
        }
        .buttonStyle(.bordered)
    }
}
