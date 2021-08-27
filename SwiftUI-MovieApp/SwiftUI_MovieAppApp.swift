//
//  SwiftUI_MovieAppApp.swift
//  SwiftUI-MovieApp
//
//  Created by Arpit Dixit on 28/08/21.
//

import SwiftUI

@main
struct SwiftUI_MovieAppApp: App {
    
    @StateObject var store = MovieStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
