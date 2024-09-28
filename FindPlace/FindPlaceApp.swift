//
//  FindPlaceApp.swift
//  FindPlace
//
//  Created by BearyCode on 24.09.24.
//

import SwiftUI

@main
struct FindPlaceApp: App {
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
