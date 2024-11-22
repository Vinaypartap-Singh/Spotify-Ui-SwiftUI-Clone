//
//  PlaylistHeaderCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-22.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height: CGFloat = 300
    var title: String = "Title Here"
    var subTitle: String? = "Subtitle Here"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle().opacity(0).overlay(
            ImageLoaderView(urlString: imageName)
        )
       .overlay(
            VStack (alignment: .leading, spacing: 8) {
                Text(subTitle ?? "Subtitle").font(.headline)
                Text(title).font(.largeTitle).fontWeight(.bold)
            }.foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)),
            alignment: .bottomLeading
       ).asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderCell()
        }.ignoresSafeArea()
    }
    
}
