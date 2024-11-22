//
//  PlaylistDescriptionCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-22.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    
    var descriptionText: String = Product.mock.description
    var userName: String = "Vinay"
    var subHeadline: String = "Some Headline Goes Here"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .foregroundStyle(.spotifyWhite)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            Text(subHeadline)
            
            buttonRow
            
        }.font(.callout).fontWeight(.medium).foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo").font(.title3)
                .foregroundStyle(.spotifyGreen)
            Text("Made for ")
            +
            Text(userName).bold().foregroundStyle(.spotifyWhite)
        }.font(.callout).fontWeight(.medium).foregroundStyle(.spotifyLightGray)
    }
    
    
    private var buttonRow: some View {
        HStack (spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle").padding(8).background(Color.black.opacity(0.001)).onTapGesture {
                    
                }
                
                Image(systemName: "arrow.down.circle").padding(8).background(Color.black.opacity(0.001)).onTapGesture {
                    
                }
                
                
                Image(systemName: "square.and.arrow.up").padding(8).background(Color.black.opacity(0.001)).onTapGesture {
                    
                }
                
                
                Image(systemName: "ellipsis").padding(8).background(Color.black.opacity(0.001)).onTapGesture {
                    
                }
            }.offset(x: -8).frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack(spacing: 8) {
                Image(systemName: "shuffle").padding(8).background(Color.black.opacity(0.001)).onTapGesture {
                    
                }
                
                Image(systemName: "play.circle.fill").font(.system(size: 35)).background(Color.black.opacity(0.001)).onTapGesture {
                    
                }
            }.foregroundStyle(.spotifyGreen)
            
            
        }
        .font(.title3)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        PlaylistDescriptionCell().padding()
    }
}
