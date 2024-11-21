//
//  SpotifyCategoryCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-21.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String =  "Music"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title).font(.callout).frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .clipShape(.capsule)
    }
}

extension View {
    func themeColors (isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "All")
            SpotifyCategoryCell(title: "Podcasts", isSelected: true)
            SpotifyCategoryCell(title: "All", isSelected: true)
        }
        
    }
}
