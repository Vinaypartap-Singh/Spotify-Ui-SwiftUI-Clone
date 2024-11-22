//
//  ContentView.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-21.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        TabView {
            SpotifyHomeView() .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            SearchView().tabItem {
                                Label("Search", systemImage: "magnifyingglass")
                            }
                        
            LibraryView().tabItem {
                                Label("Library", systemImage: "books.vertical.fill")
                            }
            PremiumView().tabItem {
                Label("Premium", systemImage: "star.fill")
            }
        }
        .accentColor(.spotifyGreen) // Highlight color for selected tab
        .background(Color.spotifyBlack.ignoresSafeArea())
        .preferredColorScheme(.dark) // Force dark mode for this view
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
