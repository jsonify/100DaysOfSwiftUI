//
//  Application.swift
//  Moonshot
//
//  Created by Jason on 11/8/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct Application: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text("Astronaut Count: \(astronauts.count)")
    }
}

struct Application_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}
