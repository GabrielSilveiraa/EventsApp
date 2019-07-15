//
//  EventDetailsViewControllerTests.swift
//  EventsAppTests
//
//  Created by Gabriel Silveira on 14/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//
// swiftlint:disable force_cast
// swiftlint:disable force_unwrapping

import XCTest
@testable import EventsApp

class EventDetailsViewControllerTests: XCTestCase {
    var fakeEventDetailsViewModel: FakeEventDetailsViewModel!
    var eventsDetailsViewController: EventDetailsViewController!
    
    override func setUp() {
        super.setUp()
        fakeEventDetailsViewModel = FakeEventDetailsViewModel()
        eventsDetailsViewController = EventDetailsViewController(viewModel: fakeEventDetailsViewModel)
        _ = eventsDetailsViewController.view
    }
    
    func testBind() {
        XCTAssertTrue(fakeEventDetailsViewModel.error.isBinded())
        XCTAssertTrue(fakeEventDetailsViewModel.successCheckin.isBinded())
    }
    
    func testShowError() {
        UIApplication.shared.keyWindow?.rootViewController = eventsDetailsViewController
        fakeEventDetailsViewModel.error.value = "Error Test"
        XCTAssertTrue(UIApplication.shared.keyWindow?.rootViewController?.presentedViewController is UIAlertController)
        let alert = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController as! UIAlertController
        XCTAssertEqual(alert.message, "Error Test")
    }
    
    func testShowSuccessMessage() {
        UIApplication.shared.keyWindow?.rootViewController = eventsDetailsViewController
        fakeEventDetailsViewModel.successCheckin.value = "Success Test"
        XCTAssertTrue(UIApplication.shared.keyWindow?.rootViewController?.presentedViewController is UIAlertController)
        let alert = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController as! UIAlertController
        XCTAssertEqual(alert.message, "Success Test")
    }
    
    func testNavigationTitle() {
        XCTAssertEqual(eventsDetailsViewController.title, "Fake title")
    }
    
    func testEventDescriptionLabel() {
        let descriptionLabel = eventsDetailsViewController.baseView.descriptionLabel
        XCTAssertEqual(descriptionLabel.text, "Fake description")
    }
    
    func testEventDateLabel() {
        let descriptionLabel = eventsDetailsViewController.baseView.dateLabel
        XCTAssertEqual(descriptionLabel.text, "14/07/2019")
    }
    
    func testEventPriceLabel() {
        let descriptionLabel = eventsDetailsViewController.baseView.priceLabel
        XCTAssertEqual(descriptionLabel.text, "R$ 1,00")
    }
    
    func testImagePlaceholder() {
        let label = eventsDetailsViewController.baseView.eventImageView.subviews.first { $0 is UILabel } as! UILabel
        XCTAssertEqual(label.text, "Fake placeholder")
    }
    
    func testShareButton() {
        XCTAssertFalse(fakeEventDetailsViewModel.shareCalled)
        eventsDetailsViewController.baseView.shareButton.sendActions(for: .touchUpInside)
        XCTAssertTrue(fakeEventDetailsViewModel.shareCalled)
    }
    
    func testCheckinButton() {
        XCTAssertFalse(fakeEventDetailsViewModel.checkinCalled)
        eventsDetailsViewController.baseView.checkinButton.sendActions(for: .touchUpInside)
        XCTAssertTrue(fakeEventDetailsViewModel.checkinCalled)
    }
    
    func testMapsButton() {
        XCTAssertFalse(fakeEventDetailsViewModel.mapsCalled)
        eventsDetailsViewController.baseView.mapsButton.sendActions(for: .touchUpInside)
        XCTAssertTrue(fakeEventDetailsViewModel.mapsCalled)
    }
}

class FakeEventDetailsViewModel: EventDetailsViewModelProtocol {
    var eventDate = "14/07/2019"
    var eventPrice = "R$ 1,00"
    var imagePlaceholderTitle = "Fake placeholder"
    var eventDescription = "Fake description"
    var navigationTitle = "Fake title"
    var eventImageUrl = URL(string: "fakeUrl.com")!
    var error: Dynamic<String?> = Dynamic(nil)
    var successCheckin: Dynamic<String?> = Dynamic(nil)
    var checkinCalled = false
    var shareCalled = false
    var mapsCalled = false
    
    func checkin() {
        checkinCalled = true
    }
    
    func share() {
        shareCalled = true
    }
    
    func maps() {
        mapsCalled = true
    }
}
