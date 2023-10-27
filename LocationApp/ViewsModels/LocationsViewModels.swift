//
//  LocationsViewModels.swift
//  SwiftfullMap
//
//  Created by FFK on 25.09.2023.
//

import Foundation
import MapKit

class LocationsViewModels : ObservableObject{
    
    // All loaded locations
    @Published var locations : [Location]
    
    // Current location on map
    @Published var mapLocations : Location {
        didSet {
            updateMapRegion(location: mapLocations)
        }
    }
    
    // Current region on map
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList : Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation : Location? = nil
    
    init() {
        let locations = LocationsDataServices.locations
        self.locations = locations
        self.mapLocations = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion (location : Location) {
        mapRegion = MKCoordinateRegion(
            center : location.coordinates,
            span: mapSpan
        )
    }
    
    func toggleLocationList() {
        showLocationsList = !showLocationsList
    }
    
    func showNextLocation(location : Location) {
        mapLocations = location
        showLocationsList = false
    }
    
    func nextButtonPressed() {
        
//        Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocations}) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
//       Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
//            Next index is NOT valid
//            Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
//        Next index IS valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
