//
//  Encodable.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 14/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
