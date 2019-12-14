//
//  MapView.swift
//  BucketList
//
//  Created by Jason on 12/13/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
