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
    case checkin(_ checkin: CheckinObject)
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
            
        case .checkin:
            return "/checkin"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .eventsList:
            return .get
        
        case .checkin:
            return .post
        }
    }
    
    var encoding: ParameterEncoding? {
        switch self {
        case .eventsList:
            return nil
        
        case .checkin:
            return .jsonEncoding
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .eventsList:
            return [:]
            
        case .checkin(let checkin):
            var parameters: [String: Any] = [:]
            do {
                parameters = try checkin.asDictionary()
            } catch {
                print(error)
            }
            return parameters
        }
    }
}
