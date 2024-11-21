//
//  SpotifyNewReleaseCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-21.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New Release From"
    var subheading: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subTitle: String? = "Single - Track"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack (spacing: 16) {
            HStack (spacing: 8) {
                ImageLoaderView(urlString: imageName).frame(width: 50, height: 50).clipShape(Circle())
                
                VStack (alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline).foregroundStyle(.spotifyLightGray).font(.callout)
                    }
                    
                    if let subheading {
                        Text(subheading).font(.title2).fontWeight(.medium).foregroundStyle(.spotifyWhite)
                    }
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack {
                ImageLoaderView(urlString: imageName).frame(width: 150, height: 150).cornerRadius(5)
                
                VStack (alignment: .leading, spacing: 34) {
                    VStack (alignment: .leading, spacing: 4) {
                        if let title {
                            Text(title).foregroundStyle(.spotifyWhite).font(.system(size: 18)).fontWeight(.semibold)
                        }
                        
                        if let subTitle {
                            Text(subTitle).foregroundStyle(.spotifyLightGray).lineLimit(3).font(.system(size: 14))
                        }
                    }.font(.callout)
                    
                    HStack {
                        Image(systemName: "plus.circle").foregroundStyle(.spotifyLightGray).font(.title3)
                            .padding(4)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "play.circle.fill").foregroundStyle(.spotifyLightGray).font(.title3)
                    }
                }.padding()
            }.themeColors(isSelected: false).cornerRadius(8).onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell().padding()
    }

}
