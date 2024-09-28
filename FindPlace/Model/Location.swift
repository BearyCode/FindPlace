//
//  Location.swift
//  InfoGuide
//
//  Created by BearyCode on 06.09.24.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let name: String
    let adress: String
    let cityName: String
    let country: String
    let coordinates: CLLocationCoordinate2D
    let link: String
    
    var id: String {
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
