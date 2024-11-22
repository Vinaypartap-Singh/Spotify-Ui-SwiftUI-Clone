//
//  SpotifyPlaylist.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-22.
//

import SwiftUI
import SwiftfulUI

struct SpotifyPlaylist: View {
    
    
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack (spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subTitle: product.brand,
                        imageName: product.thumbnail
                    ).readingFrame { frame in
                        showHeader = frame.maxY < 150 ? true : false
                        
                    }
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName + " " + user.lastName,
                        subHeadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil
                    )
                    
                    ForEach(products) { product in
                        SongRowCell(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPressed: {
                                
                            },
                            onEllipsisPressed: {
                                
                            }
                        )
                    }
                    
                }
            }.scrollIndicators(.hidden)
            
            ZStack {
                Text(product.title).font(.headline).foregroundStyle(.spotifyWhite)
                    .padding(.vertical, 16).frame(maxWidth: .infinity).background(Color.spotifyBlack)
                    .offset(y: showHeader ? 0 : -40)
                    .opacity(showHeader ? 1 : 0)
                
                Image(systemName: "chevron.left")
                    .padding(10)
                    .background(showHeader ? Color.black.opacity(0.001) :Color.spotifyGray.opacity(0.7))
                    .clipShape(.circle)
                    .onTapGesture {
                    
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.2), value: showHeader)
            
            .frame(maxHeight: .infinity, alignment: .top)
            
        }.task {
            await getData()
        }.toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            products = try await Array(DatabaseHelper().getProducts())
        } catch {
            
        }
    }
    
    
}

#Preview {
    SpotifyPlaylist()
}
