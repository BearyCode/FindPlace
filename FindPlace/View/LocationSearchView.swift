//
//  LocationSearchView.swift
//  InfoGuide
//
//  Created by BearyCode on 07.09.24.
//

import SwiftUI
import MapKit

struct LocationSearchView: View {
    @State private var locationService = LocationService(completer: .init())
    @State private var detent: PresentationDetent = .large
    @State private var searchText = ""
    @Binding var searchResults: [SearchResult]
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search location", text: $searchText)
                    .autocorrectionDisabled()
            }
            .padding(12)
            .background(.ultraThinMaterial)
            .foregroundStyle(Color.primary)
            .cornerRadius(10)
            
            if !searchText.isEmpty {
                List {
                    ForEach(locationService.completions) { completion in
                        Button(action: {didTapOnCompletion(completion)}) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(completion.title)
                                    .font(.headline)
                                    .fontDesign(.rounded)
                                
                                Text(completion.subTitle)
                                
                                if let url = completion.url {
                                    Link(url.absoluteString, destination: url)
                                        .lineLimit(1)
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
            }
        }
        .padding()
        .presentationDetents([detent])
        .presentationBackground(.regularMaterial)
        .onChange(of: searchText) {
            locationService.update(queryFragment: searchText)
        }
    }
    
    private func didTapOnCompletion(_ completion: SearchCompletions) {
        Task {
            if let singleLocation = try? await locationService.search(with: "\(completion.title) \(completion.subTitle)").first {
                searchResults = [singleLocation]
            }
        }
    }
    
}

//#Preview {
//    LocationSearchView(searchResults: <#Binding<[SearchResult]>#>)
//}
