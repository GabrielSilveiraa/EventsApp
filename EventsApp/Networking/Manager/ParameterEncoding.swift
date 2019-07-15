//
//  ParameterEncoding.swift
//  ServicesApp
//
//  Created by Gabriel Silveira on 09/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

enum ParameterEncoding {
    case jsonEncoding
    
    public func encode(urlRequest: inout URLRequest,
                       parameters: Parameters?) throws {
        switch self {
        case .jsonEncoding:
            guard let parameters = parameters else { return }
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
    }
}
