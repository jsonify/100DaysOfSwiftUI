//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Jason on 11/22/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ActivityView: View {
    @Binding var activity: Activity
    
    var body: some View {
        Text(activity.name)
    }
}

struct ActivityView_Previews: PreviewProvider {
    @State static var activites = Activity(name: "What", description: "Hell no")
    
    static var previews: some View {
        ActivityView(activity: $activites)
    }
}
