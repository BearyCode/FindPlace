//
//  LocationsViewModel.swift
//  InfoGuide
//
//  Created by BearyCode on 06.09.24.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1,
                                   longitudeDelta: 0.1)
    
    @Published var showLocationList: Bool = false
    @Published var showSearchSheet: Bool = false
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        let coordinates = CLLocationCoordinate2D(latitude: location.coordinates.latitude,
                                                 longitude: location.coordinates.longitude)
        withAnimation(.easeInOut) {
            mapRegion = MapCameraPosition.region(MKCoordinateRegion(center: coordinates,
                                                                    span: mapSpan))
        }
    }
    
    func searchButtonTapped() {
        withAnimation(.easeInOut) {
            showSearchSheet = !showSearchSheet
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
}
