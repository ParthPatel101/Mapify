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
                    viewModel.sheetLocation = location
                } label: {
                    HStack {
                        Image(location.imageNames.first!)
                            .resizable()
                            .scaledToFit()
                            .frame(width:100, height: 100)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        Text(location.name)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
        .listStyle(.plain)
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
