//
//  EventsListService.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 09/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

enum EventsListServiceError: Error, Equatable {
    case failed
}

extension EventsListServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .failed:
            return "failedError".localized
        }
    }
}

protocol EventsListServiceProtocol: AnyObject {
    func getEventsList(completion: @escaping (Result<[Bool], Error>) -> Void)
}

class EventsListService {
    let networkManager: NetworkManager
    
    init(session: URLSession = .shared) {
        networkManager = NetworkManager(session: session)
    }
}

extension EventsListService: EventsListServiceProtocol {
    func getEventsList(completion: @escaping (Result<[Bool], Error>) -> Void) {
        let endPoint = EventApi.eventsList
        networkManager.request(endPoint) { (result: Result<Bool, Error>)  in
            
        }
    }
}

