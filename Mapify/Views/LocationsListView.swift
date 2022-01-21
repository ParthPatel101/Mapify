//
//  LocationsListView.swift
//  Mapify
//
//  Created by Parth Patel on 1/19/22.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject var viewModel: LocationsViewsModel
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.showNextLocation(location: location )
                } label: {
                    listRowView(location: location)
                        .padding(.vertical, 4)
                        .listRowBackground(Color.clear)
                }

                
            }
        } .listStyle(.plain)
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewsModel())
    }
}
extension LocationsListView {
    
      func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack (alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            } .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
