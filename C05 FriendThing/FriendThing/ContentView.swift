//
//  ContentView.swift
//  FriendThing
//
//  Created by Jason on 12/1/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CDUser.entity(), sortDescriptors: [], predicate: nil) var cdUsers: FetchedResults<CDUser>
    
    var body: some View {
        NavigationView {
            List(cdUsers, id: \.id) { (user: CDUser) in
            NavigationLink(destination: CDUserView(user: user)) {
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(user.isActive ? .green : .gray)
                    Text(user.wrappedName)
                        
                    }
                }
            }
            .navigationBarTitle("Friends")
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        //self.users = decodedResponse
                        for user in decodedResponse {
                            let cdUser = CDUser(context: self.moc)
                            cdUser.id = user.id
                            cdUser.name = user.name
                            cdUser.isActive = user.isActive
                            cdUser.email = user.email
                            cdUser.company = user.company
                            cdUser.address = user.address
                            cdUser.about = user.about
                            cdUser.age = Int16(user.age)
                        
                            do {
                                try self.moc.save()
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                    
                    // everything is good, so we can exit
                    return
                }
            }
            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
