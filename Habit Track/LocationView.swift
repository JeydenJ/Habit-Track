//
//  LocationView.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 13/10/2023.
//

import SwiftUI
import MapKit

struct MapMarkerItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct LocationView: View {
    @Binding var selectedLocation: Location?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    @State private var annotationItems = [MapMarkerItem(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))]

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: annotationItems) { item in
            MapMarker(coordinate: item.coordinate, tint: .blue)
        }
        .onAppear {
            
        }
    }
}
// Returns A view of LocationView for previewing
struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(selectedLocation: .constant(Location(latitude: 37.7749, longitude: -122.4194)))
        
    }
}


