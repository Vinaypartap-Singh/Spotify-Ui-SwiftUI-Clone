//
//  NetflixFilterBarView.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-22.
//

import SwiftUI


struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    
    static var mockArray: [FilterModel] {
        [
            FilterModel(title: "Tv Shows", isDropdown: false),
            FilterModel(title: "Movies", isDropdown: false),
            FilterModel(title: "Categories", isDropdown: true)
        ]
    }
}

struct NetflixFilterBarView: View {
    
    var filters: [FilterModel] = FilterModel.mockArray
    var selectedFilter: FilterModel? = nil
    var onFilterPressed: ((FilterModel) -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle().stroke(lineWidth: 1)
                        ).background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onXMarkPressed?()
                        }.transition(AnyTransition.move(edge: .leading)).padding(.leading, 16)
                }
                
                
                
                ForEach(filters, id: \.self) { filter in
                    
                    if selectedFilter == nil || selectedFilter == filter {
                        NetflixFilterCell(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        ).background(Color.black.opacity(0.001)).onTapGesture {
                            onFilterPressed?(filter)
                        }.padding(.leading, (selectedFilter == nil && filter == filters.first) ? 16 : 0)
                    }
                    
                   
                }
            }
        }.scrollIndicators(.hidden).foregroundStyle(.netflixWhite)
            .animation(.bouncy, value: selectedFilter)
    }
}


fileprivate struct NetflixFilterBarViewPreview: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        NetflixFilterBarView(
            filters: filters,
            selectedFilter: selectedFilter,
            onFilterPressed: { newFilter in
                selectedFilter = newFilter
            },
            onXMarkPressed: {
                selectedFilter = nil
            }
        )
    }
    
}



#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        VStack {
            NetflixFilterBarViewPreview()
        }
    }
  
}