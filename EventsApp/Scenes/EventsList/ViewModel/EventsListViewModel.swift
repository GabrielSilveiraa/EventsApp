//
//  EventsListViewModel.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 11/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

protocol EventsListViewModelProtocol: AnyObject {
    var eventCells: Dynamic<[EventsListCellViewModelProtocol]> { get }
    var loading: Dynamic<Bool> { get }
    var error: Dynamic<String?> { get }
    var navigationTitle: String { get }
    
    func didSelect(row: Int)
}

class EventsListViewModel {
    private let service: EventsListServiceProtocol
    private weak var navigationDelegate: EventsListNavigationDelegate?
    var eventCells: Dynamic<[EventsListCellViewModelProtocol]> = Dynamic([])
    var loading: Dynamic<Bool> = Dynamic(false)
    var error: Dynamic<String?> = Dynamic(nil)
    private var events: Events = []
    
    init(service: EventsListServiceProtocol = EventsListService(),
         navigationDelegate: EventsListNavigationDelegate? = nil) {
        self.service = service
        self.navigationDelegate = navigationDelegate
        loadEvents()
    }
    
    private func loadEvents() {
        loading.value = true
        service.getEventsList { (result: Result<Events, Error>) in
            self.loading.value = false
            switch result {
            case .success(let events):
                self.events = events
                self.eventCells.value = events.map { EventsListCellViewModel(model: $0) }
                
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
}

extension EventsListViewModel: EventsListViewModelProtocol {
    var navigationTitle: String {
        return "eventsListTitle".localized
    }
    
    func didSelect(row: Int) {
        let event = events[row]
        navigationDelegate?.goToDetails(event: event)
    }
}
