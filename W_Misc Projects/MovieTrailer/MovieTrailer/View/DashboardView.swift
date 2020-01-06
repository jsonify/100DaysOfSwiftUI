//
//  DashboardView.swift
//  MovieTrailer
//
//  Created by Jason on 1/6/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Home")
            } .tag(0)
            HomeView()
                .tabItem {
                    Image(systemName: "video.fill")
                    Text("TV Shows")
                        .font(.headline)
            } .tag(1)
            HomeView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Movies")
            } .tag(2)
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Kids")
            } .tag(3)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
