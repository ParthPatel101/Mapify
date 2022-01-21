//
//  LocationsView.swift
//  Mapify
//
//  Created by Parth Patel on 1/19/22.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewsModel
    @State var showingMapView = true
    
    
    var body: some View {
        ZStack {
            TabView {
                if showingMapView {
                    map
                        .badge(5)
                    .tabItem() {
                            Button {
                                
                            } label: {
                                Image(systemName: "map")
                            }

                            }
                }
                else {
                    LocationsListView(viewModel: _viewModel)
                        .padding(.top, 30)
                        .badge(5)
                        .tabItem() {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "list.dash")
                                }

                                }
                }
            }
                
                VStack {
                    Picker(selection: $showingMapView, label: Text("Picker")) {
                        Text("Map View").tag(true)
                        Text("List View").tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                    Spacer()
                    }
                
            
            
            }
        }
        
    }

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewsModel())
    }
}

extension LocationsView {
    private var map: some View {
        ZStack {
            
            mapView.ignoresSafeArea()
            VStack (spacing: 0){
                
                header.padding()
                    .padding()
                Spacer()
                previewLocations
            }
        }
    }
    private var mapView: some View {
        Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                VStack {
                    ZStack {
                        LocationMapAnnotationView()
                        Image(location.imageNames[0])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .font(.headline)
                            .cornerRadius(30)
                            .padding(-5)
                            .offset(y: -42)
                    }
                }
                .shadow(radius: 10)
                .scaleEffect(viewModel.mapLocation == location ? 1 : 0.7)
                .onTapGesture {
                    viewModel.showNextLocation(location: location)
                }
            }
        })
    }
    private var header: some View {
        VStack {
            Text(viewModel.mapLocation.name)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.thickMaterial)
                        .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        }
        .padding(.top)
    }
    
    private var previewLocations: some View {
        ZStack {
            ForEach (viewModel.locations) { location in
                if location == viewModel.mapLocation {
                    LocationPreviewView(location: viewModel.mapLocation)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
