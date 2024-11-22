//
//  SongRowCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-22.
//

import SwiftUI

struct SongRowCell: View {
    
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Some Song name goes here"
    var subtitle: String? = "Some Artist Name"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    
    var body: some View {
        HStack (spacing: 8) {
            ImageLoaderView(urlString: imageName).frame(width: imageSize, height: imageSize)
            VStack (alignment: .leading, spacing: 4) {
                Text(title).font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                    .lineLimit(2)
                
                if let subtitle {
                    Text(subtitle).font(.system(size: 12)).foregroundStyle(.spotifyLightGray).lineLimit(1)
                }
                
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .onTapGesture {
                     
                }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
        
    }

}
