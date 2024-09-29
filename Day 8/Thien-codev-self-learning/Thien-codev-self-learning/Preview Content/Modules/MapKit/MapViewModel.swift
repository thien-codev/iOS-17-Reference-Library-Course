//
//  MapViewModel.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 29/9/24.
//

import SwiftUI
import Observation
import MapKit

@Observable class MapViewModel {
    var cameraPos: MapCameraPosition
    
    init() {
        let cor = CLLocationCoordinate2D(latitude: 10.78248, longitude: 106.688)
        let region = MKCoordinateRegion(center: cor, latitudinalMeters: 10000, longitudinalMeters: 10000)
        self.cameraPos = MapCameraPosition.region(region)
    }
}
