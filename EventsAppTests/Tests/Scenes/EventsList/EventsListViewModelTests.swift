//
//  EventsListViewModelTests.swift
//  EventsAppTests
//
//  Created by Gabriel Silveira on 14/06/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//
// swiftlint:disable force_unwrapping

import XCTest
@testable import EventsApp

class EventsListViewModelTests: XCTestCase {
    var eventsListService: MockEventsListService!
    var fakeEventsListCoordinator: FakeEventsListCoordinator!
    
    override func setUp() {
        super.setUp()
        let eventsMock: [Event] = loadJson(filename: "EventsSuccess")!
        eventsListService = MockEventsListService(mock: eventsMock)
    }

    override func tearDown() {
        super.tearDown()
        eventsListService = nil
    }
    
    func testGetEventsSuccess() {
        let eventsListViewModel = EventsListViewModel(service: eventsListService)
        XCTAssertTrue(eventsListService.getEventsCalled)
        XCTAssertEqual(eventsListViewModel.eventCells.value.count, 5)
        XCTAssertEqual(eventsListViewModel.eventCells.value[0].eventTitle, "Feira de adoção de animais na Redenção")
    }
    
    func testGetEventsError() {
        eventsListService.getEventsShouldReturnError = true
        let eventsListViewModel = EventsListViewModel(service: eventsListService)
        XCTAssertTrue(eventsListService.getEventsCalled)
        XCTAssertEqual(eventsListViewModel.error.value, "FakeError")
    }
    
    func testDidSelectEvent() {
        let mockedEvents: [Event] = loadJson(filename: "EventsSuccess")!
        fakeEventsListCoordinator = FakeEventsListCoordinator()
        let eventsListViewModel = EventsListViewModel(service: eventsListService,
                                                        navigationDelegate: fakeEventsListCoordinator)
        eventsListViewModel.didSelect(row: 0)
        XCTAssertTrue(fakeEventsListCoordinator.eventDetailsCalled)
        XCTAssertEqual(fakeEventsListCoordinator.selectedEvent, mockedEvents[0])
    }
}

class MockEventsListService: EventsListServiceProtocol {
    var getEventsShouldReturnError = false
    private(set) var getEventsCalled = false
    private let events: [Event]
    
    init(mock events: [Event]) {
        self.events = events
    }
    
    func getEventsList(completion: @escaping (Result<[Event], Error>) -> Void) {
        getEventsCalled = true
        if !getEventsShouldReturnError {
            completion(.success(events))
        } else {
            completion(.failure(FakeError.whatever))
        }
    }
}

class FakeEventsListCoordinator: EventsListNavigationDelegate {
    var eventDetailsCalled = false
    var selectedEvent: Event?
    
    func goToDetails(event: Event) {
        eventDetailsCalled = true
        selectedEvent = event
    }
}
