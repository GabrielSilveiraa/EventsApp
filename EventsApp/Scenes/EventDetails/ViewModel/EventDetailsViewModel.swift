//
//  EventDetailsViewModel.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 13/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

protocol EventDetailsViewModelProtocol: AnyObject {
}

class EventDetailsViewModel {
    private var service: EventDetailsServiceProtocol

    init(service: EventDetailsServiceProtocol) {
        self.service = service
    }
}

extension EventDetailsViewModel: EventDetailsViewModelProtocol {}
