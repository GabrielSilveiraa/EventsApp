//
//  EventsListServiceTests.swift
//  EventsAppTests
//
//  Created by Gabriel Silveira on 10/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import XCTest
@testable import EventsApp
// swiftlint:disable force_unwrapping
// swiftlint:disable force_try

class EventsListServiceTests: XCTestCase {
    func testServiceSuccessResponse() {
        let path = Bundle(for: type(of: self)).path(forResource: "EventsSuccess", ofType: "json")!
        let data = NSData(contentsOfFile: path)! as Data
        let httpReponse = HTTPURLResponse(statusCode: 200)
        let session = URLSessionMock(data: data, response: httpReponse)
        let service = EventsListService(session: session)
        var eventsResponse: Events!
        service.getEventsList { (result: Result<Events, Error>) in
            eventsResponse = try! result.get()
        }
        let firstEvent: Event = loadJson(filename: "Event")!
        XCTAssertEqual(eventsResponse.count, 5)
        XCTAssertEqual(firstEvent, eventsResponse.first)
    }
}
