//
//  NetflixMovieCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-22.
//

import SwiftUI

struct NetflixMovieCell: View {
    
    var width:CGFloat = 90
    var height: CGFloat = 130
    var imageName: String = Constants.randomImage
    var title: String? = "Movie Title"
    var isRecentlyAdded: Bool = true
    var topTenRanking: Int? = nil
    
    
    var body: some View {
        
        HStack (alignment: .bottom, spacing: -10) {
            if let topTenRanking {
                Text("\(topTenRanking)").font(.system(size: 100, weight: .medium, design: .serif)).foregroundStyle(.white).offset(y: 18)
            }
    
            ZStack (alignment: .bottom) {
                ImageLoaderView(urlString: imageName)
                
                VStack(spacing: 0) {
                    if let title, let firstWord = title.components(separatedBy: " ").first {
                        Text(firstWord).font(.subheadline).fontWeight(.medium).lineLimit(1)
                    }
                    
                    
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .padding(.bottom, 2)
                        .frame(maxWidth: .infinity)
                        .background(.netflixRed1)
                        .foregroundColor(.white)
                        .cornerRadius(2)
                        .offset(y: 2)
                        .lineLimit(1).font(.caption2).fontWeight(.bold).minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                }
                .background(
                    LinearGradient(
                        colors: [
                            .netflixBlack.opacity(
                                0
                            ),
                            .netflixBlack.opacity(
                                0.3
                            ),
                            .netflixBlack.opacity(
                                0.3),
                            .netflixBlack.opacity(
                                0.4
                            )
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .cornerRadius(4)
            .frame(width: width, height: height)
        }.foregroundStyle(.white)

    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            NetflixMovieCell()
            
            NetflixMovieCell(isRecentlyAdded: false)
            
            NetflixMovieCell(isRecentlyAdded: false)
            
            
            NetflixMovieCell(isRecentlyAdded: false)
            
            NetflixMovieCell(isRecentlyAdded: false, topTenRanking: 8)
            
        }

        
    }
}
