//
//  EventEndPoint.swift
//  ServicesApp
//
//  Created by Gabriel Silveira on 09/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

enum EventApi {
    case eventsList
}

extension EventApi: EndPointType {
    var baseURL: URL {
         guard let url = URL(string: Environment.baseUrl) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .eventsList:
            return "/events"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .eventsList:
            return .get
        }
    }
    
    var encoding: ParameterEncoding? {
        switch self {
        case .eventsList:
            return nil
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .eventsList:
            return [:]
        }
    }
}
