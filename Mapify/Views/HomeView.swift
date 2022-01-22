//
//  HomeView.swift
//  Mapify
//
//  Created by Parth Patel on 1/21/22.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewsModel
    var body: some View {
        NavigationView {
            NavigationLink("Open Map") {
                LocationsView()
                    .environmentObject(LocationsViewsModel())
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationsViewsModel())
    }
}
