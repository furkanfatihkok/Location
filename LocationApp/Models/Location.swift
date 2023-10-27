//
//  Location.swift
//  SwiftfullMap
//
//  Created by FFK on 25.09.2023.
//

import Foundation
import MapKit

struct Location : Identifiable , Equatable{
    
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    
    var id : String {
        // name : "Colosseum"
        // cityName : "Rome"
        // id : "ColosseumRome"
        
        name + cityName
    }
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}
