//
//  BreweryDetail.swift
//  Assignment3
//
//  Created by Taylor Heyen on 3/26/23.
//

import SwiftUI
import MapKit

struct BreweryDetail: View {
    
    var brewery: BreweryResults
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(brewery.name)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                Text(brewery.websiteUrl ?? "Brewery Website")
                    .font(.system(size: 15))
                    .padding(.horizontal)
                AddressView(address1: brewery.address1,
                            address2: brewery.address2,
                            city: brewery.city,
                            state: brewery.state,
                            postalCode: brewery.postalCode)
                .padding(.horizontal)
                if let latitude = brewery.latitude, let longitude = brewery.longitude,
                   let lat = Double(latitude), let long = Double(longitude) {
                    MapView(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
                        .frame(height: 500)
                        .padding(.horizontal)
                } else {
                    Text("Map data unavailable")
                        .frame(height: 300)
                        .padding(.horizontal)
                }
            }
        }
    }
}

