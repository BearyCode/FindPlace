//
//  LocationService.swift
//  InfoGuide
//
//  Created by BearyCode on 07.09.24.
//

import Foundation
import MapKit

@Observable
class LocationService: NSObject, MKLocalSearchCompleterDelegate {
    private let completer: MKLocalSearchCompleter

    var completions = [SearchCompletions]()

    init(completer: MKLocalSearchCompleter) {
        self.completer = completer
        super.init()
        self.completer.delegate = self
    }

    func update(queryFragment: String) {
        completer.resultTypes = .pointOfInterest
        completer.queryFragment = queryFragment
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        completions = completer.results.map { completion in
            let mapItem = completion.value(forKey: "_mapItem") as? MKMapItem
            
            return .init(title: completion.title,
                         subTitle: completion.subtitle,
                         url: mapItem?.url)
        }
    }
    
    func search(with query: String, coordinate: CLLocationCoordinate2D? = nil) async throws -> [SearchResult] {
            let mapKitRequest = MKLocalSearch.Request()
            mapKitRequest.naturalLanguageQuery = query
            mapKitRequest.resultTypes = .pointOfInterest
            if let coordinate {
                mapKitRequest.region = .init(.init(origin: .init(coordinate),
                                                   size: .init(width: 1,
                                                               height: 1)))
            }
            let search = MKLocalSearch(request: mapKitRequest)

            let response = try await search.start()

            return response.mapItems.compactMap { mapItem in
                
                let name = mapItem.placemark.name ?? ""
                let adress = mapItem.placemark.title ?? ""
                let cityName = mapItem.placemark.locality ?? ""
                let country = mapItem.placemark.country ?? ""
                let coordinates = mapItem.placemark.location?.coordinate ?? CLLocationCoordinate2D()
                let link = mapItem.url?.absoluteString ?? ""

                return SearchResult(name: name,
                                    adress: adress,
                                    cityName: cityName,
                                    country: country,
                                    coordiantes: coordinates,
                                    link: link)
            }
        }
}
