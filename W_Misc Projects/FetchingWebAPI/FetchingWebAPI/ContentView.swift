//
//  ContentView.swift
//  FetchingWebAPI
//
//  Created by Jason on 12/10/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = PostListViewModel()
    
    var body: some View {
        List(model.posts, id: \.self) { post in
            Text(post.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
