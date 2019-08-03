//
//  EventsListCellViewModelViewModel.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 11/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

protocol EventsListCellViewModelProtocol: AnyObject {
    var eventTitle: String { get }
}

class EventsListCellViewModel {
    private let event: Event
    
    init(model: Event) {
        event = model
    }
}

extension EventsListCellViewModel: EventsListCellViewModelProtocol {
    var eventTitle: String {
        return event.title
    }
}
