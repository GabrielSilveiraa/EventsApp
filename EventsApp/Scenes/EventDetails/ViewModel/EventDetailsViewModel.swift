//
//  EventDetailsViewModel.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 13/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation
import CoreLocation

protocol EventDetailsViewModelProtocol: AnyObject {
    var eventDescription: String { get }
    var navigationTitle: String { get }
    var eventImageUrl: URL { get }
    var error: Dynamic<String?> { get }
    var successCheckin: Dynamic<String?> { get }
    
    func checkin()
    func share()
    func maps()
}

class EventDetailsViewModel {
    private var service: EventDetailsServiceProtocol
    private weak var navigationDelegate: EventsListNavigationDelegate?
    private let event: Event
    var error: Dynamic<String?> = Dynamic(nil)
    var successCheckin: Dynamic<String?> = Dynamic(nil)
    
    init(event: Event,
         service: EventDetailsServiceProtocol = EventDetailsService(),
         navigationDelegate: EventsListNavigationDelegate? = nil) {
        self.navigationDelegate = navigationDelegate
        self.service = service
        self.event = event
    }
}

extension EventDetailsViewModel: EventDetailsViewModelProtocol {
    var eventDescription: String {
        return event.description
    }
    var navigationTitle: String {
        return event.title
    }
    var eventImageUrl: URL {
        return event.image
    }
    
    func checkin() {
        //I could have asked the user's informations here
        let name = "Gabriel"
        let email = "gabriel@gmail.com"
        let checkinObject = CheckinObject(eventId: event.id,
                                          name: name,
                                          email: email)
        service.checkin(checkinObject: checkinObject) { result in
            switch result {
            case .success:
                self.successCheckin.value = "checkinSuccessMessage".localized
            
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
    
    func share() {
        let itens = [event.title, event.description]
        navigationDelegate?.share(itens)
    }
    
    func maps() {
        let coordinate = CLLocationCoordinate2D(latitude: event.latitude.asDouble,
                                                longitude: event.longitude.asDouble)
        Maps.openMaps(coordinate: coordinate, placeName: event.title)
    }
}
