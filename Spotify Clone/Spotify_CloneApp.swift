//
//  Spotify_CloneApp.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-21.
//

import SwiftUI
import SwiftfulRouting

@main
struct Spotify_CloneApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
            
        }
    }
}
