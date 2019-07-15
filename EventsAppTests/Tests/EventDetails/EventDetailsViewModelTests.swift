//
//  EventDetailsViewModelTests.swift
//  EventsAppTests
//
//  Created by Gabriel Silveira on 14/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//
// swiftlint:disable force_unwrapping

import XCTest
@testable import EventsApp

class EventDetailsViewModelTests: XCTestCase {
    var eventDetailsViewModel: EventDetailsViewModelProtocol!
    var mockedService: MockEventDetailsService!
    var navigationCoordinator: FakeEventsListCoordinator!
    
    override func setUp() {
        super.setUp()
        let mockedEvent: Event = loadJson(filename: "Event")!
        mockedService = MockEventDetailsService()
        navigationCoordinator = FakeEventsListCoordinator()
        eventDetailsViewModel = EventDetailsViewModel(event: mockedEvent, service: mockedService, navigationDelegate: navigationCoordinator)
    }
    
    override func tearDown() {
        super.tearDown()
        eventDetailsViewModel = nil
    }
    
    func testEventDescription() {
        XCTAssertEqual(eventDetailsViewModel.eventDescription, "fake description")
    }
    
    func testEventDate() {
        XCTAssertEqual(eventDetailsViewModel.eventDate, "20/05/50636")
    }
    
    func testImagePlaceholderTitle() {
        XCTAssertEqual(eventDetailsViewModel.imagePlaceholderTitle,
                       "Unavailable image")
    }
    
    func testEventImageUrl() {
        XCTAssertEqual(eventDetailsViewModel.eventImageUrl,
                       URL(string: "http://fakeUrl.com"))
    }
    
    func testNavigationTitle() {
        XCTAssertEqual(eventDetailsViewModel.navigationTitle,
                       "Feira de adoção de animais na Redenção")
    }
    
    func testCheckin() {
        eventDetailsViewModel.checkin()
        XCTAssertTrue(mockedService.checkinCalled)
    }
    
    func testShare() {
        eventDetailsViewModel.share()
        XCTAssertTrue(navigationCoordinator.shareCalled)
    }
}

class MockEventDetailsService: EventDetailsServiceProtocol {
    private(set) var checkinCalled = false
    
    func checkin(checkinObject: CheckinObject, completion: @escaping (Result<Bool, Error>) -> Void) {
        checkinCalled = true
    }
}
