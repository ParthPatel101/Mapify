//
//  LocationMapAnnotationView.swift
//  Mapify
//
//  Created by Parth Patel on 1/20/22.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    @EnvironmentObject var viewModel: LocationsViewsModel
    let accentColor = Color("AccentColor-1")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "circle.dotted")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 20, height: 20)
                .scaleEffect(3)
                .padding(.bottom, 25)
                
                
                Image(systemName: "pencil.tip")
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(accentColor)
                .frame(width: 20, height: 20)
                .scaleEffect(2)
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
            .environmentObject(LocationsViewsModel())
    }
}
