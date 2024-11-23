//
//  NetflixHeroCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-22.
//

import SwiftUI
import SwiftfulUI

struct NetflixHeroCell: View {
    
    var imageName: String = Constants.randomImage
    var isNetflixFilm: Bool = true
    var title:String = "Players"
    var categories: [String] = ["Romantic", "Comedy"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            VStack(spacing: 16) {
                VStack( alignment: .center, spacing: 0) {
                    if isNetflixFilm {
                        HStack(spacing: 0) {
                            Text("N").foregroundStyle(.netflixDarkRed)
                                .font(.largeTitle)
                                .fontWeight(.black)
                            
                            Text("Film")
                                .kerning(3)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.netflixLightGray)
                        }
                    }
                    
                    Text(title).font(.system(size: 50, weight: .medium, design: .serif)).multilineTextAlignment(.center)
                }
                
                HStack(spacing: 8)  {
                    ForEach(categories, id: \.self) { category in
                            Text(category)
                            .font(.callout)
                        
                        if category != categories.last {
                            Circle().frame(width: 4, height: 4)
                        }
                    }
                }
                
                HStack {
                    HStack(spacing: 16) {
                        Image(systemName: "play.fill")
                        Text("Play")
                    }.frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundStyle(.netflixBlack)
                        .background(.netflixWhite)
                        .cornerRadius(4)
                        .asButton(.press) {
                            onPlayPressed?()
                        }
                    
                    
                    HStack(spacing: 16) {
                        Image(systemName: "plus")
                        Text("My List")
                    }.frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundStyle(.netflixWhite)
                        .background(.netflixDarkGray)
                        .cornerRadius(4)
                        .asButton(.press) {
                            onMyListPressed?()
                        }
                }.font(.callout)
                
             
                
                
                
            }.foregroundStyle(.white)
                .padding(24)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.netflixBlack.opacity(0), .netflixBlack.opacity(0.4), .netflixBlack.opacity(0.4), .netflixBlack.opacity(0.4), .netflixBlack.opacity(0.4), .netflixBlack.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                )
        }
        .cornerRadius(10)
        .aspectRatio(0.8, contentMode: .fit)
        .asButton(.tap) {
            onBackgroundPressed?()
        }
    }
}

#Preview {
    NetflixHeroCell().padding(40)
}
