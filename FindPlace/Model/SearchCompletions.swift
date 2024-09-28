//
//  SearchCompletions.swift
//  InfoGuide
//
//  Created by BearyCode on 07.09.24.
//

import Foundation
import MapKit

struct SearchCompletions: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    var url: URL?
}
