//
//  LocationMapAnnotationView.swift
//  InfoGuide
//
//  Created by BearyCode on 06.09.24.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,
                       height: 30)
                .font(.headline)
                .foregroundColor(Color.white)
                .padding(6)
                .background(Color.blue)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10,
                       height: 10)
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    LocationMapAnnotationView()
}
