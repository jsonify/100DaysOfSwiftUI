//
//  SchoolView.swift
//  CoreDataProject
//
//  Created by Jason on 12/6/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct SchoolView: View {
    struct SchoolInfo {
        let phone: String
        let url: String
    }
    
//    let school: School
//    let schools: [School]
    let schoolInfo: [SchoolInfo]
    
    var body: some View {
        List {
            ForEach(self.schoolInfo, id: \.phone) { school in
                Text(school.phone)
            }
        }
    }
}

//struct SchoolView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchoolView(schoolInfo: SchoolInfo)
//    }
//}

struct Address {
    let street: String
    let city: String
    let zip: String
}
