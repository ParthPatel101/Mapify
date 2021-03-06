//
//  Location.swift
//  Mapify
//
//  Created by Parth Patel on 1/19/22.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let name: String
    var cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    var id: String {
        name  + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}
