//
//  BackButton.swift
//  InfoGuide
//
//  Created by BearyCode on 12.09.24.
//

import SwiftUI

struct BackButton: View {
    var viewModel: LocationsViewModel
    var sheet: String
    
    var body: some View {
        Button {
            if sheet == "location" {
                viewModel.sheetLocation = nil
            } else {
                viewModel.showSearchSheet = false
            }
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(Color.primary)
                .background(.thickMaterial)
                .cornerRadius(30)
                .shadow(radius: 4)
                .padding()
        }
    }
}

#Preview {
//    let viewModel = LocationsViewModel()
//    BackButton(viewModel: viewModel,
//               sheet: "location")
}
