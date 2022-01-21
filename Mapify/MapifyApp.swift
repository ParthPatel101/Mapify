//
//  MapifyApp.swift
//  Mapify
//
//  Created by Parth Patel on 1/19/22.
//

import SwiftUI

 @main
struct MapifyApp: App {
    
    @StateObject private var viewModel = LocationsViewsModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
