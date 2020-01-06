//
//  HomeView.swift
//  MovieTrailer
//
//  Created by Jason on 1/6/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import Combine
import SwiftUI

struct HomeView: View {
    var categories: [String: [Movie]] {
        .init(grouping: moviesData,
              by: { $0.category.rawValue}
        )
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical , showsIndicators: false) {
                    VStack {
                        ForEach(categories.keys.sorted(), id: \.self) { key in
                            MovieRow(categoryName: key, movies: self.categories[key]!)
                                .frame(height: 320)
                                .padding(.top)
                                .padding(.bottom)
                        }
                    }
                    .padding()
                .navigationBarTitle(Text("MOVIES").bold())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
