//
//  EventsListViewControllerTests.swift
//  EventsAppTests
//
//  Created by Gabriel Silveira on 14/06/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//
// swiftlint:disable force_cast
// swiftlint:disable force_unwrapping

import XCTest
@testable import EventsApp

class EventsListViewControllerTests: XCTestCase {
    var fakeEventsListViewModel: FakeEventsListViewModel!
    var eventsListViewController: EventsListViewController!
    
    override func setUp() {
        super.setUp()
        fakeEventsListViewModel = FakeEventsListViewModel()
        eventsListViewController = EventsListViewController(viewModel: fakeEventsListViewModel)
        _ = eventsListViewController.view
    }

    override func tearDown() {
        super.tearDown()
        fakeEventsListViewModel = nil
        eventsListViewController = nil
    }
    
    func testBind() {
        XCTAssertTrue(fakeEventsListViewModel.loading.isBinded())
        XCTAssertTrue(fakeEventsListViewModel.eventCells.isBinded())
        XCTAssertTrue(fakeEventsListViewModel.error.isBinded())
    }
    
    func testTableViewRow() {
        let tableView = eventsListViewController.baseView.tableView
        XCTAssertEqual(eventsListViewController.tableView(tableView, numberOfRowsInSection: 0), 0)
        let event: Event = loadJson(filename: "Event")!
        fakeEventsListViewModel.eventCells.value = [EventsListCellViewModel(model: event)]
        XCTAssertEqual(eventsListViewController.tableView(tableView, numberOfRowsInSection: 0), 1)
        let cell = eventsListViewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Feira de adoção de animais na Redenção")
    }
    
    func testShowError() {
        UIApplication.shared.keyWindow?.rootViewController = eventsListViewController
        fakeEventsListViewModel.error.value = "Error Test"
        XCTAssertTrue(UIApplication.shared.keyWindow?.rootViewController?.presentedViewController is UIAlertController)
        let alert = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController as! UIAlertController
        XCTAssertEqual(alert.message, "Error Test")
    }
    
    func testLoading() {
        let window = UIWindow()
        window.addSubview(eventsListViewController.view)
        XCTAssertTrue(eventsListViewController.baseView.activityIndicator.isHidden)
        fakeEventsListViewModel.loading.value = true
        XCTAssertFalse(eventsListViewController.baseView.activityIndicator.isHidden)
    }
    
    func testSelectRow() {
        let tableView = eventsListViewController.baseView.tableView
        eventsListViewController.tableView(tableView, didSelectRowAt: IndexPath(row: 1, section: 0))
        XCTAssertEqual(fakeEventsListViewModel.selectedRow, 1)
    }
    
    func testNavigationTitle() {
        XCTAssertEqual(eventsListViewController.title, "Navigation Test")
    }
}

class FakeEventsListViewModel: EventsListViewModelProtocol {
    var navigationTitle = "Navigation Test"
    var eventCells: Dynamic<[EventsListCellViewModelProtocol]> = Dynamic([])
    var loading: Dynamic<Bool> = Dynamic(false)
    var error: Dynamic<String?> = Dynamic(nil)
    var selectedRow: Int?
    
    func didSelect(row: Int) {
        selectedRow = row
    }
}
