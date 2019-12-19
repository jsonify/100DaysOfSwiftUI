//
//  PostListViewModel.swift
//  FetchingWebAPI
//
//  Created by Jason on 12/10/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Combine
import SwiftUI
import Foundation

final class PostListViewModel: ObservableObject {
    
    init() {
        fetchPosts()
    }
    
    var posts = [Post]() {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchPosts() {
        Webservice().getAllPosts {
            self.posts = $0
        }
    }
    
    let didChange = PassthroughSubject<PostListViewModel, Never>()
}
