//
//  ImageTitleRowCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-21.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Iphone X"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(urlString: imageName).frame(width: imageSize, height: imageSize).background(.spotifyDarkGray).cornerRadius(5)
            Text(title).font(.system(size: 12)).fontWeight(.semibold).lineLimit(1).padding(4).foregroundStyle(.spotifyWhite)
        }.frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTitleRowCell()
    }
   
}
