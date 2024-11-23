//
//  NetflixFilterCell.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-22.
//

import SwiftUI

struct NetflixFilterCell: View {
    
    var title: String = "Categories"
    var isDropdown: Bool = true
    var isSelected: Bool = false
    
    
    var body: some View {
        HStack {
            Text(title).font(.system(size: 14, weight: .medium))
            
            if isDropdown {
                Image(systemName: "chevron.down").font(.system(size: 12))
            }
        }.padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                ZStack {
                    
                    Capsule(style: .circular).fill(.netflixDarkGray).opacity(isSelected ? 1: 0)
                    
                    Capsule(style: .circular).stroke(lineWidth: 1)
                }
            ).foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        VStack(spacing: 16) {
            NetflixFilterCell(isSelected: true)
            NetflixFilterCell()
            NetflixFilterCell()
            NetflixFilterCell()
        }
    }

}
