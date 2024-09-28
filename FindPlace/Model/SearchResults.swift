//
//  SearchResults.swift
//  InfoGuide
//
//  Created by BearyCode on 07.09.24.
//

import Foundation
import MapKit

struct SearchResult: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let adress: String
    let cityName: String
    let country: String
    let coordiantes: CLLocationCoordinate2D
    let link: String

    static func == (lhs: SearchResult, rhs: SearchResult) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
