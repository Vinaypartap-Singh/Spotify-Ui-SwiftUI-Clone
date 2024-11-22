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
    @State private var productRows: [ProductRow] = []
    
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
                                
                                ForEach(productRows) { row in
                                    VStack {
                                        Text(row.title ?? "Title").font(.title3).fontWeight(.semibold).foregroundStyle(.spotifyWhite).frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .center))
                                        
                                        ScrollView(.horizontal) {
                                            HStack {
                                                ForEach(row.products) { product in
                                                    ImageTitleRowCell(imageSize: 140, imageName: product.firstImage, title: product.title).asButton(.press) {
                                                        
                                                    }
                                                }
                                            }.padding(.top, 8)
                                            
                                        }.scrollIndicators(.hidden)
                                    }.padding(.top, 20)
                                }
                                
                              
                                
                            }
                        }.padding()
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
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {
//                let products = self.products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand?.capitalized, products: products))
            }
            productRows =  rows
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
