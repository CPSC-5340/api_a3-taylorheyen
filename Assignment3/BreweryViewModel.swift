//
//  BreweryViewModel.swift
//  Assignment3
//
//  Created by Taylor Heyen on 3/26/23.
//

import Foundation

class BreweryViewModel: ObservableObject {
    @Published private(set) var breweryData = [BreweryResults]()
    private let url = "https://api.openbrewerydb.org/breweries?by_state=california&by_type=micro&per_page=200"
    
    func fetchData() {
        if let url = URL(string: self.url) {
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("Error fetching data: \(error)")
                    } else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode([BreweryResults].self, from: data)
                                DispatchQueue.main.async {
                                    self.breweryData = results
                                }
                                print("Fetched data: \(results)") // Add this print statement
                            } catch {
                                print("Error decoding data: \(error)")
                            }
                        }
                    }
                }.resume()
        }
    }
}
