//
//  LocationInfo.swift
//  Mapify
//
//  Created by Parth Patel on 1/21/22.
//

import SwiftUI
import MapKit
struct LocationInfoView: View {
    @EnvironmentObject private var viewModel: LocationsViewsModel
    let location: Location
    var body: some View {
        ScrollView {
            VStack {
                images
                    .shadow(color: Color.black.opacity(0.3), radius: 20, y: -10)
                VStack (alignment: .leading, spacing: 16) {
                    titlesection
                    Divider()
                    description
                    Divider()
                    mapSection
                }.padding()
            }
        }.ignoresSafeArea()
            .background(.ultraThinMaterial)
            .overlay(alignment: .topLeading) {backButton}
    }
}

struct LocationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        LocationInfoView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewsModel())
    }
}

extension LocationInfoView {
    private var images: some View {
        TabView  {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }.frame(height: 500)
            .tabViewStyle(PageTabViewStyle())
    }
    private var titlesection: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 8) {
                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(location.cityName)
                    .font(.title3)
                    .foregroundColor(Color.secondary)
            }
        } .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
    
    private var description: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 16) {
                Text(location.description)
                    .font(.subheadline)
                    .foregroundColor(Color.secondary)
                if let URL = URL(string: location.link) {
                    Link("Read More", destination: URL)
                        .font(.headline)
                }
            }
        } .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
    
    private var mapSection: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }
    
    private var backButton: some View {
        Button {
            viewModel.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(10)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
        
    }
}
