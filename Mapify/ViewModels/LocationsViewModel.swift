//
//  LocationsViewModel.swift
//  Mapify
//
//  Created by Parth Patel on 1/19/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewsModel: ObservableObject {
    @Published var sheetLocation: Location? = nil
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    
    @Published var showList:Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func showLocationList() {
        withAnimation(.easeInOut) {
            showList.toggle()
        }
    }
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showList = false
        }
    }
    func nextButtonPress() {
        guard let current = locations.firstIndex(where: {$0 == mapLocation}) else {print("ERROR"); return}
        let next = current + 1
        guard locations.indices.contains(next) else {
            guard let first = locations.first else {return}
            showNextLocation(location: first)
            return
        }
        let nextLocation = locations[next]
        showNextLocation(location: nextLocation)
        
        
    }
}
