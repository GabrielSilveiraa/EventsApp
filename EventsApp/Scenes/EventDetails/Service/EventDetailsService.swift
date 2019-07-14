//
//  EventDetailsService.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 13/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

protocol EventDetailsServiceProtocol: AnyObject {
    func checkin(checkinObject: CheckinObject, completion: @escaping (Result<Bool, Error>) -> Void)
}

class EventDetailsService {
    let networkManager: NetworkManager
    
    init(session: URLSession = .shared) {
        networkManager = NetworkManager(session: session)
    }
}

extension EventDetailsService: EventDetailsServiceProtocol {
    func checkin(checkinObject: CheckinObject, completion: @escaping (Result<Bool, Error>) -> Void) {
        let endPoint = EventApi.checkin(checkinObject)
        networkManager.request(endPoint) { (result: Result<Bool, Error>)  in
            completion(result)
        }
    }
}
