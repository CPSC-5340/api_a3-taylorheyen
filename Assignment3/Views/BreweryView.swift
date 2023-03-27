//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct BreweryView: View {
    
    @ObservedObject var breweryvm = BreweryViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(breweryvm.breweryData, id: \.name) { brewery in
                    NavigationLink {
                        BreweryDetail(brewery: brewery)
                    } label: {
                        Text(brewery.name)
                    }
                }
                }
            .onAppear {
                breweryvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("California Brews")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BreweryView()
    }
}
