//
//  NetflixHomeView.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-22.
//

import SwiftUI
import SwiftfulUI

struct NetflixHomeView: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    @State private var fullHeaderSize: CGSize = .zero
    @State private var heroProduct:Product? = nil
    @State private var scrollViewOffset: CGFloat = 0
    
    @State private var currentUser: User?  = nil
    @State private var selectedCategory: Category? =  nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollViewWithOnScrollChanged(
                .vertical,
                showsIndicators: false,
                content: {
                    VStack(spacing: 16) {
                        Rectangle().opacity(0).frame(height: fullHeaderSize.height)
                        
                        if let heroProduct {
                            heroCell(heroProduct: heroProduct)
                        }
                        
                        Text("\(scrollViewOffset)")
                        
                        categoryRows
                    }
                },
                onScrollChanged: { offset in
                    scrollViewOffset = offset.y
                    
                }
            )
            
            VStack (spacing: 0) {
               
                header.padding(.horizontal, 16)
                
                
                if scrollViewOffset > -35 {
                    NetflixFilterBarView(
                        filters: filters,
                        selectedFilter: selectedFilter,
                        onFilterPressed: { newFilter in
                            selectedFilter = newFilter
                        },
                        onXMarkPressed: {
                            selectedFilter = nil
                        }
                    ).padding(.top, 16)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
            .padding(.bottom, 8)
            .background(
                ZStack {
                    if scrollViewOffset < -70 {
                        Rectangle().fill(Color.black.opacity(0.8)).background(.ultraThinMaterial).ignoresSafeArea()
                    }
                }
            )
                .animation(.smooth, value: scrollViewOffset)
                .readingFrame { frame in
                    if fullHeaderSize == .zero {
                        fullHeaderSize = frame.size
                    }
                }
        }.foregroundStyle(.netflixWhite)
            .task {
                await getData()
            }.toolbar(.hidden, for: .navigationBar)
    }
    
    
    private func getData() async {
        
        
        guard productRows.isEmpty else { return }
        
        
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let products = try await DatabaseHelper().getProducts()
            heroProduct = products.first
            
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
    
    public func heroCell(heroProduct: Product) -> some View {
        NetflixHeroCell(
            imageName: heroProduct.firstImage,
            isNetflixFilm: true,
            title: heroProduct.title,
            categories: [heroProduct.category.capitalized],
            onBackgroundPressed: {
                
            },
            onPlayPressed: {
                
            },
            onMyListPressed: {
                
            }
        )
    }
    
    
    
    private var header: some View {
        HStack (spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
            
            HStack (spacing: 16) {
                Image(systemName: "tv.badge.wifi").onTapGesture {
                    
                }
                Image(systemName: "magnifyingglass").onTapGesture {
                    
                }
                
            }
        }
    }
    
    
    public var categoryRows: some View {
        LazyVStack (alignment: .leading, spacing: 16) {
            ForEach(Array(productRows.enumerated()), id:\.offset) { (rowIndex, row) in
                VStack(alignment: .leading, spacing: 6) {
                    Text(row.title ?? "Title").font(.headline).foregroundStyle(.white)
                    
                    ScrollView(.horizontal){
                        LazyHStack {
                            ForEach(Array(row.products.enumerated()), id:\.offset) { (index, product) in
                                NetflixMovieCell(
                                    imageName: product.firstImage, title: product.title, isRecentlyAdded: product.recentlyAdded,
                                    topTenRanking: rowIndex == 0 ? (index + 1) : nil
                                )
                            }
                        }
                    }.scrollIndicators(.hidden)
                }
                
            }
        }
    }
}

#Preview {
    NetflixHomeView()
}
