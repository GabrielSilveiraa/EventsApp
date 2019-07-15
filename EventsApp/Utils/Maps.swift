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
        if Maps.canApplicationOpenMaps() {
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name = placeName
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        } else {
            openMapsOnAppStore()
        }
    }
    
    class func canApplicationOpenMaps() -> Bool {
        if let url = URL(string: "itms://maps.apple.com/") {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    class func openMapsOnAppStore() {
        if let url = URL(string: "itms://itunes.apple.com/app/id915056765") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
