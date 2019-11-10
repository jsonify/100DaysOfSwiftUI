//
//  AstronautView.swift
//  Moonshot
//
//  Created by Jason on 11/9/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView(.vertical) {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
//                    Challenge 2
                    List {
                        Section(header: Text("Missions")) {
                            ForEach(self.missions) { mission in
                                Text(mission.displayName)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut, mission: [Mission]) {
        self.astronaut = astronaut
        
        self.missions = mission.filter({ mission in
            mission.crew.contains(where: {
                $0.name == astronaut.id
            })
        })
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], mission: missions)
    }
}
