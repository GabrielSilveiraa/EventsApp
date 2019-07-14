//
//  Maps.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 14/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import MapKit

class Maps {
    class func openMaps(coordinate: CLLocationCoordinate2D, placeName: String?) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = placeName
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
}
