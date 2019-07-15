//
//  Event.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 10/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

typealias Events = [Event]

struct Event: Decodable {
    let id, title, description: String
    let price: Double
    let latitude, longitude: GeoPoint
    let image: URL
    let date: Date
    let people: [Person]
    let cupons: [Cupon]
}

extension Event: Equatable {}

struct Cupon: Decodable {
    let id, eventId: String
    let discount: Int
}

extension Cupon: Equatable {}

enum GeoPoint: Decodable {
    case double(Double)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let geoPoint = try? container.decode(Double.self) {
            self = .double(geoPoint)
            return
        }
        if let geoPoint = try? container.decode(String.self) {
            self = .string(geoPoint)
            return
        }
        throw DecodingError.typeMismatch(GeoPoint.self,
                                         DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for GeoPoint"))
    }
    
    var asDouble: Double {
        switch self {
        case .double(let lat):
            return lat
            
        case .string(let lat):
            return Double(lat) ?? 0.0
        }
    }
}

extension GeoPoint: Equatable {}

struct Person: Decodable {
    let id, eventId, name: String
    let picture: String
}

extension Person: Equatable {}
