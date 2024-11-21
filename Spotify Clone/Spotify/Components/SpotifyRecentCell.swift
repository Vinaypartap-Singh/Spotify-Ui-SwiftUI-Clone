//
//  SpotifyRecentCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-21.
//

import SwiftUI

struct SpotifyRecentCell: View {
    
    var ImageName: String = Constants.randomImage
    var title: String = "Liked Songs"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: ImageName).frame(width: 55, height: 55).background(.spotifyDarkGray)
            Text(title).font(.system(size: 12)).fontWeight(.semibold).lineLimit(2)
        }.padding(.trailing, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .themeColors(isSelected: false).cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        
        VStack {
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
            
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
        }
    }
    
}
