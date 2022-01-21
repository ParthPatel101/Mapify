//
//  LocationPreviewView.swift
//  Mapify
//
//  Created by Parth Patel on 1/20/22.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var viewModel: LocationsViewsModel
    let location: Location
    var body: some View {
        HStack (alignment: .bottom){
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                textSection
            }
            VStack (spacing: 8) {
               learnMoreButton
                nextButton
                
            }
        } .padding(20)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y: 65)
            }
            .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!).padding()
        }.environmentObject(LocationsViewsModel())
    }
}

extension LocationPreviewView{
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames[1] {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var textSection: some View {
        VStack (alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    private var learnMoreButton: some View {
        Button {
            
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
        } .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonPress()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        } .buttonStyle(.bordered)

    }
}
