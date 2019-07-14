//
//  CheckinObject.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 14/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

struct CheckinObject: Encodable {
    let eventId: String
    let name: String
    let email: String
}
