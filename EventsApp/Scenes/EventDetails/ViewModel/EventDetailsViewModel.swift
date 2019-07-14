//
//  EventDetailsViewModel.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 13/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

protocol EventDetailsViewModelProtocol: AnyObject {
    var eventDescription: String { get }
    var navigationTitle: String { get }
    var eventImageUrl: URL { get }
    
    func checkin()
    func share()
    func maps()
}

class EventDetailsViewModel {
    private var service: EventDetailsServiceProtocol
    private let event: Event
    
    init(event: Event, service: EventDetailsServiceProtocol = EventDetailsService()) {
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
        let checkinObject = CheckinObject(eventId: <#T##String#>, name: <#T##String#>, email: <#T##String#>)
    }
    
    func share() {
        
    }
    
    func maps() {
        
    }
}
