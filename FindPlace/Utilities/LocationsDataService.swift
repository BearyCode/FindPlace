//
//  LocationsDataService.swift
//  InfoGuide
//
//  Created by BearyCode on 06.09.24.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Colosseum",
            adress: "",
            cityName: "Rome",
            country: "Italy",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(
            name: "Pantheon",
            adress: "",
            cityName: "Rome",
            country: "Italy",
            coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
        Location(
            name: "Trevi Fountain",
            adress: "",
            cityName: "Rome",
            country: "Italy",
            coordinates: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(
            name: "Eiffel Tower",
            adress: "",
            cityName: "Paris",
            country: "France",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        Location(
            name: "Louvre Museum",
            adress: "",
            cityName: "Paris",
            country: "France",
            coordinates: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
            link: "https://en.wikipedia.org/wiki/Louvre"),
    ]
    
}
