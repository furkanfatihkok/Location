//
//  SwiftfullMapApp.swift
//  SwiftfullMap
//
//  Created by FFK on 25.09.2023.
//

import SwiftUI

@main
struct SwiftfullMapApp: App {
    
    @StateObject private var vm = LocationsViewModels()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
