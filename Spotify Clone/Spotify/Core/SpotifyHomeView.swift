//
//  SpotifyHomeView.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-21.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User?  = nil
    @State private var selectedCategory: Category? =  nil
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack (spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        
                        VStack {
                            recentSection
                            
                            if let firstProduct = products.first {
                                VStack {
                                    newReleaseSection(firstProduct: firstProduct)
                                }.padding(.top, 20)
                                
                            }
                            
                            
                        }.padding()
                        
                        
                        ForEach(0..<20) { _ in
                            Rectangle().frame(width: 200, height: 200)
                        }
                    } header: {
                        header
                    }
                }.padding(.top, 8)
            }.scrollIndicators(.hidden).clipped()
        }.task {
            await getData()
        }.toolbarVisibility(.hidden)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            
        }
    }
    
    
    private var header: some View {
        HStack (spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image).frame(width: 30, height: 30).background(.spotifyWhite).clipShape(.circle).onTapGesture {
                        
                    }
                }
            }.frame(width: 30, height: 30)
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory).onTapGesture {
                            selectedCategory = category
                        }
                    }
                }.padding(.horizontal, 16)
            }.scrollIndicators(.hidden)
        }.padding(.vertical, 24).padding(.leading, 8).background(.spotifyBlack)
    }
    
    
    private var recentSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, items: products) {
            product in
            if let product {
                SpotifyRecentCell(ImageName: product.firstImage, title: product.title)
            }
        }
    }
    
    
    private func newReleaseSection(firstProduct: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: firstProduct.firstImage,
            headline: firstProduct.brand,
            subheading: firstProduct.category,
            title: firstProduct.title,
            subTitle: firstProduct.description) {
                
            } onPlayPressed: {
                
            }
    }
}

#Preview {
    SpotifyHomeView()
}
