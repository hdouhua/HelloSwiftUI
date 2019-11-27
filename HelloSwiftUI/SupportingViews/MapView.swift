//
//  MapView.swift
//  HelloSwiftUI
//
//  Created by Dao on 2019/10/22.
//  Copyright © 2019 Fortune. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context _: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context _: UIViewRepresentableContext<MapView>) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

#if DEBUG
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView(coordinate: CLLocationCoordinate2D(latitude: 1.2742783, longitude: 103.7891809))
        }
    }
#endif
